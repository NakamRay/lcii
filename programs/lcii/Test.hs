module Test where

import LCII

import Eval
import DataType
import Typing
import Parser

-------------------------------------------------------------------------------
-- Tests
-------------------------------------------------------------------------------

typingTest xi ga t = do
  putStrLn $ "Ξ  : " ++ xi
  putStrLn $ "Γ  : " ++ ga
  putStrLn $ "Exp: " ++ t
  putStrLn $ "τ  : " ++ show (typing (parseTypeContext xi) (parseEnv ga) (parseExp t))

utest1 = iiUntyped (parseTerm "((λx.λy.(λz.x) y) y) z")
utest2 = iiUntyped (parseTerm "case (<fun1=y>) of fun1 => λx.x, fun2 => λx.z")
utest3 = iiUntyped (parseTerm "{num=i, boolean=b}.boolean")
utest4 = iiUntyped (parseTerm "{x, y, z}.2")
utest5 = iiUntyped (parseTerm "case (<fun1=y>) of fun1 => λx.x, fun2 => {num=i, boolean=b}.boolean")
utest6 = iiUntyped $ parseTerm "case (<plus=2>) of plus => λx.x + 1"

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

tytPoly1 = typingTest "Empty" "Empty" "ΛA.λf:A->INT.f"
tytPoly2 = typingTest "A" "Empty" "(ΛX.ΛA.λf:A->X.f) A"
tytXi1   = typingTest "A" "Empty" "λf:A->INT.f"
tytXi2   = typingTest "Empty" "Empty" "λf:A->INT.f" -- Failure
tytRec   = typingTest "T1, T2" "m:{l1:T1, l2:T2}" "m.l2"

-- Position test
posTest = pos (A (P (T [(V "x"),(C "a" INT),(C "b" BOOL)]) 2) (L "y" INT (A (V "y") (C "a" INT))))
getRedexPosTest = getRedexPos (A (P (T [(C "a" INT),(A (L "z" BOOL (C "b" BOOL)) (C "c" BOOL))]) 2) (A (L "y" INT (A (V "y") (C "a" INT))) (C "b" BOOL))) []
