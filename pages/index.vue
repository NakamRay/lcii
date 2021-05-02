<template>
  <v-container fluid>
    <HistoryDrawer/>
    <ExamplesDrawer @update-params="updateParams"/>
    <VariablesDrawer/>

    <v-main>
      <v-container
        class="fill-height pa-0"
        fluid
      >
        <v-row>
          <v-col cols="12" sm="10" offset-sm="1" class="pa-0">
            <v-card
              class="mb-3 customDark"
              style="overflow: auto;"
              id="env"
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
            <v-row class="flex-column ma-0">
              <v-col
                v-for="(feature, key) in features" :key="key"
                class="px-0"
                style="flex-grow: unset;"
              >
                <v-btn icon @click="drawerEvent(key)">
                  <v-icon v-text="feature.icon"></v-icon>
                </v-btn>
              </v-col>
            </v-row>
          </v-col>
        </v-row>

        <!-- Floating Action Button -->
        <Fab @drawer-event="drawerEvent"/>
      </v-container>
    </v-main>
  </v-container>
</template>

<script>
import axios from 'axios'
import { mapState, mapMutations, mapActions, mapGetters } from 'vuex'

import { paramsSettings } from '~/assets/configs.js'
import { helps } from '~/assets/helps.js'
import { examples } from '~/assets/examples.js'

import HistoryDrawer from '~/components/drawers/HistoryDrawer.vue'
import ExamplesDrawer from '~/components/drawers/ExamplesDrawer.vue'
import VariablesDrawer from '~/components/drawers/VariablesDrawer.vue'
import Fab from '~/components/Fab.vue'

export default {
  components: {
    HistoryDrawer,
    ExamplesDrawer,
    VariablesDrawer,
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
    cmdReg: /(?<=^:)[a-z]+/g,

    // for examples
    examples,

    // for helps
    helps,

    // for layouts
    inputFormHeight: 0,
    envHeight: 0,
    consoleHeight: 0,

    // for float button
    fab: false,

    // for lcii
    delHTML: /<([^>]*"[^>]|[^>=])*>/g,
    popInj: /<[^>"]*=[^>"]*>/g,
    emptyToken: 'Empty',
    isRunning: false,
    input: '',
  }),
  computed: {
    ...mapState([
      'console',
      'features',
      'history',
      'variables',
    ]),
  },
  watch: {
    console: function () {
      this.$nextTick(function() {
        var outputWindow = this.$el.querySelector('#outputConsole')
        outputWindow.scrollTop = outputWindow.scrollHeight
      })
    },
    params: function () {
      console.log(this.params)
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
    enter () {
      const input = this.input

      if (!input) return

      this.input = ''

      let match

      // Command
      match = input.match(this.cmdReg)
      if (match) {
        const cmd = match[0]
        let args = input.match(/(?<=^:[a-z]+\s+).*/)
        if (args) {
          args = args[0].match(/\S+/g)
        }
        console.log(match)
        console.log(cmd)
        console.log(args)
        this.command(cmd, args)
        return
      }

      // Define a variable
      match = input.match(/^\$([A-Z]|[a-z])+\s*=\s*/g)
      if (match) {
        const lhs = input.match(/^\$([A-Z]|[a-z])+/g)[0]
        const rhs = input.replace(match[0], '')

        if (!rhs) {
          this.addLine({ text: this.invalidInputMessage } )
          return
        }

        this.$store.commit('updateVariables', { [lhs]: rhs })
        this.addLine({ text: `${lhs} = ${rhs.replace('<', '&lt;').replace('>', '&gt;')}` } )
        console.log(this.variables)
        return
      }

      this.addLine({ text: this.invalidInputMessage } )
    },
    command (cmd, args) {
      if (cmd === 'total') {
        if (!args) {
          this.addLine({ text: this.argumentEmptyMessage } )
          return
        }
        if (args.length > 1) {
          this.addLine({ text: this.invalidArgumentMessage } )
          return
        }

        const arg = args[0]

        this.addLine({ text: 'Total: ' + arg } )
        this.params.total.value = arg
        return
      }
      if (cmd === 'result') {
        if (!args) {
          this.addLine({ text: this.argumentEmptyMessage } )
          return
        }
        if (args.length > 1) {
          this.addLine({ text: this.invalidArgumentMessage } )
          return
        }

        const arg = args[0]

        this.addLine({ text: 'Result: ' + arg } )
        this.params.result.value = arg
        return
      }
      if (cmd === 'calc') {
        this.calc(args)
        return
      }
      if (cmd === 'show' || cmd === 's') {
        this.addLine([{ text: '<br>' }, { text: 'Variable(s)' }] )

        if (!args) {
          if (Object.keys(this.variables).length === 0) {
            this.addLine({ text: 'None' } )
          } else {
            for (let variable in this.variables) {
              this.addLine({ text: `${variable} = ${this.variables[variable].replace('<', '&lt;').replace('>', '&gt;')}` } )
            }
          }
          return
        }

        for (let arg of args) {
          for (let variable in this.variables) {
            if (variable === `${arg}` || variable === `$${arg}`) {
              this.addLine({ text: `${variable} = ${this.variables[variable].replace('<', '&lt;').replace('>', '&gt;')}` } )
            }
          }
        }
        return
      }
      if (cmd === 'clear' || cmd === 'c') {
        this.clear()
        return
      }
      if (cmd === 'quit' || cmd === 'q') {
        this.addLine({ text: '> quit' } )
        this.init(true)
        return
      }
      if (cmd === 'help' || cmd === 'h') {
        const helps = this.helps
        this.addLine([{ text: '<br>' }, { text: '<b>Help</b>' }] )
        for (let i = 0; i < helps.length; i++) {
          this.addLine({ text: `Command: ${helps[i].cmd} ${helps[i].shortCmd ? helps[i].shortCmd : ''}` } )

          if (helps[i].options.length > 0) {
            let option = ''
            for(let j = 0; j < helps[i].options.length; j++) {
              option += ` ${helps[i].options[j]}`
            }
            this.addLine({ text: `Option:${option}` } )
          }
          
          this.addLine([{ text: `${helps[i].desc}` }, { text: '<br>' }] )
        }
        return
      }
      if (cmd === 't') {
        let test = "x xs"
        const regexp = new RegExp(`x`,'g')
        let matches = test.matchAll(/x/g)

        for (let match of matches) {
          let before = test.slice(0, match.index)
          let after  = test.slice(match.index + match.length, test.length)
          console.log(match)
          console.log(before + 'y' + after)
        }
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
        var redex = text.replace(this.delHTML,'').substring(0,1)
        if (text !== '') {
          if (!isNaN(redex)) {
            addOutputs.push({ text: text, redex: parseInt(redex) })
          } else {
            addOutputs.push({ text: text })
          }
        }
      }

      this.addLine(addOutputs )
    },
    isVarExists (input) {
      return this.allVariables(input).length > 0
    },
    hasInvalidVariable (input) {
      if (!this.allVariables(input)) return false
      for (let variable of this.allVariables(input)) {
        if (!this.variables.hasOwnProperty(variable)) {
          return true
        }
      }
      return false
    },
    allVariables (input) {
      // let allVariables = {}

      // for (let variable in this.variables) {
      //   const regexp = new RegExp(`${variable}\s+`,'g')
      //   if (regexp.test(input)) {
      //     allVariables[variable] = this.variables[variable]
      //   }
      // }

      let match = input.match(/\$([A-Z]|[a-z])+/g)
      if (!match) {
        return []
      }
      return match
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
    init (isNewLine) {
      let state = this.params

      for(var param in state) {
        state[param].value = state[param].default
      }

      if (isNewLine) {
        this.addLine([{ text: '<br>' }, { text: this.initialMessage }] )
      } else {
        this.addLine({ text: this.initialMessage } )
      }
      console.log(this.params)
    },
    clear () {
      this.addHistory([...this.console, { text: '---------------- Clear ----------------' }])
      this.initConsole()
      this.init()
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
  },
  mounted () {
    this.inputFormHeight = this.$el.querySelector('#inputForm').clientHeight
    this.envHeight = this.$el.querySelector('#env').clientHeight
    window.addEventListener('resize', this.updateConsoleHeight)
    this.updateConsoleHeight()
  },
  destroyed() {
    window.removeEventListener('resize', this.updateConsoleHeight)
  },
}
</script>

<style>
.drawer-text {
  font-size: 13px;
}
.theme--dark.v-divider {
  border-color: #424242 !important;
}
.theme--dark.v-text-field--solo > .v-input__control > .v-input__slot {
  background-color: #1e1e1e !important;
}
.customDark {
  background-color: #1e1e1e !important;
  border: medium solid #424242;
}
p.text--primary {
  margin-bottom: 3px !important;
}
.theme--dark.v-alert {
    background-color: #303030 !important;
}
</style>
