<template>
  <v-navigation-drawer
    v-model="drawer"
    disable-resize-watcher
    temporary
    app
    right
    width="500"
  >
    <v-list class="py-0">
      <v-subheader style="height: 49px;">
        <h1>VARIABLES</h1>
        <v-spacer></v-spacer>
        <v-btn icon @click.stop="closeDrawers()">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-subheader>
      <v-divider></v-divider>
      <v-list-item
        v-for="(variable, key) in variables" :key="key"
        style="height: 50px;"
        class="px-3"
      >
        <v-list-item-title>
          {{ key }} = {{ variables[key] }}
        </v-list-item-title>

        <v-spacer></v-spacer>

        <v-list-item-action>
          <v-btn icon @click="$store.commit('deleteVariables', key); $forceUpdate();">
            <v-icon>mdi-delete</v-icon>
          </v-btn>
        </v-list-item-action>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { mapState, mapMutations } from 'vuex'

export default {
  data: () => ({
    key: 'variables'
  }),
  computed: {
    ...mapState(['variables']),
    drawer: {
      get () {
        return this.$store.state.features[this.key].drawer
      },
      set (value) {
        if (value) {
          this.openDrawer(this.key)
        } else {
          this.closeDrawers()
        }
      }
    }
  },
  methods: mapMutations(['openDrawer', 'closeDrawers', 'deleteVariables'])
}
</script>
