export const app = {
  appName: "Lambda Calculus Interactive Interpreter",
  logoIcon: require('~/static/logo_icon.png'),
  logoText: require('~/static/logo_text.png'),
}

export const messages = {
  initialMessage: ":help :h ヘルプ",
  invalidInputMessage: "無効な入力です．",
  argumentEmptyMessage: "引数を指定してください．（:helpでヘルプ）",
  invalidArgumentMessage: "引数が不正です．（:helpでヘルプ）",
  connectionErrorMessage: "サーバとの通信中にエラーが発生しました．",
}

export const params = {
  total: {
    display: 'Total',
    type: Number,
    default: 0,
    value: 0,
    visible: true,
    half: true
  },
  result: {
    display: 'Result',
    type: Number,
    default: 0,
    value: 0,
    visible: true,
    half: true
  },
  formula: {
    display: 'Formula',
    type: String,
    default: null,
    value: null,
    visible: true
  },
  mode: {
    display: 'Mode',
    type: String,
    default: null,
    value: null,
    visible: false
  },
}
