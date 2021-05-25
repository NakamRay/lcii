<template>
  <v-navigation-drawer
    v-model="drawer"
    disable-resize-watcher
    temporary
    app
    right
    width="500"
    class="customDark"
  >
    <v-list class="py-0">
      <v-subheader style="height: 49px">
        <h1>HISTORY</h1>
        <v-spacer></v-spacer>
        <v-btn icon @click.stop="closeDrawers()">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-subheader>
      <v-divider></v-divider>
      <v-list-item
        style="min-height: 25px"
        v-for="(ahistory, index) in history"
        :key="index"
      >
        <v-list-item-title>
          <span class="drawer-text" v-html="ahistory.text"></span>
        </v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  data: () => ({
    key: "history",
  }),
  computed: {
    ...mapState(["history"]),
    drawer: {
      get() {
        return this.$store.state.features[this.key].drawer;
      },
      set(value) {
        if (value) {
          this.openDrawer(this.key);
        } else {
          this.closeDrawers();
        }
      },
    },
  },
  methods: mapMutations(["openDrawer", "closeDrawers"]),
};
</script>
