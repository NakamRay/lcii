module Test where

import LCII

import Eval
import DataType
import Typing
import Parser

-------------------------------------------------------------------------------
-- Tests
-------------------------------------------------------------------------------

-- reduction test
test1 = ii [] (parseEnv "x:INT, y:INT, z:INT") (parseExp "((λx:INT.λy:INT.(λz:INT.x) y) y) z")
test2 = ii [] [] (parseExp "case (<fun1=i:INT>:<fun1:INT,fun2:BOOL>) of fun1 => λx:INT.x, fun2 => λx:BOOL.n:INT")
test3 = ii [] [] (parseExp "(λa:INT.case ((λx:<fun1:INT,fun2:BOOL>.x) (<fun1=i:INT>:<fun1:INT,fun2:BOOL>)) of fun1 => λx:INT.((λy:INT.y) x), fun2 => λx:BOOL.a) c:INT")

ltest = ii [] [] (F (R [("num", (C "i" INT)), ("boolean", (C "b" BOOL))]) "boolean")

ptest = ii [] [] $
  TyA
    (TyL "t"
      (A
        (A
          (L "x" (BOOL :=> INT) (V "x"))
          (C "f" (TyVar "t" :=> INT))
        )
        (A
          (L "x" (TyVar "t") (V "x"))
          (C "c" (TyVar "t"))
        )
      )
    )
    BOOL

ptest2 = ii [] [] $ parseExp "Λt.λf:t->INT.λc:t.(λx:t->INT.x) f ((λx:t.x) c)"

tytest1 = typing ["A"] [] (parseExp "λf:A->INT.f")
tytest2 = typing [] [] (parseExp "ΛA.λf:A->INT.f")
tytest3 = typing [] [] (parseExp "λf:A->INT.f") -- Failure
tytest4 = typing ["A"] [] (parseExp "(ΛX.ΛA.λf:A->X.f) A")

-- Position test
posTest = pos (A (P (T [(V "x"),(C "a" INT),(C "b" BOOL)]) 2) (L "y" INT (A (V "y") (C "a" INT))))
getRedexPosTest = getRedexPos (A (P (T [(C "a" INT),(A (L "z" BOOL (C "b" BOOL)) (C "c" BOOL))]) 2) (A (L "y" INT (A (V "y") (C "a" INT))) (C "b" BOOL))) []
