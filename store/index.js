import { features } from '~/assets/features.js'

export const state = () => ({
  console: [],
  features: features,
  history: [],
  variables: { $x: "123", $xs: "456" },
})

export const mutations = {
  // for console
  initConsole(state) {
    state.console = []
  },
  addLine(state, line) {
    line = [line].flat()
    state.console.push(...line)
  },

  // for history
  initHistory(state) {
    state.history = []
  },
  addHistory(state, history) {
    history = [history].flat()
    state.history.push(...history)
  },

  // for variables
  initVariables(state) {
    state.variables = {}
  },
  updateVariables(state, variables) {
    for (var variable in variables) {
      state.variables[variable] = variables[variable]
    }
  },
  deleteVariables(state, variables) {
    variables = [variables].flat()
    console.log(variables)
    for (var variable of variables) {
      delete state.variables[variable]
      console.log(state.variables)
    }
  },

  // for drawers
  openDrawer(state, feature) {
    state.features[feature].drawer = true
  },
  closeDrawers(state) {
    for (var feature in state.features) {
      if (state.features[feature].hasOwnProperty('drawer')) {
        state.features[feature].drawer = false
      }
    }
  },
}

export const getters = {
  console(state) {
    return state.console
  },
  history(state) {
    return state.history
  },
  variables(state) {
    return state.variables
  },
  getState: (state) => (stateID) => {
    return state[stateID]
  },
}
