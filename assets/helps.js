export const helps = [
  {
    cmd: 'xi',
    shortCmd: null,
    options: [],
    desc: '自由型変数をLCIIにセットします．:runでセットした自由型変数が参照されます．'
  },
  {
    cmd: 'ga',
    shortCmd: null,
    options: [],
    desc: '型環境をLCIIにセットします．:runでセットした型環境が参照されます．'
  },
  {
    cmd: 'lambda',
    shortCmd: 'l',
    options: [],
    desc: 'ラムダ式をLCIIにセットします．:runでセットしたラムダ式の簡約を実行します．'
  },
  {
    cmd: 'type',
    shortCmd: 't',
    options: [],
    desc: 'セットされている式の型チェックを行います．'
  },
  {
    cmd: 'run',
    shortCmd: 'r',
    options: ['untyped', 'u'],
    desc: 'セットしたラムダ式の対話的な簡約を実行します．-untypedオプションを付けると型無しラムダ式として簡約します．'
  },
  {
    cmd: '$[Variable Name] = [Lambda Term]',
    shortCmd: '',
    options: [],
    desc: 'ラムダ式を定義します．ラムダ式をセットする際にここで定義した$[Variable Name]が利用できます．'
  },
  {
    cmd: '$[Variable Name]',
    shortCmd: '',
    options: [],
    desc: '定義した$[Variable Name]のラムダ式を表示します．'
  },
  {
    cmd: 'show',
    shortCmd: 's',
    options: [],
    desc: '定義したラムダ式を一覧表示します．'
  },
  {
    cmd: 'clear',
    shortCmd: 'c',
    options: [],
    desc: 'コンソールのログを全て消します．消去されたログは履歴に蓄積されます．簡約中に行うと簡約が中止されます．'
  },
  {
    cmd: 'quit',
    shortCmd: 'q',
    options: [],
    desc: '簡約を中止します．'
  }
]