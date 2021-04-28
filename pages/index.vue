<template>
  <v-container fluid>
    <v-navigation-drawer
      v-model="historyDrawer"
      disable-resize-watcher
      temporary
      app
      right
      width="500"
      class="customDark"
    >
      <v-list class="py-0">
        <v-subheader style="height: 49px;">
          <h1>HISTORY</h1>
          <v-spacer></v-spacer>
          <v-btn icon @click.stop="historyDrawer = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-subheader>
        <v-divider></v-divider>
        <v-list-item
          style="min-height: 25px;"
          v-for="(ahistory,index) in history" :key="index"
        >
          <v-list-item-title>
            <span class="drawer-text" v-html="ahistory.text"></span>
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-navigation-drawer
      v-model="examplesDrawer"
      disable-resize-watcher
      temporary
      app
      right
      width="500"
    >
      <v-list class="py-0">
        <v-subheader style="height: 49px;">
          <h1>EXAMPLES</h1>
          <v-spacer></v-spacer>
          <v-btn icon @click.stop="examplesDrawer = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-subheader>
        <v-divider></v-divider>
        <v-tabs>
          <v-tab>Typed</v-tab>
          <v-tab>Untyped</v-tab>
          <v-tab-item>
            <v-list-item
              style="min-height: 15px;"
              v-for="(example,index) in typedExamples" :key="index"
              v-ripple="{ class: 'red--text' }"
              @click.stop="addExampleTypedTerm(example)"
            >
              <v-list-item-title>
                <v-alert
                  class="py-1 my-1"
                  color="red"
                  border="left"
                  elevation="2"
                  colored-border
                >
                  <div class="drawer-text my-2">Ξ: {{example.envType}}</div>
                  <v-divider class="my-1"></v-divider>
                  <div class="drawer-text my-2">Γ: {{example.envTerm}}</div>
                  <v-divider class="my-1"></v-divider>
                  <div class="overline">TERM</div>
                  <span class="drawer-text">{{example.term}}</span>
                </v-alert>
              </v-list-item-title>
            </v-list-item>
          </v-tab-item>
          <v-tab-item>
            <v-list-item
              style="min-height: 15px;"
              v-for="(example,index) in untypedExamples" :key="index"
              v-ripple="{ class: 'red--text' }"
              @click.stop="addExampleUntypedTerm(example)"
            >
              <v-list-item-title>
                <v-alert
                  class="py-2 my-1"
                  color="red"
                  border="left"
                  elevation="2"
                  colored-border
                >
                  <div class="overline">TERM</div>
                  <span class="drawer-text">{{example.term}}</span>
                </v-alert>
              </v-list-item-title>
            </v-list-item>
          </v-tab-item>
        </v-tabs>
      </v-list>
    </v-navigation-drawer>

    <v-navigation-drawer
      v-model="defsDrawer"
      disable-resize-watcher
      temporary
      app
      right
      width="500"
    >
      <v-list class="py-0">
        <v-subheader style="height: 49px;">
          <h1>DEFINITIONS</h1>
          <v-spacer></v-spacer>
          <v-btn icon @click.stop="defsDrawer = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-subheader>
        <v-divider></v-divider>
        <v-list-item
          v-for="(def, i) in defs" :key="i"
          style="height: 50px;"
          class="px-3"
        >
          <v-list-item-title>
            {{ def.binder }} = {{ def.exp }}
          </v-list-item-title>

          <v-spacer></v-spacer>

          <v-list-item-action>
            <v-btn icon @click="defs.splice(i, 1)">
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </v-list-item-action>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

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
                        v-for="(param, i) in paramsState" :key="i"
                        cols="6" class="py-0"
                      >
                        <v-text-field v-if="param.visible"
                          :label="param.display"
                          v-model="param.value"
                          spellcheck="false"
                          hide-details
                          flat
                        ></v-text-field>
                      </v-col>

                      <v-list-item-action style="position: absolute; right: 20px; bottom: -10px;">
                        <v-row class="mx-0 d-flex flex-row">
                          <div class="mr-3">
                            <div class="caption">Untyped</div>
                            <div class="mx-auto d-flex justify-center">
                              <v-switch v-model="paramsState.isUntyped.value" :disabled="isRunning" dense></v-switch>
                            </div>
                          </div>
                          <div class="d-flex align-center">
                            <v-btn
                              icon
                              @click="run()"
                            >
                              <v-icon>mdi-play</v-icon>
                            </v-btn>
                          </div>
                        </v-row>
                      </v-list-item-action>
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
              <v-list class="py-0">
                <v-list-item
                  style="min-height: 25px; color: white;"
                  v-for="(output,index) in console" :key="index"
                  :disabled="!output.hasOwnProperty('redex')"
                  @click="paramsState.redexNumber.value = output.redex; submitNum()"
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
              <v-col class="px-0" style="flex-grow: unset;">
                <v-btn icon @click="clear">
                  <v-icon>mdi-delete</v-icon>
                </v-btn>
              </v-col>

              <v-col class="px-0" style="flex-grow: unset;">
                <v-btn icon @click="closeDrawer(); historyDrawer = !historyDrawer">
                  <v-icon>mdi-history</v-icon>
                </v-btn>
              </v-col>

              <v-col class="px-0" style="flex-grow: unset;">
                <v-btn icon @click="closeDrawer(); examplesDrawer = !examplesDrawer">
                  <v-icon>mdi-lambda</v-icon>
                </v-btn>
              </v-col>

              <v-col class="px-0" style="flex-grow: unset;">
                <v-btn icon @click="closeDrawer(); defsDrawer = !defsDrawer">
                  <v-icon>mdi-order-alphabetical-ascending</v-icon>
                </v-btn>
              </v-col>
            </v-row>
          </v-col>
        </v-row>

        <!-- Float Button -->
        <v-speed-dial
          class="d-flex d-sm-none"
          v-model="fab"
          bottom
          right
          absolute
          direction="top"
          transition="slide-y-reverse-transition"
        >
          <template v-slot:activator>
            <v-btn
              v-model="fab"
              color="blue darken-2"
              dark
              fab
            >
              <v-icon v-if="fab">mdi-close</v-icon>
              <v-icon v-else>mdi-menu</v-icon>
            </v-btn>
          </template>
          <v-btn
            fab
            dark
            small
            color="purple"
            @click="closeDrawer(); defsDrawer = !defsDrawer"
          >
            <v-icon>mdi-order-alphabetical-ascending</v-icon>
          </v-btn>
          <v-btn
            fab
            dark
            small
            color="green"
            @click="closeDrawer(); examplesDrawer = !examplesDrawer"
          >
            <v-icon>mdi-lambda</v-icon>
          </v-btn>
          <v-btn
            fab
            dark
            small
            color="indigo"
            @click="closeDrawer(); historyDrawer = !historyDrawer"
          >
            <v-icon>mdi-history</v-icon>
          </v-btn>
          <v-btn
            fab
            dark
            small
            color="red"
            @click="clear"
          >
            <v-icon>mdi-delete</v-icon>
          </v-btn>
        </v-speed-dial>
      </v-container>
    </v-main>
  </v-container>
</template>

<script>
import axios from 'axios'
import { mapState, mapMutations, mapActions, mapGetters } from 'vuex'

import { params } from '~/assets/configs.js'
import { helps } from '~/assets/helps.js'
import { typedExamples, untypedExamples } from '~/assets/examples.js'

export default {
  data: () => ({
    // for axios
    params,
    paramsState: {},
    // baseUrl: 'http://www.sofsci.cs.gunma-u.ac.jp/ii/api/',
    baseUrl: 'http://localhost/',
    api: 'api.php',

    // for examples
    typedExamples,
    untypedExamples,

    // for helps
    helps,

    // for layouts
    inputFormHeight: 0,
    envHeight: 0,
    consoleHeight: 0,

    // for drawers
    historyDrawer: false,
    examplesDrawer: false,
    defsDrawer: false,

    // for lcii
    delHTML: /<([^>]*"[^>]|[^>=])*>/g,
    popInj: /<[^>"]*=[^>"]*>/g,
    emptyToken: 'Empty',
    initialMessage: ':help :h ヘルプ',
    invalidInputMessage: '無効な入力です．',
    argumentEmptyMessage: '引数を指定してください．（:helpでヘルプ）',
    connectionErrorMessage: 'サーバとの通信中にエラーが発生しました．',
    isRunning: false,
    fab: false,
    input: '',
    history: [],
    defs: [],
  }),
  computed: {
    ...mapMutations([
      'initConsole',
      'addLine'
    ]),
    ...mapGetters([
      'console'
    ]),
  },
  watch: {
    console: function () {
      this.$nextTick(function() {
        var outputWindow = this.$el.querySelector('#outputConsole')
        outputWindow.scrollTop = outputWindow.scrollHeight
      })
    }
  },
  methods: {
    enter () {
      const input = this.input

      if (!input) return

      this.input = ''

      let match

      // Command
      match = input.match(/^:[a-z]+\s*/g)
      if (match) {
        const cmd = input.match(/(?<=^:)[a-z]+/g)[0]
        const value = input.replace(match[0], '')
        console.log(cmd)
        console.log(value)
        this.command(cmd, value)
        return
      }

      // Define
      match = input.match(/^\$([A-Z]|[a-z])+\s*=\s*/g)
      if (match) {
        const lhs = input.match(/^\$([A-Z]|[a-z])+/g)[0]
        const rhs = '('+ input.replace(match[0], '') + ')'

        if (!rhs) {
          this.$store.commit('addLine', { text: this.invalidInputMessage } )
          return
        }

        for (let i = 0; i < this.defs.length; i++) {
          if (this.defs[i].binder === lhs) {
            this.defs[i].exp = rhs
            this.$store.commit('addLine', { text: `${lhs} = ${rhs.replace('<', '&lt;').replace('>', '&gt;')}` } )
            return
          }
        }

        this.defs.push( { binder: lhs, exp: rhs } )
        this.$store.commit('addLine', { text: `${lhs} = ${rhs.replace('<', '&lt;').replace('>', '&gt;')}` } )
        console.log(this.defs)
        return
      }

      // Variable
      match = input.match(/^\$([A-Z]|[a-z])+$/g)
      if (match) {
        if (this.defs.length > 0) {
          for (let i = 0; i < this.defs.length; i++) {
            if (this.defs[i].binder === match[0]) {
              this.$store.commit('addLine', { text: `${match[0]} = ${this.defs[i].exp.replace('<', '&lt;').replace('>', '&gt;')}` } )
              return
            }
          }
        }
      }

      // Submit Number
      if (this.isRunning && input && !isNaN(Number(input))) {
        this.paramsState.redexNumber.value = input
        this.submitNum()
        return
      }

      this.$store.commit('addLine', { text: this.invalidInputMessage } )
    },
    command (cmd, value) {
      if (cmd === 'xi') {
        if (!value) {
          this.$store.commit('addLine', { text: this.argumentEmptyMessage } )
          return
        }
        this.$store.commit('addLine', { text: 'Ξ: ' + value.replace('<', '&lt;').replace('>', '&gt;') } )
        this.paramsState.typeContext.value = value
        return
      }
      if (cmd === 'ga') {
        if (!value) {
          this.$store.commit('addLine', { text: this.argumentEmptyMessage } )
          return
        }
        this.$store.commit('addLine', { text: 'Γ: ' + value.replace('<', '&lt;').replace('>', '&gt;') } )
        this.paramsState.termContext.value = value
        return
      }
      if (cmd === 'lambda' || cmd === 'l') {
        if (!value) {
          this.$store.commit('addLine', { text: this.argumentEmptyMessage } )
          return
        }

        let newTerm = value

        if (this.defs.length > 0) {
          while (this.isVarExists(newTerm)) {
            console.log(this.defs)
            for (let i = 0; i < this.defs.length; i++) {
              const binder = `\\${this.defs[i].binder}`
              const regexp = new RegExp(binder,'g')
              newTerm = newTerm.replace(regexp, this.defs[i].exp)
              console.log(regexp)
            }
          }
        }

        this.$store.commit('addLine', { text: 'λ-term: ' + newTerm.replace('<', '&lt;').replace('>', '&gt;') } )
        this.paramsState.initialLambdaTerm.value = newTerm
        return
      }
      if (cmd === 'type' || cmd === 't') {
        this.typingCheck()
        return
      }
      if (cmd === 'run' || cmd === 'r') {
        if (value === '-untyped' || value === '-u') {
          this.paramsState.isUntyped.value = true
        } else {
          this.paramsState.isUntyped.value = false
        }

        this.run()
        return
      }
      if (cmd === 'show' || cmd === 's') {
        this.$store.commit('addLines', [{ text: '<br>' }, { text: 'Definitions' }] )
        if (this.defs.length === 0) {
          this.$store.commit('addLine', { text: 'None' } )
        }
        this.defs.forEach(def => {
          this.$store.commit('addLine', { text: `${def.binder} = ${def.exp.replace('<', '&lt;').replace('>', '&gt;')}` } )
        })
        return
      }
      if (cmd === 'clear' || cmd === 'c') {
        this.clear()
        return
      }
      if (cmd === 'quit' || cmd === 'q') {
        this.$store.commit('addLine', { text: '> quit' } )
        this.init(true)
        return
      }
      if (cmd === 'help' || cmd === 'h') {
        const helps = this.helps
        this.$store.commit('addLines', [{ text: '<br>' }, { text: '<b>Help</b>' }] )
        for (let i = 0; i < helps.length; i++) {
          this.$store.commit('addLine', { text: `Command: ${helps[i].cmd} ${helps[i].shortCmd ? helps[i].shortCmd : ''}` } )

          if (helps[i].options.length > 0) {
            let option = ''
            for(let j = 0; j < helps[i].options.length; j++) {
              option += ` ${helps[i].options[j]}`
            }
            this.$store.commit('addLine', { text: `Option:${option}` } )
          }
          
          this.$store.commit('addLines', [{ text: `${helps[i].desc}` }, { text: '<br>' }] )
        }
        return
      }
    },
    run () {
      if (this.paramsState.initialLambdaTerm === this.emptyToken) {
        this.$store.commit('addLine', { text: 'ラムダ式をセットしてください．（:helpでヘルプ）' } )
        return
      }

      this.paramsState.lambdaTerm.value = this.paramsState.initialLambdaTerm.value

      this.isRunning = true
      this.$store.commit('addLines', [
        { text: '<br>' },
        { text: '> run LCII' + (this.paramsState.isUntyped.value ? '(Untyped)' : '') },
        { text: '<br>' }
      ])
      this.submitTerm()
    },
    submitTerm () {
      this.paramsState.mode.value = 'init'

      let params = new URLSearchParams()

      for(var param in this.paramsState) {
        params.append(this.paramsState[param].name, this.paramsState[param].value)
        console.log(this.paramsState[param].name + ': ' + this.paramsState[param].value)
      }

      var vm = this

      axios.post(this.baseUrl + this.api, params)
        .then(function(response){
          var opt = response.data
          console.log(opt)
          if (opt.includes('Parse Error')) {
            vm.$store.commit('addLine', { text: '無効な入力です．画面右上の「USAGE」からラムダ式または型環境の記法を参照してください．' } )
            vm.init(true)
            return
          }

          var optSplit = vm.replaceInj(opt).split('<br>')
          
          vm.pushResults(optSplit)

          if (opt.indexOf('Normal') === -1 && opt.indexOf('Error') === -1) {
            vm.paramsState.lambdaTerm.value = optSplit[0].replace(vm.delHTML,'')
            console.log(vm.paramsState.lambdaTerm.value)
          } else {
            vm.isRunning = false
            vm.paramsState.lambdaTerm.value = vm.emptyToken
            
            vm.$store.commit('addLines', [{ text: '<br>' }, { text: vm.initialMessage }] )
          }
        })
        .catch(function(err){
          vm.$store.commit('addLine', { text: vm.connectionErrorMessage } )
          console.error(err)
        })
    },
    submitNum () {
      this.paramsState.mode.value = 'red'

      let params = new URLSearchParams()

      for(var param in this.paramsState) {
        params.append(this.paramsState[param].name, this.paramsState[param].value)
        console.log(this.paramsState[param].name + ': ' + this.paramsState[param].value)
      }

      var vm = this

      axios.post(this.baseUrl + this.api, params)
        .then(function(response){
          vm.$store.commit('addLines', [{ text: '> ' + vm.paramsState.redexNumber.value }, { text: '<br>' }] )
          var opt = response.data
          console.log(opt)

          var optSplit = vm.replaceInj(opt).split('<br>')

          vm.pushResults(optSplit)

          if (opt.indexOf('maximum') !== -1) {
            vm.$store.commit('addLines', [{ text: '簡約したいRedexの番号を入力してください．' }, { text: '<br>' }] )
            return
          }
          if (opt.indexOf('Normal') === -1 && opt.indexOf('Error') === -1) {
            if (opt.indexOf('α') !== -1) {
              vm.paramsState.lambdaTerm.value = optSplit[1].replace(vm.delHTML,'')
            } else {
              vm.paramsState.lambdaTerm.value = optSplit[0].replace(vm.delHTML,'')
            }
            console.log(vm.paramsState.lambdaTerm.value)
          } else {
            vm.isRunning = false
            vm.paramsState.lambdaTerm.value = vm.emptyToken
            
            vm.$store.commit('addLines', [{ text: '<br>' }, { text: vm.initialMessage }] )
          }
        })
        .catch(function(err){
          vm.$store.commit('addLine', { text: vm.connectionErrorMessage } )
          console.error(err)
        })
    },
    typingCheck () {
      if (this.paramsState.initialLambdaTerm === this.emptyToken) {
        this.$store.commit('addLine', { text: 'ラムダ式をセットしてください．（:helpでヘルプ）' } )
        return
      }

      this.paramsState.mode.value = 'check'

      let params = new URLSearchParams()

      for(var param in this.paramsState) {
        params.append(this.paramsState[param].name, this.paramsState[param].value)
        console.log(this.paramsState[param].name + ': ' + this.paramsState[param].value)
      }

      var vm = this

      axios.post(this.baseUrl + this.api, params)
        .then(function(response){
          var opt = response.data

          if (opt === '') {
            vm.$store.commit('addLine', { text: 'ラムダ式が型無しです．' } )
          } else {
            vm.$store.commit('addLine', { text: opt } )
          }
        })
        .catch(function(err){
          vm.$store.commit('addLine', { text: vm.connectionErrorMessage } )
          console.error(err)
        })
    },
    replaceInj (opt) {
      // Injectとマッチした部分は<>がHTMLタグと混同されるのでコードに置き換える
      var match = opt.match(this.popInj)
      var text = opt
      if (match) {
        match.forEach(x => {
          text = text.replace(x, '&lt;' + x.substring(1, x.length - 1) + '&gt;')
        })
      }
      return text
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

      this.$store.commit('addLines', addOutputs )
    },
    addExampleTypedTerm (example) {
      this.paramsState.isUntyped.value = false
      this.paramsState.initialLambdaTerm.value = example.term
      this.paramsState.lambdaTerm.value = example.term
      this.paramsState.typeContext.value = example.envType
      this.paramsState.termContext.value = example.envTerm
      this.examplesDrawer = false
    },
    addExampleUntypedTerm (example) {
      this.paramsState.isUntyped.value = true
      this.paramsState.initialLambdaTerm.value = example.term
      this.paramsState.lambdaTerm.value = example.term
      this.paramsState.typeContext.value = this.emptyToken
      this.paramsState.termContext.value = this.emptyToken
      this.examplesDrawer = false
    },
    isVarExists (input) {
      if (this.defs.length === 0) return false
      for (let i = 0; i < this.defs.length; i++) {
        const binder = `\\${this.defs[i].binder}`
        const regexp = new RegExp(binder,'g')
        if (regexp.test(input)) return true
      }
      return false
    },
    init (isNewLine) {
      this.isRunning = false

      this.paramsState.initialLambdaTerm.value = this.emptyToken
      this.paramsState.lambdaTerm.value = this.emptyToken
      this.paramsState.typeContext.value = this.emptyToken
      this.paramsState.termContext.value = this.emptyToken
      
      if (isNewLine) {
        this.$store.commit('addLines', [{ text: '<br>' }, { text: this.initialMessage }] )
      } else {
        this.$store.commit('addLine', { text: this.initialMessage } )
      }
    },
    closeDrawer () {
      this.historyDrawer = false
      this.examplesDrawer = false
      this.defsDrawer = false
    },
    clear () {
      this.history.push( ...this.console, { text: '---------------- Clear ----------------' } )
      this.$store.commit('initConsole')
      this.init()
    },
    updateConsoleHeight () {
      this.consoleHeight = window.innerHeight - this.inputFormHeight - this.envHeight - 100
    }
  },
  created () {
    for(var param in this.params) {
      this.paramsState[param] = this.params[param]
      this.paramsState[param].value = this.params[param].default
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
