<template>
  <v-app dark>
    <v-app-bar
      app
      clipped-left
      height="50px"
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mx-2"
          contain
          :src="require('@/assets/logo.png')"
          transition="scale-transition"
          width="30"
        />

        <v-img
          alt="Vuetify Name"
          class="shrink mt-1 hidden-sm-and-down"
          contain
          :src="require('@/assets/logo_text.png')"
          height="30"
          width="80"
        />
      </div>

      <!-- <v-toolbar-title>LCII</v-toolbar-title> -->

      <v-spacer></v-spacer>

      <v-dialog v-model="dialog" fullscreen hide-overlay transition="dialog-bottom-transition">
        <template v-slot:activator="{ on }">
          <v-btn outlined rounded dark v-on="on" style="border-width: medium;">Usage</v-btn>
        </template>
        <Usage @close-usage="closeUsage" />
      </v-dialog>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      disable-resize-watcher
      app
      clipped
    >
      <v-list dense>
        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Dashboard</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-cog</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Settings</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <div style="height: 5px;"></div>

    <nuxt />
  </v-app>
</template>

<script>
import Usage from '@/components/Usage.vue'

export default {
  data: () => ({
    dialog: false,
    drawer: false,
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
