<template>
  <v-container fluid>
    <!-- Drawers -->
    <HistoryDrawer/>
    <ExamplesDrawer @update-params="updateParams"/>
    <VariablesDrawer/>
    
    <!-- Floating Action Button -->
    <Fab @drawer-event="drawerEvent"/>
    
    <v-main>
      <v-row>
        <v-col cols="12" sm="10" offset-sm="1" class="pa-0">
          <v-card
            class="mb-3 customDark"
            style="overflow: auto;"
            id="paramsCard"
          >
            <v-list-item three-line class="pr-2">
              <v-list-item-content class="pt-0 pb-2">
                <v-row>
                  <v-col
                    v-for="(param, key) in params" :key="key"
                    :cols="param.half ? 6 : 12" class="py-0"
                  >
                    <v-text-field
                      v-if="param.visible"
                      :label="param.display"
                      v-model="param.value"
                      spellcheck="false"
                      hide-details
                      flat
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-list-item-content>
            </v-list-item>
          </v-card>

          <v-card
            :height='consoleHeight'
            style="overflow: auto;"
            id="outputConsole"
            class="customDark"
          >
            <v-list class="py-3">
              <v-list-item
                style="min-height: 25px; color: white;"
                v-for="(output,index) in console" :key="index"
              >
                <v-list-item-title>
                  <span class="drawer-text" v-html="output.text"></span>
                </v-list-item-title>
              </v-list-item>
            </v-list>
          </v-card>

          <v-form id="inputForm" @submit.prevent>
            <v-text-field
              v-model="input"
              label="Input"
              dense
              solo
              hide-details
              @keyup.enter="enter()"
              spellcheck="false"
              class="my-0 customDark"
            ></v-text-field>
          </v-form>
        </v-col>

        <v-col
          cols="1"
          class="text-center pl-0 d-none d-sm-flex"
        >
          <Features @drawer-event="drawerEvent"/>
        </v-col>
      </v-row>
    </v-main>
  </v-container>
</template>

<script>
import axios from 'axios'
import { mapState, mapMutations, mapActions, mapGetters } from 'vuex'

import { paramsSettings } from '~/assets/configs.js'

import HistoryDrawer from '~/components/drawers/HistoryDrawer.vue'
import ExamplesDrawer from '~/components/drawers/ExamplesDrawer.vue'
import VariablesDrawer from '~/components/drawers/VariablesDrawer.vue'
import Features from '~/components/Features.vue'
import Fab from '~/components/Fab.vue'

export default {
  components: {
    HistoryDrawer,
    ExamplesDrawer,
    VariablesDrawer,
    Features,
    Fab
  },
  data: () => ({
    // for axios
    paramsSettings,
    params: {},
    // baseUrl: 'http://www.sofsci.cs.gunma-u.ac.jp/ii/api/',
    baseUrl: 'http://localhost/',
    api: 'api.php',

    // for console
    initialMessage: ':help :h ヘルプ',
    invalidInputMessage: '無効な入力です．',
    argumentEmptyMessage: '引数を指定してください．（:helpでヘルプ）',
    invalidArgumentMessage: '引数が不正です．（:helpでヘルプ）',
    connectionErrorMessage: 'サーバとの通信中にエラーが発生しました．',
    input: '',

    // for layouts
    inputFormHeight: 0,
    envHeight: 0,
    consoleHeight: 0,
  }),
  computed: {
    ...mapState([
      'console',
      'features',
      'history',
      'variables',
    ]),
    ...mapGetters([
      'allVariables',
      'hasInvalidVariable'
    ]),
  },
  watch: {
    // scroll the console to bottom when it changes
    console: function () {
      this.$nextTick(function() {
        var outputWindow = this.$el.querySelector('#outputConsole')
        outputWindow.scrollTop = outputWindow.scrollHeight
      })
    }
  },
  methods: {
    ...mapMutations([
      'initConsole',
      'addLine',
      'addHistory',
      'updateVariables',
      'deleteVariables',
      'openDrawer',
      'closeDrawers',
    ]),
    ...mapActions([
      'showVariables',
      'showHelps',
    ]),
    enter () {
      const input = this.input

      if (!input) return

      this.input = ''

      let match

      // Command
      match = input.match(/^:([a-z]+)\s*(.*)/)
      if (match) {
        const cmd = match[1]
        const args = match[2].split(' ')

        console.log(cmd)
        console.log(args)
        this.command(cmd, args)
        return
      }

      // Define a variable
      match = input.match(/(^\$[A-Za-z]+\d*)(?:\s*=\s*)(.+[^\s])/)
      if (match) {
        const lhs = match[1]
        const rhs = match[2]

        this.updateVariables({ [lhs]: rhs })
        this.addLine({ text: `${lhs} = ${rhs.replace('<', '&lt;').replace('>', '&gt;')}` } )
        return
      }

      // Set a param
      match = input.match(/(^.+[^\s])(?:\s*=\s*)(.+[^\s])/)
      if (match) {
        const lhs = match[1]
        const rhs = match[2]

        this.addLine({ text: `> ${lhs} = ${rhs}` } )

        for (let param of Object.values(this.params)) {
          if (param.display === lhs) {
            param.value = rhs
            return
          }
        }

        this.addLine({ text: this.invalidInputMessage } )
        return
      }

      this.addLine({ text: this.invalidInputMessage } )
    },
    command (cmd, args) {
      if (cmd === 'calc') {
        this.calc(args)
        return
      }
      if (cmd === 'show' || cmd === 's') {
        this.showVariables(args)
        return
      }
      if (cmd === 'clear' || cmd === 'c') {
        this.clear()
        return
      }
      if (cmd === 'quit' || cmd === 'q') {
        this.addLine({ text: '> quit' } )
        this.init()
        this.addLine([{ text: '<br>' }, { text: this.initialMessage }] )
        return
      }
      if (cmd === 'help' || cmd === 'h') {
        this.showHelps()
        return
      }
    },
    calc (args) {
      if (!args) {
        this.addLine({ text: this.argumentEmptyMessage } )
        return
      }

      if (this.hasInvalidVariable(args.join(''))) {
        this.addLine({ text: this.invalidArgumentMessage } )
        return
      }

      console.log(args)

      args = args.map(arg => {
        return this.substitution(arg)
      })
      
      this.addLine({ text: `Calc: ${args[0]} ${args[1]} ${args[2]}` } )
      this.params.formula.value = `${args[0]} ${args[1]} ${args[2]}`
      this.params.mode.value = args[1]

      console.log(this.params.mode.value)
      // this.sendReq()
    },
    substitution (input) {
      for (let variable of this.allVariables(input)) {
        const test = `\\${variable}`
        const regexp = new RegExp(test)
        input = input.replace(regexp, this.variables[variable])
        console.log(variable + ' -> ' + this.variables[variable])
      }

      return input
    },
    sendReq () {
      let request = new URLSearchParams()

      for(var param in this.params) {
        request.append(this.params[param].name, this.params[param].value)
        console.log(this.params[param].name + ': ' + this.params[param].value)
      }

      var vm = this

      axios.post(this.baseUrl + this.api, request)
        .then(function(response){
          var opt = response.data
          console.log(opt)

          vm.pushResults(optSplit)
          vm.addLine([{ text: '<br>' }, { text: vm.initialMessage }] )
        })
        .catch(function(err){
          vm.addLine({ text: vm.connectionErrorMessage } )
          console.error(err)
        })
    },
    pushResults (optSplit) {
      var addOutputs = []

      for (var i = 0; i < optSplit.length; i++) {
        var text = optSplit[i]
        if (text !== '') {
          addOutputs.push({ text: text })
        }
      }

      this.addLine(addOutputs)
    },
    updateParams (args) {
      for(var arg in args) {
        this.$set(this.params[arg], 'value', args[arg])
      }
      this.$forceUpdate()
    },
    drawerEvent (key) {
      if (key === 'clear') {
        this.clear()
      } else if (this.features[key].hasOwnProperty('drawer')) {
        this.openDrawer(key)
      } else {
        this.calc()
      }
    },
    init () {
      for(var param in this.params) {
        this.params[param].value = this.params[param].default
      }
    },
    clear () {
      this.addHistory([...this.console, { text: '---------------- Clear ----------------' }])
      this.initConsole()
      this.init()
      this.addLine({ text: this.initialMessage } )
    },
    updateConsoleHeight () {
      this.consoleHeight = window.innerHeight - this.inputFormHeight - this.envHeight - 100
    }
  },
  created () {
    for(var param in this.paramsSettings) {
      this.params[param] = this.paramsSettings[param]
      this.params[param].value = this.paramsSettings[param].default
    }
    this.init()
    this.addLine({ text: this.initialMessage } )
  },
  mounted () {
    this.inputFormHeight = this.$el.querySelector('#inputForm').clientHeight
    this.envHeight = this.$el.querySelector('#paramsCard').clientHeight
    window.addEventListener('resize', this.updateConsoleHeight)
    this.updateConsoleHeight()
  },
  destroyed() {
    window.removeEventListener('resize', this.updateConsoleHeight)
  },
}
</script>

<style src="~/assets/styles.css"/>
