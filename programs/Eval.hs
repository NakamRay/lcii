module Eval where

import Data.List
import Data.Maybe
import Data.Char

import Control.Monad

import Typing
import DataType
import Coloring
import Parser

-- One step reduction
reduction t pos = evel t [] pos (getFV t)

evel :: Expr -> [Int] -> [Int] -> [Id] -> Expr
evel (A (L x tau t1) t2) cPos rPos bv =
    if cPos == rPos
        then assign t1 x t2 bv
        else A (evel (L x tau t1) (cPos ++ [1]) rPos bv) (evel t2 (cPos ++ [2]) rPos bv)
evel (A t1 t2) cPos rPos bv = A (evel t1 (cPos ++ [1]) rPos bv) (evel t2 (cPos ++ [2]) rPos bv)
evel (L x tau t) cPos rPos bv = L x tau $ evel t (cPos ++ [1]) rPos (x:bv)
evel (T ts) cPos rPos bv = T $ [ evel (ts !! (i-1)) (cPos ++ [i]) rPos bv | i <- [1..length ts] ]
evel (P (T ts) i) cPos rPos bv =
    if cPos == rPos
        then ts !! (i-1)
        else P (evel (T ts) (cPos ++ [1]) rPos bv) i
evel (P t i) cPos rPos bv = P (evel t (cPos ++ [1]) rPos bv) i
evel t cPos rPos bv = t

assign :: Expr -> String -> Expr -> [Id] -> Expr
assign (C x tau)   name t bv = C x tau
assign (V x)       name t bv = if x == name then t else V x
assign (A m1 m2)   name t bv = A (assign m1 name t bv) (assign m2 name t bv)
assign (L x tau m) name t bv = if x /= name && notElem x (getFV t)
                               then L x tau $ assign m name t (x:bv)
                               else if x /= name && elem x (getFV t)
                               then L new tau (assign (assign m x (V new) bv) name t (new:bv))
                               else L x tau m
                               where
                                   fresh = filter (\x -> notElem x (getFV m ++ getFV t)) bound
                                   new = (filter (\x -> notElem x bv) fresh) !! 0
assign (T ts)      name t bv = T $ map (\x -> assign x name t bv) ts
assign (P m i)     name t bv = P (assign m name t bv) i

getFV :: Expr -> [Id]
getFV (C x tau)   = []
getFV (V x)       = [x]
getFV (A m1 m2)   = getFV m1 ++ getFV m2
getFV (L x tau m) = filter (/= x) $ getFV m
getFV (T ts)      = concat $ map getFV ts
getFV (P t i)     = getFV t

-- α-conversion
gA t pos = getAlpha t [] pos (getFV t)

getAlpha :: Expr -> [Int] -> [Int] -> [Id] -> [String]
getAlpha (C x tau) cPos rPos bv = []
getAlpha (V x)     cPos rPos bv = []
getAlpha (A (L x tau t1) t2) cPos rPos bv =
    if cPos == rPos
        then getA t1 x t2 bv
        else getAlpha (L x tau t1) (cPos ++ [1]) rPos bv ++ getAlpha t2 (cPos ++ [2]) rPos bv
getAlpha (A t1 t2) cPos rPos bv = getAlpha t1 (cPos ++ [1]) rPos bv ++ getAlpha t2 (cPos ++ [2]) rPos bv
getAlpha (L x tau t) cPos rPos bv = getAlpha t (cPos ++ [1]) rPos (x:bv)
getAlpha (T ts) cPos rPos bv = concat [ getAlpha (ts !! (i-1)) (cPos ++ [i]) rPos bv | i <- [1..length ts] ]
getAlpha (P (T ts) i) cPos rPos bv =
    if cPos == rPos
        then []
        else getAlpha (T ts) (cPos ++ [1]) rPos bv
getAlpha (P t i) cPos rPos bv = getAlpha t (cPos ++ [1]) rPos bv

getA :: Expr -> String -> Expr -> [Id] -> [String]
getA (A m1 m2)   name t bv = getA m1 name t bv ++ getA m2 name t bv
getA (L x tau m) name t bv = if x /= name && notElem x (getFV t)
                                then []
                             else if x /= name && elem x (getFV t)
                                then [x ++ " -> " ++ new]
                             else []
                                where
                                    fresh = filter (\x -> notElem x (getFV m ++ getFV t)) bound
                                    new = (filter (\x -> notElem x bv) fresh) !! 0
getA (T ts)  name t bv = concat (map (\x -> getA x name t bv) ts)
getA (P m i) name t bv = getA m name t bv
getA m       name t bv = []

-- Names of bound variables
bound = ["x","y","z","u","v","w"] ++ map (:[]) ['a'..'t']

-- Interactive Intepreter
lcii :: IO ()
lcii = do
    putStrLn ""
    putStrLn "*****************************************************"
    putStrLn "    LCII: Lambda Calculus Interactive Interpreter    "
    putStrLn "*****************************************************"
    putStrLn ""
    putStrLn ":typed :t     change to using typed lambda calculus"
    putStrLn ":untyped :u   change to using untyped lambda calculus"
    putStrLn ""
    forM_ (repeat 1) $ \i -> do
        putStrLn "* input typed lambda term *"
        putStr "LCII > "
        t  <- getLine
        putStrLn "* input type environment *"
        putStr "LCII > "
        ga <- getLine
        ii (parseEnv ga) (parseExp t)
        putStrLn ""

ii :: [Decl] -> Expr -> IO ()
ii ga t = do
    putStrLn ""
    printWithColor t
    if hasFailure $ typing ga t
    then do
        putStrLn "Typing Error"
    else do
        if occ == []
        then do
            showGa ga
        else do
            showRedexes t
            putStr "Redex: "
            num <- getLine
            if not $ isNumber' num
            then do
                putStrLn $ "Invalid input"
                ii ga t
            else do
                let idx = (read num :: Int) - 1
                if idx > length occ - 1
                then do
                    putStrLn $ "The maximum redex number is " ++ show (length occ)
                    ii ga t
                else do
                    let alpha = gA t (occ !! idx)
                    if alpha == []
                    then do putStr ""
                    else do
                        putStrLn ""
                        putStr $ ansi' Reverse $ "α: " ++ (concat $ intersperse ", " alpha)
                        putStrLn ""
                    ii ga $ reduction t (occ !! idx)
    where
        occ = getRedexPos t []

isNumber' xs = all isDigit xs

iiUntyped :: Expr -> IO ()
iiUntyped t = do
    putStrLn ""
    printWithColor' t
    if occ == []
    then do
        putStr ""
    else do
        showRedexes' t
        putStr "Redex: "
        num <- getLine
        if not $ isNumber' num
        then do
            putStrLn $ "Invalid input"
            iiUntyped t
        else do
            let idx = (read num :: Int) - 1
            if idx > length occ - 1
            then do
                putStrLn $ "The maximum redex number is " ++ show (length occ)
                iiUntyped t
            else do
                let alpha = gA t (occ !! idx)
                if alpha == []
                then do putStr ""
                else do
                    putStrLn ""
                    putStr $ ansi' Reverse $ "α: " ++ (concat $ intersperse ", " alpha)
                    putStrLn ""
                iiUntyped $ reduction t (occ !! idx)
    where
        occ = getRedexPos t []

-- Show
showRedexes :: Expr -> IO ()
showRedexes t = do
    let loop i | i < length redexes = do
            putStrLn $ coloring (Just i) $ show (i + 1) ++ ". " ++ show (redexes !! i)
            loop $ i + 1
        loop _ = return ()
    loop 0
    where
        pos = getRedexPos t []
        redexes = map (\x -> (getExpr t [] x) !! 0) pos

-- for Untyped
showRedexes' :: Expr -> IO ()
showRedexes' t = do
    let loop i | i < length redexes = do
            putStrLn $ coloring (Just i) $ show (i + 1) ++ ". " ++ showTerm (redexes !! i)
            loop $ i + 1
        loop _ = return ()
    loop 0
    where
        pos = getRedexPos t []
        redexes = map (\x -> (getExpr t [] x) !! 0) pos

-- print redex with color
printWithColor :: Expr -> IO ()
printWithColor t = putStrLn $ pRC t (getRedexPos t []) [] []

printWithColor' :: Expr -> IO ()
printWithColor' t = putStrLn $ pRC' t (getRedexPos t []) [] []

-- coloring :: Maybe Int -> String -> String
-- coloring Nothing s = s
-- coloring (Just 0) s = ansi' Green s
-- coloring (Just 1) s = ansi' Cyan s
-- coloring (Just 2) s = ansi' Blue s
-- coloring (Just 3) s = ansi' Magenta s
-- coloring _ s = s

coloring :: Maybe Int -> String -> String
coloring Nothing s = s
coloring (Just 0) s = html' Green s
coloring (Just 1) s = html' Cyan s
coloring (Just 2) s = html' Blue s
coloring (Just 3) s = html' Magenta s
coloring _ s = s

pRC :: Expr -> Pos -> [Int] -> [Int] -> String
pRC (C x tau) pos cPos rPos = coloring (elemIndex rPos pos) $ show (C x tau)
pRC (V x) pos cPos rPos = coloring (elemIndex rPos pos) $ show (V x)
pRC (A (L x tau t1) t2) pos cPos rPos = coloring (elemIndex cPos pos) "(" ++ pRC (L x tau t1) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) ") " ++ exprM2
    where
        exprM2 = case t2 of
                    A m1 m2   -> coloring (elemIndex cPos pos) "("  ++ pRC (A m1 m2) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")" 
                    L x tau t -> coloring (elemIndex cPos pos) "("  ++ pRC (L x tau t) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")" 
                    m         -> pRC m pos (cPos ++ [2]) cPos
pRC (A t1 t2) pos cPos rPos = exprL ++ " " ++ exprR
    where
        exprL = case t1 of
                    L x tau t -> coloring (elemIndex rPos pos) "("  ++ pRC (L x tau t) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")" 
                    m         -> pRC m pos (cPos ++ [1]) rPos
        exprR = case t2 of
                    A m1 m2   -> coloring (elemIndex rPos pos) "("  ++ pRC (A m1 m2) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    L x tau t -> coloring (elemIndex rPos pos) "("  ++ pRC (L x tau t) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    m         -> pRC m pos (cPos ++ [2]) rPos
pRC (L x tau t) pos cPos rPos = coloring (elemIndex rPos pos) "λ" ++ coloring (elemIndex rPos pos) x ++ coloring (elemIndex rPos pos) ":" ++ coloring (elemIndex rPos pos) (show tau) ++ coloring (elemIndex rPos pos) "." ++ pRC t pos (cPos ++ [1]) rPos
pRC (T ts) pos cPos rPos = coloring (elemIndex rPos pos) "(" ++ pRCT ts pos cPos rPos 1 ++ coloring (elemIndex rPos pos) ")"
    where
        pRCT [] pos cPos rPos idx = " **Error: The term's list in this Tuple is empty.** "
        pRCT (t:[]) pos cPos rPos idx = pRC t pos (cPos ++ [idx]) rPos
        pRCT (t:ts) pos cPos rPos idx = pRC t pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ts pos cPos rPos (idx + 1)
pRC (P (T ts) i) pos cPos rPos = pRC (T ts) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) "." ++ coloring (elemIndex cPos pos) (show i)
pRC (P t i) pos cPos rPos = pRC t pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) "." ++ coloring (elemIndex rPos pos) (show i)

-- for untyped
pRC' :: Expr -> Pos -> [Int] -> [Int] -> String
pRC' (C x tau) pos cPos rPos = coloring (elemIndex rPos pos) $ showTerm (C x tau)
pRC' (V x) pos cPos rPos = coloring (elemIndex rPos pos) $ showTerm (V x)
pRC' (A (L x tau t1) t2) pos cPos rPos = coloring (elemIndex cPos pos) "(" ++ pRC' (L x tau t1) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) ") " ++ exprM2
    where
        exprM2 = case t2 of
                    A m1 m2   -> coloring (elemIndex cPos pos) "("  ++ pRC' (A m1 m2) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")" 
                    L x tau t -> coloring (elemIndex cPos pos) "("  ++ pRC' (L x tau t) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")" 
                    m         -> pRC' m pos (cPos ++ [2]) cPos
pRC' (A t1 t2) pos cPos rPos = exprL ++ " " ++ exprR
    where
        exprL = case t1 of
                    L x tau t -> coloring (elemIndex rPos pos) "("  ++ pRC' (L x tau t) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")" 
                    m         -> pRC' m pos (cPos ++ [1]) rPos
        exprR = case t2 of
                    A m1 m2   -> coloring (elemIndex rPos pos) "("  ++ pRC' (A m1 m2) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    L x tau t -> coloring (elemIndex rPos pos) "("  ++ pRC' (L x tau t) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    m         -> pRC' m pos (cPos ++ [2]) rPos
pRC' (L x tau t) pos cPos rPos = coloring (elemIndex rPos pos) "λ" ++ coloring (elemIndex rPos pos) x  ++ coloring (elemIndex rPos pos) "." ++ pRC' t pos (cPos ++ [1]) rPos
pRC' (T ts) pos cPos rPos = coloring (elemIndex rPos pos) "(" ++ pRCT ts pos cPos rPos 1 ++ coloring (elemIndex rPos pos) ")"
    where
        pRCT [] pos cPos rPos idx = " **Error: The term's list in this Tuple is empty.** "
        pRCT (t:[]) pos cPos rPos idx = pRC' t pos (cPos ++ [idx]) rPos
        pRCT (t:ts) pos cPos rPos idx = pRC' t pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ts pos cPos rPos (idx + 1)
pRC' (P (T ts) i) pos cPos rPos = pRC' (T ts) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) "." ++ coloring (elemIndex cPos pos) (show i)
pRC' (P t i) pos cPos rPos = pRC' t pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) "." ++ coloring (elemIndex rPos pos) (show i)

-- Position
pos :: Expr -> Pos
pos (C x tau)   = [ [] ]
pos (V x)       = [ [] ]
pos (A t1 t2)   = [] : [ 1 : ps | ps <- pos t1] ++ [ 2 : ps | ps <- pos t2]
pos (L x tau t) = [] : [ 1 : ps | ps <- pos t]
pos (T ts)      = [] : [ i : ps | i <- [1..length ts], ps <- pos (ts !! (i-1))]
pos (P t i)     = [] : [ 1 : ps | ps <- pos t]

getExpr :: Expr -> [Int] -> [Int] -> [Expr]
getExpr (A t1 t2) cPos target = targetPos cPos target (A t1 t2) (getExpr t1 (cPos ++ [1]) target ++ getExpr t2 (cPos ++ [2]) target)
getExpr (L x tau t) cPos target = targetPos cPos target (L x tau t) (getExpr t (cPos ++ [1]) target)
getExpr (T ts) cPos target = targetPos cPos target (T ts) (concat $ [ getExpr (ts !! (i-1)) (cPos ++ [i]) target | i <- [1..length ts] ])
getExpr (P t i) cPos target = targetPos cPos target (P t i) (getExpr t (cPos ++ [1]) target)
getExpr t cPos target = targetPos cPos target t []

targetPos cPos target t ts = if cPos == target then [t] else ts

getRedexPos :: Expr -> [Int] -> Pos
getRedexPos (A (L x tau t1) t2) cPos =
    cPos : getRedexPos (L x tau t1) (cPos ++ [1]) ++ getRedexPos t2 (cPos ++ [2])
getRedexPos (A t1 t2) cPos = getRedexPos t1 (cPos ++ [1]) ++ getRedexPos t2 (cPos ++ [2])
getRedexPos (L x tau t) cPos = getRedexPos t (cPos ++ [1])
getRedexPos (T ts) cPos = concat $ [ getRedexPos (ts !! (i-1)) (cPos ++ [i]) | i <- [1..length ts] ]
getRedexPos (P (T ts) i) cPos = cPos : getRedexPos (T ts) (cPos ++ [1])
getRedexPos (P t i) cPos = getRedexPos t (cPos ++ [1])
getRedexPos t cPos = []

-- Typing error
hasFailure :: Type -> Bool
hasFailure (tau1 :=> tau2) = hasFailure tau1 || hasFailure tau2
hasFailure (Prod []) = False
hasFailure (Prod (tau:taus)) = hasFailure tau || hasFailure (Prod taus)
hasFailure Failure = True
hasFailure _ = False

-- Tests
test = ii (parseEnv "x:INT, y:INT, z:INT") (parseExp "((λx:INT.λy:INT.(λz:INT.x) y) y) z")

posTest = pos (A (P (T [(V "x"),(C "a" INT),(C "b" BOOL)]) 2) (L "y" INT (A (V "y") (C "a" INT))))

getRedexPosTest = getRedexPos (A (P (T [(C "a" INT),(A (L "z" BOOL (C "b" BOOL)) (C "c" BOOL))]) 2) (A (L "y" INT (A (V "y") (C "a" INT))) (C "b" BOOL))) []
