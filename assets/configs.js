export const app = {
  appName: "Lambda Calculus Interactive Interpreter",
  logoIcon: require('~/static/logo_icon.png'),
  logoText: require('~/static/logo_text.png'),
}

export const params = {
  typeContext: {
    name: 'typeContext',
    display: 'Type Context',
    type: String,
    default: 'Empty',
    visible: true
  },
  termContext: {
    name: 'termContext',
    display: 'Term Context',
    type: String,
    default: 'Empty',
    visible: true
  },
  initialLambdaTerm: {
    name: 'initialLambdaTerm',
    display: 'Lambda Term',
    type: String,
    default: 'Empty',
    visible: true
  },
  lambdaTerm: {
    name: 'lambdaTerm',
    display: 'Lambda Term',
    type: String,
    default: 'Empty',
    visible: false
  },
  redexNumber: {
    name: 'redexNumber',
    display: 'Redex Number',
    type: Number,
    default: 0,
    visible: false
  },
  isUntyped: {
    name: 'isUntyped',
    display: 'isUntyped',
    type: Boolean,
    default: false,
    visible: false
  },
  mode: {
    name: 'mode',
    display: 'Mode',
    type: String,
    default: 'init',
    visible: false
  },
}
