import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';
import axios from 'axios'
// import colors from 'vuetify/es5/util/colors'

Vue.config.productionTip = false

Vue.prototype.$axios = axios

// Vue.use(vuetify, {
//   theme: {
//     primary: colors.purple.base,
//     secondary: colors.grey.darken1,
//     accent: colors.shades.black,
//     error: colors.red.accent3
//   }
// })

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
