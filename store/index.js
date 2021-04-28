export const state = () => ({
  console: []
})

export const mutations = {
  initConsole(state) {
    state.console = []
  },
  addLine(state, line) {
    state.console.push(line)
  },
  addLines(state, lines) {
    for (var i = 0; i < lines.length; i++) {
      state.console.push(lines[i])
    }
  }
}

export const getters = {
  console(state) {
    return state.console
  }
}
