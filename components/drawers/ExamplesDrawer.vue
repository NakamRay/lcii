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
        <h1>EXAMPLES</h1>
        <v-spacer></v-spacer>
        <v-btn icon @click.stop="closeDrawers()">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-subheader>
      <v-divider></v-divider>
      <v-tabs>
        <v-tab v-for="(example,key) in examples" :key="key">{{ key }}</v-tab>
        <v-tab-item v-for="(example,key) in examples" :key="key">
          <v-list-item
            style="min-height: 15px;"
            v-for="(anexample,index) in example" :key="index"
            v-ripple="{ class: 'red--text' }"
            @click.stop="$emit('update-params', { formula: anexample.formula }); closeDrawers()"
          >
            <v-list-item-title>
              <v-alert
                class="py-1 my-1"
                color="red"
                border="left"
                elevation="2"
                colored-border
              >
                <div class="overline">Formula</div>
                <span class="drawer-text">{{anexample.formula}}</span>
              </v-alert>
            </v-list-item-title>
          </v-list-item>
        </v-tab-item>
      </v-tabs>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { mapState, mapMutations } from 'vuex'

import { examples } from '~/assets/examples.js'

export default {
  data: () => ({
    key: 'examples',
    examples
  }),
  computed: {
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
  methods: mapMutations(['openDrawer', 'closeDrawers'])
}
</script>
