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

iiTest xi ga t = do
  putStrLn $ "Ξ  : " ++ xi
  putStrLn $ "Γ  : " ++ ga
  putStrLn $ "Exp: " ++ t
  ii (parseTypeContext xi) (parseEnv ga) (parseExp t)

-- reduction test
utest1 = iiUntyped $ parseTerm "((λx.λy.(λz.x) y) y) z"
utest2 = iiUntyped $ parseTerm "case (<fun1=y>) of fun1 => λx.x, fun2 => λx.z"
utest3 = iiUntyped $ parseTerm "{num=i, boolean=b}.boolean"
utest4 = iiUntyped $ parseTerm "{x, y, z}.2"
utest6 = iiUntyped $ parseTerm "case (<inc=2>) of inc => λx.x + 1, dec => λx.x - 1"
utest7 = iiUntyped $ parseTerm "(λn.(n (λx.false)) true) 0"
utest8 = iiUntyped $ parseTerm "(λn.(n (λx.false)) true) 1"

test1 = iiTest "Empty" "x:INT, y:INT, z:INT" "((λx:INT.λy:INT.(λz:INT.x) y) y) z"
test2 = iiTest "Empty" "i:INT, n:INT" "case (<fun1=i>:<fun1:INT,fun2:BOOL>) of fun1 => λx:INT.x, fun2 => λx:BOOL.n"
test3 = iiTest "Empty" "i:INT, n:INT" "(λa:INT.case ((λx:<fun1:INT,fun2:BOOL>.x) (<fun1=i>:<fun1:INT,fun2:BOOL>)) of fun1 => λx:INT.((λy:INT.y) x), fun2 => λx:BOOL.a) n"
test4 = iiTest "String" "s:String, i:INT" "(λx:{name:String, age:INT}.x.name) {name=s, age=i}"

ltest = iiTest "Empty" "i:INT, b:BOOL" "{num=i, boolean=b}.boolean"

ptest2 = iiTest "Empty" "Empty" "ΛT.λf:T->INT.λc:T.(λx:T->INT.x) f ((λx:T.x) c)"

-- typing test
tytPoly1 = typingTest "Empty" "Empty" "ΛA.λf:A->INT.f"
tytPoly2 = typingTest "A" "Empty" "(ΛX.ΛA.λf:A->X.f) A"
tytXi1   = typingTest "A" "Empty" "λf:A->INT.f"
tytXi2   = typingTest "Empty" "Empty" "λf:A->INT.f" -- Failure
tytRec   = typingTest "T1, T2" "m:{l1:T1, l2:T2}" "m.l2"

tytMap = typingTest "CHAR" "map:(∀A.∀B.(A -> B) -> ListA -> ListB)" "map INT CHAR"
tytest = typingTest "CHAR" "Empty" "((ΛA.ΛB.a:A->B) INT) CHAR"

{-map f [] = []
  map f (x:xs) = f x : map f xs
  
  \f -> \ys -> case ys of
                        [] -> []
                        (x:xs) -> f x : map f xs
  -}


-- Position test
posTest = pos (A (P (T [(V "x"),(C "a" INT),(C "b" BOOL)]) 2) (L "y" INT (A (V "y") (C "a" INT))))
getRedexPosTest = getRedexPos (A (P (T [(C "a" INT),(A (L "z" BOOL (C "b" BOOL)) (C "c" BOOL))]) 2) (A (L "y" INT (A (V "y") (C "a" INT))) (C "b" BOOL))) []
