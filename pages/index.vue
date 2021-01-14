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
          v-ripple="{ class: 'red--text' }"
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

    <!-- Dialog -->
    <v-dialog v-model="editDialog" persistent max-width="600px">
      <v-card>
        <v-card-title>
          <span class="headline">Edit Environment</span>
        </v-card-title>
        <v-card-text>
          <v-text-field label="Ξ: Type Context" :value="xi" v-model="editedXi" spellcheck="false" required></v-text-field>
          <v-text-field label="Γ: Term Context" :value="ga" v-model="editedGa" spellcheck="false" required></v-text-field>
          <v-text-field label="λ: Term" :value="originalTerm" v-model="editedTerm" spellcheck="false" required></v-text-field>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="editDialog = false">Close</v-btn>
          <v-btn color="blue darken-1" text @click="saveEditedEnv" :disabled="editedXi == '' || editedGa == '' || editedTerm == ''">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

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
                    <v-col cols="6" class="py-0">
                      <div class="overline">TYPE CONTEXT</div>
                      <v-list-item-title class="text--primary">
                        {{ xi }}
                      </v-list-item-title>
                    </v-col>
                    <v-col cols="6" class="py-0">
                      <div class="overline">TERM CONTEXT</div>
                      <v-list-item-title class="text--primary">
                        {{ ga }}
                      </v-list-item-title>

                      <v-btn
                        icon
                        style="position: absolute; right: 20px; top: 20px;"
                        @click.stop="editedXi = xi; editedGa = ga; editedTerm = originalTerm; editDialog = true"
                      >
                        <v-icon>mdi-square-edit-outline</v-icon>
                      </v-btn>
                    </v-col>
                  </v-row>

                  <v-divider class="mt-1"></v-divider>

                  <div class="overline">LAMBDA TERM</div>
                  <v-list-item-title class="text--primary">
                    {{ originalTerm }}
                  </v-list-item-title>

                </v-list-item-content>

                <!-- <v-list-item-action class="mx-0 mt-8 d-flex flex-column">
                  <div class="overline">Untyped</div>
                  <div class="mx-auto">
                    <v-switch v-model="isUntyped" :disabled="isRunning"></v-switch>
                  </div>
                </v-list-item-action> -->
              </v-list-item>
            </v-card>

            <v-card
              :height='consoleHeight'
              style="overflow: auto;"
              id="outputConsole"
              class="customDark"
            >
              <v-card-text>
                <div v-for="(output,index) in outputs" :key="index">
                  <p class="text--primary">
                    <span v-html="output.text"></span>
                  </p>
                </div>
              </v-card-text>
            </v-card>

            <v-form id="inputForm" @submit.prevent>
              <v-text-field
                v-model="input"
                label="Input"
                dense
                solo
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
import { mapGetters } from 'vuex'

export default {
  data: () => ({
    inputFormHeight: 0,
    envHeight: 0,
    consoleHeight: 0,
    delHTML: /<([^>]*"[^>]|[^>=])*>/g,
    popInj: /<[^>"]*=[^>"]*>/g,
    // delHTML: /<("[^"]*"|'[^']*'|[^'">])*>/g,
    emptyToken: 'Empty',
    initialMessage: ':help :h ヘルプ',
    invalidInputMessage: '無効な入力です．',
    argumentEmptyMessage: '引数を指定してください．（:helpでヘルプ）',
    // baseUrl: 'http://www.sofsci.cs.gunma-u.ac.jp/ii/api/',
    baseUrl: 'http://localhost/',
    isUntyped: false,
    isRunning: false,
    editDialog: false,
    editedXi: '',
    editedGa: '',
    editedTerm: '',
    fab: false,
    historyDrawer: false,
    examplesDrawer: false,
    defsDrawer: false,
    input: '',
    outputs: [],
    history: [],
    defs: [],
    xi: '',
    ga: '',
    originalTerm: '',
    term: '',
    num: '',
  }),
  computed: {
    ...mapGetters([
      'typedExamples',
      'untypedExamples',
      'helps'
    ])
  },
  watch: {
    outputs: function () {
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
      }

      // Define
      match = input.match(/^\$([A-Z]|[a-z])+\s*=\s*/g)
      if (match) {
        const lhs = input.match(/^\$([A-Z]|[a-z])+/g)[0]
        const rhs = '('+ input.replace(match[0], '') + ')'

        if (!rhs) {
          this.outputs.push( { text: this.invalidInputMessage } )
          return
        }

        for (let i = 0; i < this.defs.length; i++) {
          if (this.defs[i].binder === lhs) {
            this.defs[i].exp = rhs
            this.outputs.push( { text: `${lhs} = ${rhs.replace('<', '&lt;').replace('>', '&gt;')}` } )
            return
          }
        }

        this.defs.push( { binder: lhs, exp: rhs } )
        this.outputs.push( { text: `${lhs} = ${rhs.replace('<', '&lt;').replace('>', '&gt;')}` } )
        console.log(this.defs)
        return
      }

      // Variable
      match = input.match(/^\$([A-Z]|[a-z])+$/g)
      if (match) {
        if (this.defs.length > 0) {
          for (let i = 0; i < this.defs.length; i++) {
            if (this.defs[i].binder === match[0]) {
              this.outputs.push( { text: `${match[0]} = ${this.defs[i].exp.replace('<', '&lt;').replace('>', '&gt;')}` } )
              return
            }
          }
        }
      }

      // Submit Number
      if (this.isRunning && input && !isNaN(Number(input))) {
        this.num = input
        this.submitNum()
        return
      }

      this.outputs.push( { text: this.invalidInputMessage } )
    },
    command (cmd, value) {
      if (cmd === 'xi') {
        if (!value) {
          this.outputs.push( { text: this.argumentEmptyMessage } )
          return
        }
        this.outputs.push( { text: 'Ξ: ' + value.replace('<', '&lt;').replace('>', '&gt;') } )
        this.xi = value
        return
      }
      if (cmd === 'ga') {
        if (!value) {
          this.outputs.push( { text: this.argumentEmptyMessage } )
          return
        }
        this.outputs.push( { text: 'Γ: ' + value.replace('<', '&lt;').replace('>', '&gt;') } )
        this.ga = value
        return
      }
      if (cmd === 'lambda' || cmd === 'l') {
        if (!value) {
          this.outputs.push( { text: this.argumentEmptyMessage } )
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

        this.outputs.push( { text: 'λ-term: ' + newTerm.replace('<', '&lt;').replace('>', '&gt;') } )
        this.originalTerm = newTerm
        return
      }
      if (cmd === 'type' || cmd === 't') {
        let newTerm = value

        this.typingCheck()
        return
      }
      if (cmd === 'run' || cmd === 'r') {
        if (this.originalTerm === this.emptyToken) {
          this.outputs.push( { text: 'ラムダ式をセットしてください．（:helpでヘルプ）' } )
          return
        }

        this.term = this.originalTerm

        if (value === '-untyped' || value === '-u') {
          this.isUntyped = true
        } else {
          this.isUntyped = false
        }
        this.isRunning = true
        this.outputs.push(
          { text: '<br>' },
          { text: '> run LCII' + (this.isUntyped ? '(Untyped)' : '') },
          { text: '<br>' }
        )
        this.submitTerm()
        return
      }
      if (cmd === 'show' || cmd === 's') {
        this.outputs.push( { text: '<br>' }, { text: 'Definitions' } )
        if (this.defs.length === 0) {
          this.outputs.push( { text: 'None' } )
        }
        this.defs.forEach(def => {
          this.outputs.push( { text: `${def.binder} = ${def.exp.replace('<', '&lt;').replace('>', '&gt;')}` } )
        })
        return
      }
      if (cmd === 'clear' || cmd === 'c') {
        this.clear()
        return
      }
      if (cmd === 'quit' || cmd === 'q') {
        this.outputs.push( { text: '> quit' } )
        this.init(true)
        return
      }
      if (cmd === 'help' || cmd === 'h') {
        const helps = this.helps
        this.outputs.push( { text: '<br>' }, { text: '<b>Help</b>' } )
        for (let i = 0; i < helps.length; i++) {
          this.outputs.push({ text: `Command: ${helps[i].cmd} ${helps[i].shortCmd ? helps[i].shortCmd : ''}` } )

          if (helps[i].options.length > 0) {
            let option = ''
            for(let j = 0; j < helps[i].options.length; j++) {
              option += ` ${helps[i].options[j]}`
            }
            this.outputs.push({ text: `Option:${option}` } )
          }
          
          this.outputs.push({ text: `${helps[i].desc}` }, { text: '<br>' } )
        }
        return
      }
    },
    submitTerm () {
      let params = new URLSearchParams()
          params.append('xi', this.xi)
          params.append('ga', this.ga)
          params.append('term', this.term)
          params.append('isUntyped', this.isUntyped)
          params.append('mode', 'init')

      var vm = this

      axios.post(this.baseUrl + 'api.php', params)
        .then(function(response){
          var opt = response.data
          console.log(opt)
          if (opt.includes('Parse Error')) {
            vm.outputs.push( { text: '無効な入力です．画面右上の「USAGE」からラムダ式または型環境の記法を参照してください．' } )
            vm.init(true)
            return
          }
          var match = opt.match(vm.popInj)
          var text = opt
          if (match) {
            match.forEach(x => {
              text = text.replace(x, '&lt;' + x.substring(1, x.length - 1) + '&gt;')
            })
          }
          vm.outputs.push( { text: text } )
          if (opt.indexOf('Normal') == -1 && opt.indexOf('Error') == -1) {
            vm.term = opt.substring(0, opt.indexOf('<br>')).replace(vm.delHTML,'')
            console.log(vm.term)
          } else {
            vm.isRunning = false
            vm.term = vm.emptyToken
            
            vm.outputs.push( { text: '<br>' }, { text: vm.initialMessage } )
          }
        })
        .catch(function(err){
          vm.outputs.push( { text: 'サーバとの通信中にエラーが発生しました．' } )
          console.error(err)
        })
    },
    submitNum () {
      let params = new URLSearchParams()
          params.append('xi', this.xi)
          params.append('ga', this.ga)
          params.append('term', this.term)
          params.append('num', this.num)
          params.append('isUntyped', this.isUntyped)
          params.append('mode', 'red')

      var vm = this

      axios.post(this.baseUrl + 'api.php', params)
        .then(function(response){
          vm.outputs.push( { text: '> ' + vm.num } )
          var opt = response.data
          console.log(opt)
          
          var match = opt.match(vm.popInj)
          var text = opt
          if (match) {
            match.forEach(x => {
              text = text.replace(x, '&lt;' + x.substring(1, x.length - 1) + '&gt;')
            })
          }
          vm.outputs.push( { text: text } )
          if (opt.indexOf('Normal') == -1 && opt.indexOf('Error') == -1) {
            if (opt.indexOf('maximum') != -1) {
              vm.outputs.push( { text: '簡約したいRedexの番号を入力してください．' } )
              return
            }
            if (opt.indexOf('α') != -1) {
              opt = opt.substring(opt.indexOf('<br>') + 4)
            }
            vm.term = opt.substring(0, opt.indexOf('<br>')).replace(vm.delHTML,'')
          } else {
            vm.isRunning = false
            vm.term = vm.emptyToken
            
            vm.outputs.push( { text: '<br>' }, { text: vm.initialMessage } )
          }
        })
        .catch(function(err){
          vm.outputs.push( { text: 'サーバとの通信中にエラーが発生しました．' } )
          console.error(err)
        })
    },
    typingCheck () {
      if (this.originalTerm === this.emptyToken) {
        this.outputs.push( { text: 'λ式が入力されていません．' } )
        return
      }

      let params = new URLSearchParams()
          params.append('xi', this.xi)
          params.append('ga', this.ga)
          params.append('term', this.originalTerm)
          params.append('mode', 'check')

      var vm = this

      axios.post(this.baseUrl + 'api.php', params)
        .then(function(response){
          var opt = response.data

          if (opt === '') {
            vm.outputs.push( { text: 'ラムダ式が型無しです．' } )
          } else {
            vm.outputs.push( { text: opt } )
          }
        })
        .catch(function(err){
          vm.outputs.push( { text: 'サーバとの通信中にエラーが発生しました．' } )
          console.error(err)
        })
    },
    addExampleTypedTerm (example) {
      this.isUntyped = false
      this.isRunning = true
      this.originalTerm = example.term
      this.term = example.term
      this.xi = example.envType
      this.ga = example.envTerm
      this.examplesDrawer = false
    },
    addExampleUntypedTerm (example) {
      this.isUntyped = true
      this.isRunning = true
      this.originalTerm = example.term
      this.term = example.term
      this.xi = this.emptyToken
      this.ga = this.emptyToken
      this.examplesDrawer = false
    },
    saveEditedEnv () {
      this.xi = this.editedXi
      this.ga = this.editedGa
      this.originalTerm = this.editedTerm
      this.editDialog = false
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

      this.originalTerm = this.emptyToken
      this.term = this.emptyToken
      this.ga = this.emptyToken
      this.xi = this.emptyToken
      
      if (isNewLine) {
        this.outputs.push( { text: '<br>' }, { text: this.initialMessage } )
      } else {
        this.outputs.push( { text: this.initialMessage } )
      }
    },
    closeDrawer () {
      this.historyDrawer = false
      this.examplesDrawer = false
      this.defsDrawer = false
    },
    clear () {
      this.history.push( ...this.outputs, { text: '---------------- Clear ----------------' } )
      this.outputs = []
      this.init()
    },
    updateConsoleHeight () {
      this.consoleHeight = window.innerHeight - this.inputFormHeight - this.envHeight - 100
    }
  },
  created () {
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
.v-text-field__details {
  min-height: 0px !important;
  display: none !important;
}
.v-messages {
  min-height: 0px !important;
}
.v-input__slot {
  margin: 0px !important;
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
