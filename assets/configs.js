export const app = {
  appName: "Sample Calculator",
  logoIcon: require('~/static/logo_icon.png'),
  logoText: require('~/static/logo_text.png'),
}

export const messages = {
  initialMessage: "使用方法は画面右上のUsageを参照してください．",
  invalidInputMessage: "無効な入力です．",
  argumentEmptyMessage: "引数を指定してください．（:helpでヘルプ）",
  invalidArgumentMessage: "引数が不正です．（:helpでヘルプ）",
  connectionErrorMessage: "サーバとの通信中にエラーが発生しました．",
}

export const params = {
  formula: {
    display: 'Formula',
    type: String,
    default: null,
    value: null,
    visible: true
  },
  result: {
    display: 'Result',
    type: Number,
    default: 0,
    value: 0,
    visible: true,
    half: true
  },
  total: {
    display: 'Total',
    type: Number,
    default: 0,
    value: 0,
    visible: true,
    half: true
  }
}
