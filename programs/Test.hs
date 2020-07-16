module Test where

import LCII

import Eval
import DataType
import Parser

-------------------------------------------------------------------------------
-- Tests
-------------------------------------------------------------------------------

-- reduction test
test1 = ii (parseEnv "x:INT, y:INT, z:INT") (parseExp "((λx:INT.λy:INT.(λz:INT.x) y) y) z")
test2 = ii [] (Case (Inj 1 (C "i" INT) (Variant [INT, BOOL])) [L "x" INT (V "x"), L "x" BOOL (C "n" INT)])
test3 = ii [] (
    Case (
        A (L "x" (Variant [INT, BOOL]) (V "x")) (Inj 1 (A (L "x" INT (V "x")) (C "i" INT)) (Variant [INT, BOOL]))
        )
        [L "x" INT (A (L "y" INT (V "y")) (V "x")),
         L "x" BOOL (A (L "y" INT (V "y")) (C "n" INT))]
    )

-- Typing test
typingTest1 = typing [] $ Case (Inj 1 (C "i" INT) (Variant [INT, BOOL])) [L "x" INT (V "x"), L "x" BOOL (C "n" INT)]

-- Position test
posTest = pos (A (P (T [(V "x"),(C "a" INT),(C "b" BOOL)]) 2) (L "y" INT (A (V "y") (C "a" INT))))
getRedexPosTest = getRedexPos (A (P (T [(C "a" INT),(A (L "z" BOOL (C "b" BOOL)) (C "c" BOOL))]) 2) (A (L "y" INT (A (V "y") (C "a" INT))) (C "b" BOOL))) []
