<template>
  <v-app dark>
    <v-app-bar
      app
      clipped-left
      height="50px"
    >
      <div class="d-flex align-center">
        <v-img
          alt="Logo"
          class="shrink mx-2"
          contain
          :src="require('@/assets/logo.png')"
          transition="scale-transition"
          width="30"
        />

        <v-img
          alt="LCII"
          class="shrink mt-1 hidden-sm-and-down"
          contain
          :src="require('@/assets/logo_text.png')"
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

export default {
  data: () => ({
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
