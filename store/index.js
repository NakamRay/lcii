import { paramsSettings } from '~/assets/configs.js'

export const state = () => ({
  console: [],
  history: [],
  variables: {},
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

  //for history
  initHistory(state) {
    state.history = []
  },
  addHistory(state, history) {
    history = [history].flat()
    state.history.push(...history)
  },

  //for variables
  initVariables(state) {
    state.variables = {}
  },
  updateVariables(state, variables) {
    for (var variable in variables) {
      state.variables[variable] = variables[variable]
    }
  }
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
