import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    typedExamples: [
      {
        term: '(λx:INT.x) a',
        env: 'a:INT'
      },
      {
        term: '(λx:INT->INT.λy:INT.x y) a b:INT',
        env: 'a:INT->INT'
      },
      {
        term: '(λx:INT.f x) ((λx:INT.x) a)',
        env: 'a:INT, f:INT->BOOL'
      },
      {
        term: '(λx:INT->INT.λy:INT.x y) y',
        env: 'y:INT->INT'
      },
      {
        term: '((λx:INT.(λy:INT.(λz:INT.x) y)) y) z',
        env: 'x:INT, y:INT, z:INT'
      },
      {
        term: '(λx:BOOL.f x) (a, b, c).3',
        env: 'a:INT, b:INT, c:BOOL, f:BOOL->BOOL'
      },
      {
        term: '(λx:(INT, INT, INT).x.3) (a, b, c)',
        env: 'a:INT, b:INT, c:INT'
      },
      {
        term: '((λx:INT.x) a, (λx:BOOL.x) b, (λx:INT->INT.x) f:INT->INT).2',
        env: 'a:INT, b:BOOL'
      }
    ],
    untypedExamples: [
      { term: '(λx.x x) y' },
      { term: '(λx.x x) (λx.x x)' },
      { term: '(λx.λy.x y) f a' },
      { term: '(λx.λy.x y) ((λx.x) y)' },
      { term: '(λx.λy.λz.x y z) (a, b, c) (d, e, f) (g, h, i)' },
      { term: '(λx.x x) (a, b, c, d, e, (λx.x) f).6' }
    ]
  },
  mutations: {
  },
  actions: {
  },
  modules: {
  }
})
