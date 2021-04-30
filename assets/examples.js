export const typedExamples = [
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
    term: '(ΛX.ΛA.λf:A->X.f) String',
    envType: 'String',
    envTerm: 'Empty'
  }
]

export const untypedExamples = [
  { term: '(λx.x x) y' },
  { term: '(λx.x x) (λx.x x)' },
  { term: '(λx.λy.x y) f a' },
  { term: '(λx.λy.x y) ((λx.x) y)' },
  { term: '(λx.λy.λz.x y z) {a, b, c} {d, e, f} {g, h, i}' },
  { term: '(λx.x x) {a, b, c, d, e, (λx.x) f}.6' }
]

export const examples = {
  addition: [
    {
      formula: '1 + 1'
    },
    {
      formula: '10 + 10'
    },
    {
      formula: '100 + 100'
    },
    {
      formula: '1000 + 1000'
    },
    {
      formula: '5000 + 5000'
    },
    {
      formula: '10000 + 10000'
    },
  ],
  subtraction: [
    {
      formula: '10 - 1'
    },
    {
      formula: '100 - 10'
    },
    {
      formula: '1000 - 100'
    },
    {
      formula: '10000 - 1000'
    },
    {
      formula: '50000 - 5000'
    },
    {
      formula: '100000 - 10000'
    },
  ]
}