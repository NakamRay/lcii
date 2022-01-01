型無しラムダ計算・多相ラムダ計算の対話型インタプリタ
====

## Description
1ステップの簡約毎にRedexを選択可能にし，自由に簡約の過程を表示することができる．また，α変換を表示する．型付け規則もチェックする．

## Demo
型環境とラムダ式を入力

- Input
Type Context: `BOOL, INT`
Term Context: `a:BOOL->INT, b:BOOL`
Lambda Term : `(λx:BOOL->INT.x a) (λx:BOOL.x b)`

- Output
```
(λx:BOOL->INT.x a) (λx:BOOL.x b)
1. λx:BOOL->INT.x a
2. λx:BOOL.x b
```

簡約したいRedexの番号を入力

Input
`1`

Output
```
a (λx:BOOL.x b)
1. λx:BOOL.x b
```

簡約したいRedexの番号を入力

Input
`1`

Output
```
a b
a:BOOL->INT, b:BOOL
```

## Requirement
ghc
