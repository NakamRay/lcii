<template>
  <v-navigation-drawer
    v-model="features.history.drawer"
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
        <v-btn icon @click.stop="features.history.drawer = false">
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
</template>

<script>
import { mapGetters } from 'vuex'

import { features } from '~/assets/features.js'

export default {
  data: () => ({
    features,
  }),
  computed: {
    ...mapGetters([
      'history'
    ]),
  },
}
</script>
