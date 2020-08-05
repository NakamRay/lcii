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
test1 = ii (parseEnv "x:INT, y:INT, z:INT") (parseExp "((λx:INT.λy:INT.(λz:INT.x) y) y) z")
test2 = ii [] (parseExp "case (<fun1=i:INT>:<fun1:INT,fun2:BOOL>) of fun1 => λx:INT.x, fun2 => λx:BOOL.n:INT")
test3 = ii [] (parseExp "(λa:INT.case ((λx:<fun1:INT,fun2:BOOL>.x) (<fun1=i:INT>:<fun1:INT,fun2:BOOL>)) of fun1 => λx:INT.((λy:INT.y) x), fun2 => λx:BOOL.a) c:INT")

testtt = ii [] (F (R [("num", (C "i" INT)), ("boolean", (C "b" BOOL))]) "boolean")

-- Typing test
typingTest1 = typing [] $ Case (Inj 1 (C "i" INT) (Variant [INT, BOOL])) [L "x" INT (V "x"), L "x" BOOL (C "n" INT)]

-- Position test
posTest = pos (A (P (T [(V "x"),(C "a" INT),(C "b" BOOL)]) 2) (L "y" INT (A (V "y") (C "a" INT))))
getRedexPosTest = getRedexPos (A (P (T [(C "a" INT),(A (L "z" BOOL (C "b" BOOL)) (C "c" BOOL))]) 2) (A (L "y" INT (A (V "y") (C "a" INT))) (C "b" BOOL))) []
