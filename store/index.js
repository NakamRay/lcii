export const state = () => ({
  typedExamples: [
    {
      term: '(λx:INT->INT.λy:INT.x y) a b',
      envType: 'Empty',
      envTerm: 'a:INT->INT, b:INT'
    },
    {
      term: '(λx:INT.f x) ((λx:INT.x) a)',
      envType: 'Empty',
      envTerm: 'a:INT, f:INT->BOOL'
    },
    {
      term: '(λx:INT->INT.λy:INT.x y) y',
      envType: 'Empty',
      envTerm: 'y:INT->INT'
    },
    {
      term: '((λx:INT.(λy:INT.(λz:INT.x) y)) y) z',
      envType: 'Empty',
      envTerm: 'x:INT, y:INT, z:INT'
    },
    {
      term: '(λx:BOOL.f x) {a, b, c}.3',
      envType: 'Empty',
      envTerm: 'a:INT, b:INT, c:BOOL, f:BOOL->BOOL'
    },
    {
      term: '(λx:{INT, BOOL, CHAR}.x.3) {a, b, c}',
      envType: 'CHAR',
      envTerm: 'a:INT, b:BOOL, c:CHAR'
    },
    {
      term: '{(λx:INT.x) a, (λx:BOOL.x) b, (λx:INT->INT.x) f}.2',
      envType: 'Empty',
      envTerm: 'a:INT, b:BOOL, f:INT->INT'
    },
    {
      term: '(ΛX.ΛA.λf:A->X.f) A',
      envType: 'A',
      envTerm: 'Empty'
    }
  ],
  untypedExamples: [
    { term: '(λx.x x) y' },
    { term: '(λx.x x) (λx.x x)' },
    { term: '(λx.λy.x y) f a' },
    { term: '(λx.λy.x y) ((λx.x) y)' },
    { term: '(λx.λy.λz.x y z) (a, b, c) (d, e, f) (g, h, i)' },
    { term: '(λx.x x) (a, b, c, d, e, (λx.x) f).6' }
  ],
  helps: [
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
})

export const getters = {
  typedExamples(state) {
    return state.typedExamples
  },
  untypedExamples(state) {
    return state.untypedExamples
  },
  helps(state) {
    return state.helps
  }
}
