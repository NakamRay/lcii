<template>
  <v-app dark>
    <v-app-bar
      app
      height="50px"
    >
      <div class="d-flex align-center">
        <v-img
          v-if="app.logoIcon"
          alt="Logo Icon"
          class="shrink mx-2"
          contain
          :src="app.logoIcon"
          transition="scale-transition"
          width="30"
        />

        <v-img
          v-if="app.logoText"
          alt="Logo Text"
          class="shrink hidden-sm-and-down"
          contain
          :src="app.logoText"
          height="40"
          width="200"
        />
        <span v-else>{{ app.appName }}</span>
      </div>

      <v-spacer></v-spacer>

      <v-btn
        rounded
        outlined
        style="border-width: medium;"
        @click="$store.commit('switchUsageDialog')"
      >
        Usage
      </v-btn>

      <Usage />
    </v-app-bar>
    <nuxt />
  </v-app>
</template>

<script>
import Usage from '~/components/Usage.vue'
import { app } from '~/assets/configs.js'

export default {
  components: {
    Usage
  },
  data: () => ({
    app,
  })
}
</script>
