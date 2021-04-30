export const app = {
  appName: "Lambda Calculus Interactive Interpreter",
  logoIcon: require('~/static/logo_icon.png'),
  logoText: require('~/static/logo_text.png'),
}

export const paramsSettings = {
  total: {
    display: 'Total',
    type: Number,
    default: 0,
    visible: true,
    half: true
  },
  result: {
    display: 'Result',
    type: Number,
    default: 0,
    visible: true,
    half: true
  },
  formula: {
    display: 'Formula',
    type: String,
    default: null,
    visible: true
  },
  mode: {
    display: 'Mode',
    type: String,
    default: null,
    visible: false
  },
}
