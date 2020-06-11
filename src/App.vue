<template>
  <v-app>
    <!-- App Bar -->
    <v-app-bar
      app
      color="red"
      dark
      height="50px"
    >
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mr-2"
          contain
          :src="require('./assets/logo.png')"
          transition="scale-transition"
          width="35"
        />

        <v-img
          alt="Vuetify Name"
          class="shrink mt-1 hidden-sm-and-down"
          contain
          min-width="300"
          :src="require('./assets/logo_text.png')"
          width="300"
        />
      </div>

      <v-spacer></v-spacer>

      <v-dialog v-model="dialog" fullscreen hide-overlay transition="dialog-bottom-transition">
        <template v-slot:activator="{ on }">
          <v-btn outlined rounded dark v-on="on" style="border-width: medium;">Usage</v-btn>
        </template>
        <usage @updated="updateEvent" />
      </v-dialog>
    </v-app-bar>

    <!-- Drawers -->
    <v-navigation-drawer
      v-model="historyDrawer"
      disable-resize-watcher
      app
      right
      width="500"
      :class="{'customDark': $vuetify.theme.dark}"
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
          <v-tab>Simply Typed</v-tab>
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
                  <div class="overline">TYPING ENVIRONMENT</div>
                  <span class="drawer-text" v-html="example.env"></span>
                  <v-divider class="my-1"></v-divider>
                  <div class="overline">TERM</div>
                  <span class="drawer-text" v-html="example.term"></span>
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
                  <span class="drawer-text" v-html="example.term"></span>
                </v-alert>
              </v-list-item-title>
            </v-list-item>
          </v-tab-item>
        </v-tabs>
      </v-list>
    </v-navigation-drawer>

    <!-- Dialog -->
    <v-dialog v-model="editDialog" persistent max-width="600px">
      <v-card>
        <v-card-title>
          <span class="headline">Edit Typing Environment</span>
        </v-card-title>
        <v-card-text>
          <v-text-field label="Typing Environment*" :value="ga" v-model="editedGa" spellcheck="false" required></v-text-field>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="editDialog = false">Close</v-btn>
          <v-btn color="blue darken-1" text @click="saveEditedGa" :disabled="editedGa == ''">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Main -->
    <v-content :class="{'px-5': $vuetify.breakpoint.xs}">
      <v-row>
        <v-col cols="12" sm="10" offset-sm="1" class="pb-0 px-0">
          <v-card
            class="mb-3"
            style="overflow: auto;"
            id="env"
            :class="{'customDark': $vuetify.theme.dark}"
          >
            <v-list-item three-line class="pr-2">
              <v-btn style="position: absolute; right: 70px; top: 10px;" icon @click.stop="editedGa = ga; editDialog = true">
            <v-icon>mdi-square-edit-outline</v-icon>
          </v-btn>
              <v-list-item-content class="py-2">
                <div class="overline">TYPING ENVIRONMENT</div>
                <v-list-item-title class="text--primary">
                  <span v-html="ga"></span>
                </v-list-item-title>
                <v-divider class="my-1"></v-divider>
                <div class="overline">TERM</div>
                <v-list-item-title class="text--primary">
                  <span v-html="originalTerm"></span>
                </v-list-item-title>
              </v-list-item-content>
              <v-list-item-action class="ma-0 mt-5">
                <div class="overline">Untyped</div>
                <v-switch v-model="untyped" :disabled="flag != 0" class="mt-3 mr-2"></v-switch>
              </v-list-item-action>
            </v-list-item>
          </v-card>

          <v-card
            class="mb-3"
            :height='consoleHeight'
            style="overflow: auto;"
            id="outputConsole"
            :class="{'customDark': $vuetify.theme.dark}"
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
              @keydown.enter="addOutput()"
              solo
              spellcheck="false"
              :class="{'customDark': $vuetify.theme.dark}"
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
              <v-btn icon @click.stop="historyDrawer = !historyDrawer; examplesDrawer = false">
                <v-icon>mdi-history</v-icon>
              </v-btn>
            </v-col>

            <v-col class="px-0" style="flex-grow: unset;">
              <v-btn icon @click.stop="examplesDrawer = !examplesDrawer; historyDrawer = false">
                <v-icon>mdi-lambda</v-icon>
              </v-btn>
            </v-col>

            <v-col class="px-0" style="flex-grow: unset;">
              <v-btn icon @click.stop="$vuetify.theme.dark ? $vuetify.theme.dark = false : $vuetify.theme.dark = true">
                <v-icon>mdi-theme-light-dark</v-icon>
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
          color="green"
          @click.stop="examplesDrawer = !examplesDrawer; historyDrawer = false"
        >
          <v-icon>mdi-lambda</v-icon>
        </v-btn>
        <v-btn
          fab
          dark
          small
          color="indigo"
          @click.stop="historyDrawer = !historyDrawer; examplesDrawer = false"
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
    </v-content>
  </v-app>
</template>

<script>
import Usage from './components/Usage.vue'
import axios from 'axios'

export default {
  data: () => ({
    inputFormHeight: 0,
    envHeight: 0,
    consoleHeight: 0,
    emptyMessage: 'Empty',
    dialog: false,
    editDialog: false,
    editedGa: '',
    untyped: false,
    fab: false,
    historyDrawer: false,
    examplesDrawer: false,
    baseUrl: 'http://www.sofsci.cs.gunma-u.ac.jp/ii/api/',
    input: '',
    outputs: [
      { text: 'λ式を入力してください．' }
    ],
    history: [],
    ga: 'Empty',
    originalTerm: 'Empty',
    term: 'Empty',
    num: '',
    flag: 0   // 0: ラムダ式を受け取る 1: 型環境を受け取る 2: Redex番号を受け取る
  }),
  watch: {
    outputs: function () {
      this.$nextTick(function() {
        var outputWindow = this.$el.querySelector('#outputConsole')
        outputWindow.scrollTop = outputWindow.scrollHeight
      })
    }
  },
  components: {
    Usage
  },
  computed: {
    typedExamples () {
      return this.$store.state.typedExamples
    },
    untypedExamples () {
      return this.$store.state.untypedExamples
    }
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
  methods: {
    addOutput () {
      // Command
      if (this.input == ':clear' || this.input == ':c') {
        this.input = ''
        this.clear()
        return
      } else if (this.input == ':quit' || this.input == ':q') {
        this.input = ''
        this.originalTerm = this.emptyMessage
        this.term = this.emptyMessage
        this.ga = this.emptyMessage
        this.initInput()
        return
      }

      // Submit
      if (this.flag == 0) {
        if (this.input == '') return
        this.term = this.input
        this.originalTerm = this.input
        this.input = ''
        if (this.untyped) {
          this.ga = this.emptyMessage
          this.submitTerm()
        } else {
          this.flag = 1
          this.outputs.push( { text: this.term }, { text: '型環境を入力してください．' } )
        }
      } else if (this.flag == 1) {
        if (this.input == '' || this.input == ' ') {
          this.ga = this.emptyMessage
        } else {
          this.ga = this.input
        }
        this.input = ''
        this.submitTerm()
        this.outputs.push( { text: this.ga } )
      } else {
        if (this.input == '') return
        if (isNaN(this.input)) {
          this.input = ''
          this.outputs.push( { text: '無効な入力です．' }, { text: '簡約したいRedexの番号を入力してください．' } )
          return
        }
        this.num = this.input
        this.input = ''
        this.submitNum()
      }
    },
    submitTerm () {
      let params = new URLSearchParams()
          params.append('ga', this.ga)
          params.append('term', this.term)
          params.append('isUntyped', this.untyped)

      var vm = this

      axios.post(this.baseUrl + 'init.php', params)
        .then(function(response){
          var opt = response.data
          if (opt.indexOf('Parse Error') != -1) {
            vm.outputs.push( { text: '無効な入力です．画面右上の「USAGE」からラムダ式または型環境の記法を参照してください．' } )
            vm.initInput()
            return
          }
          vm.outputs.push( { text: opt } )
          if (opt.indexOf('Normal') == -1 && opt.indexOf('Error') == -1) {
            vm.term = opt.substring(0, opt.indexOf('<br>')).replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'')
            vm.flag = 2
          } else {
            vm.initInput()
          }
        })
        .catch(function(err){
          vm.outputs.push( { text: 'サーバとの通信中にエラーが発生しました．' } )
          console.error(err)
        })
    },
    submitNum () {
      let params = new URLSearchParams()
          params.append('ga', this.ga)
          params.append('term', this.term)
          params.append('num', this.num)
          params.append('isUntyped', this.untyped)

      var vm = this

      axios.post(this.baseUrl + 'iiw.php', params)
        .then(function(response){
          vm.outputs.push( { text: 'Selected Redex Number: ' + vm.num } )
          var opt = response.data
          vm.outputs.push( { text: opt } )
          if (opt.indexOf('Normal') == -1 && opt.indexOf('Error') == -1) {
            if (opt.indexOf('maximum') != -1) {
              vm.outputs.push( { text: '簡約したいRedexの番号を入力してください．' } )
              return
            }
            if (opt.indexOf('α') != -1) {
              opt = opt.substring(opt.indexOf('<br>') + 4)
            }
            vm.term = opt.substring(0, opt.indexOf('<br>')).replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'')
          } else {
            vm.initInput()
          }
        })
        .catch(function(err){
          vm.outputs.push( { text: 'サーバとの通信中にエラーが発生しました．' } )
          console.error(err)
        })
    },
    addExampleTypedTerm (example) {
      this.untyped = false
      this.originalTerm = example.term
      this.term = example.term
      this.ga = example.env
      this.examplesDrawer = false
      this.submitTerm()
    },
    addExampleUntypedTerm (example) {
      this.untyped = true
      this.originalTerm = example.term
      this.term = example.term
      this.ga = this.emptyMessage
      this.examplesDrawer = false
      this.submitTerm()
    },
    updateEvent () {
      this.dialog = false
    },
    saveEditedGa () {
      this.ga = this.editedGa
      this.editGa = ''
      this.editDialog = false
    },
    initInput () {
      this.flag = 0
      this.outputs.push( { text: 'λ式を入力してください．' } )
    },
    clear () {
      this.flag = 0
      this.originalTerm = this.emptyMessage
      this.term = this.emptyMessage
      this.ga = this.emptyMessage
      this.outputs.push( { text: '---------------- Clear ----------------' } )
      this.history = [...this.history, ...this.outputs]
      this.outputs = [ { text: 'λ式を入力してください．' } ]
    },
    updateConsoleHeight () {
      this.consoleHeight = window.innerHeight - this.inputFormHeight - this.envHeight - 100
    }
  }
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
.theme--dark.v-application {
  background-color: black !important;
}
.theme--dark.v-divider {
  border-color: #424242 !important;
}
.theme--dark.v-text-field--solo > .v-input__control > .v-input__slot {
  background-color: black !important;
}
.customDark {
  background-color: black !important;
  border: thin solid #424242;
}
</style>
