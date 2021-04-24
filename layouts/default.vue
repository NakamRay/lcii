<template>
  <v-app dark>
    <v-app-bar
      app
      clipped-left
      height="50px"
    >
      <div class="d-flex align-center">
        <v-img
          alt="Logo Icon"
          class="shrink mx-2"
          contain
          :src="app.logoIcon"
          transition="scale-transition"
          width="30"
        />

        <v-img
          alt="Logo Text"
          class="shrink hidden-sm-and-down"
          contain
          :src="app.logoText"
          height="30"
          width="80"
        />
      </div>

      <v-spacer></v-spacer>

      <v-dialog v-model="dialog" fullscreen hide-overlay transition="dialog-bottom-transition">
        <template v-slot:activator="{ on }">
          <v-btn outlined rounded dark v-on="on" style="border-width: medium;">Usage</v-btn>
        </template>
        <Usage @close-usage="closeUsage" />
      </v-dialog>
    </v-app-bar>
    <nuxt />
  </v-app>
</template>

<script>
import Usage from '@/components/Usage.vue'
import { app } from '~/assets/configs.js'

export default {
  data: () => ({
    app,
    dialog: false,
  }),
  components: {
    Usage
  },
  methods: {
    closeUsage () {
      this.dialog = false
    }
  }
}
</script>
