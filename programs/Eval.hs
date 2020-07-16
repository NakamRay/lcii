module Eval where

import Data.List
import Data.Maybe

import Typing
import DataType
import Coloring
import Parser

-------------------------------------------------------------------------------
-- One step reduction
-------------------------------------------------------------------------------
reduction t pos = eval t [] pos (getFV t)

eval :: Expr -> [Int] -> [Int] -> [Id] -> Expr
eval (A (L x tau t1) t2) cPos rPos bv =
    if cPos == rPos
        then assign t1 x t2 bv
        else A (eval (L x tau t1) (cPos ++ [1]) rPos bv) (eval t2 (cPos ++ [2]) rPos bv)
eval (A t1 t2)    cPos rPos bv = A (eval t1 (cPos ++ [1]) rPos bv) (eval t2 (cPos ++ [2]) rPos bv)
eval (L x tau t)  cPos rPos bv = L x tau $ eval t (cPos ++ [1]) rPos (x:bv)
eval (T ts)       cPos rPos bv = T $ [ eval (ts !! (i-1)) (cPos ++ [i]) rPos bv | i <- [1..length ts] ]
eval (P (T ts) i) cPos rPos bv =
    if cPos == rPos
        then ts !! (i-1)
        else P (eval (T ts) (cPos ++ [1]) rPos bv) i
eval (P t i)       cPos rPos bv = P (eval t (cPos ++ [1]) rPos bv) i
eval (Inj i m tau) cPos rPos bv = Inj i (eval m (cPos ++ [1]) rPos bv) tau
eval (Case (Inj i m tau) ms) cPos rPos bv =
    if cPos == rPos
        then A (ms !! (i-1)) m
        else Case (eval (Inj i m tau) (cPos ++ [1]) rPos bv) [ eval (ms !! (i-1)) (cPos ++ [2] ++ [i]) rPos bv | i <- [1..length ms] ]
eval (Case m ms) cPos rPos bv = Case (eval m (cPos ++ [1]) rPos bv) [ eval (ms !! (i-1)) (cPos ++ [2] ++ [i]) rPos bv | i <- [1..length ms] ]
eval t cPos rPos bv = t

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
assign (T ms)      name t bv = T $ map (\x -> assign x name t bv) ms
assign (P m i)     name t bv = P (assign m name t bv) i
assign (Inj i m tau) name t bv = Inj i (assign m name t bv) tau
assign (Case m ms) name t bv = Case (assign m name t bv) (map (\x -> assign x name t bv) ms)
assign e           name t bv = e

getFV :: Expr -> [Id]
getFV (C x tau)     = []
getFV (V x)         = [x]
getFV (A m1 m2)     = getFV m1 ++ getFV m2
getFV (L x tau m)   = filter (/= x) $ getFV m
getFV (T ms)        = concat $ map getFV ms
getFV (P m i)       = getFV m
getFV (Inj i m tau) = getFV m
getFV (Case m ms)   = getFV m ++ concat (map getFV ms)
getFV m             = []

-------------------------------------------------------------------------------
-- α-conversion
-------------------------------------------------------------------------------
gA t pos = getAlpha t [] pos (getFV t)

getAlpha :: Expr -> [Int] -> [Int] -> [Id] -> [String]
getAlpha (C x tau) cPos rPos bv = []
getAlpha (V x)     cPos rPos bv = []
getAlpha (A (L x tau t1) t2) cPos rPos bv =
    if cPos == rPos
        then getA t1 x t2 bv
        else getAlpha (L x tau t1) (cPos ++ [1]) rPos bv ++ getAlpha t2 (cPos ++ [2]) rPos bv
getAlpha (A t1 t2)    cPos rPos bv = getAlpha t1 (cPos ++ [1]) rPos bv ++ getAlpha t2 (cPos ++ [2]) rPos bv
getAlpha (L x tau t)  cPos rPos bv = getAlpha t (cPos ++ [1]) rPos (x:bv)
getAlpha (T ts)       cPos rPos bv = concat [ getAlpha (ts !! (i-1)) (cPos ++ [i]) rPos bv | i <- [1..length ts] ]
getAlpha (P (T ts) i) cPos rPos bv =
    if cPos == rPos
        then []
        else getAlpha (T ts) (cPos ++ [1]) rPos bv
getAlpha (P t i)       cPos rPos bv = getAlpha t (cPos ++ [1]) rPos bv
getAlpha (Inj i m tau) cPos rPos bv = getAlpha m (cPos ++ [1]) rPos bv
getAlpha (Case m ms)   cPos rPos bv =
    if cPos == rPos
        then []
        else getAlpha m (cPos ++ [1]) rPos bv ++ concat [ getAlpha (ms !! (i-1)) (cPos ++ [2] ++ [i]) rPos bv | i <- [1..length ms] ]
getAlpha t             cPos rPos bv = []

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
getA (T ms)        name t bv = concat (map (\x -> getA x name t bv) ms)
getA (P m i)       name t bv = getA m name t bv
getA (Inj i m tau) name t bv = getA m name t bv
getA (Case m ms)   name t bv = getA m name t bv ++ concat (map (\x -> getA x name t bv) ms)
getA m             name t bv = []

-------------------------------------------------------------------------------
-- Show
-------------------------------------------------------------------------------
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

pRC :: Expr -> Pos -> [Int] -> [Int] -> String
pRC (C x tau) pos cPos rPos = coloring (elemIndex rPos pos) $ show (C x tau)
pRC (V x)     pos cPos rPos = coloring (elemIndex rPos pos) $ show (V x)
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
pRC (T ts)      pos cPos rPos = coloring (elemIndex rPos pos) "(" ++ pRCT ts pos cPos rPos 1 ++ coloring (elemIndex rPos pos) ")"
    where
        pRCT [] pos cPos rPos idx = " **Error: The term's list in this Tuple is empty.** "
        pRCT (t:[]) pos cPos rPos idx = pRC t pos (cPos ++ [idx]) rPos
        pRCT (t:ts) pos cPos rPos idx = pRC t pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ts pos cPos rPos (idx + 1)
pRC (P (T ts) i)  pos cPos rPos = pRC (T ts) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) "." ++ coloring (elemIndex cPos pos) (show i)
pRC (P t i)       pos cPos rPos = pRC t pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) "." ++ coloring (elemIndex rPos pos) (show i)
pRC (Inj i m (Variant taus)) pos cPos rPos = coloring (elemIndex rPos pos) ("(<" ++ show i ++ " = ") ++ pRC m pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) (">:" ++ show (Variant taus) ++ ")")
pRC (Case m ms)   pos cPos rPos = coloring (elemIndex rPos pos) "case " ++ pRC m pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) " of " ++ pRCT ms pos (cPos ++ [2]) rPos 1
    where
        pRCT [] pos cPos rPos idx = " **Error: The list in the Tuple is empty.** "
        pRCT (m:[]) pos cPos rPos idx = pRC m pos (cPos ++ [idx]) rPos
        pRCT (m:ms) pos cPos rPos idx = pRC m pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ms pos cPos rPos (idx + 1)
pRC m             pos cPos rPos = coloring (elemIndex rPos pos) $ show m

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
pRC' t pos cPos rPos = coloring (elemIndex rPos pos) $ showTerm t

-------------------------------------------------------------------------------
-- Position
-------------------------------------------------------------------------------
pos :: Expr -> Pos
pos (C x tau)     = [ [] ]
pos (V x)         = [ [] ]
pos (A m1 m2)     = [] : [ 1 : ps | ps <- pos m1] ++ [ 2 : ps | ps <- pos m2]
pos (L x tau m)   = [] : [ 1 : ps | ps <- pos m]
pos (T ms)        = [] : [ i : ps | i <- [1..length ms], ps <- pos (ms !! (i-1))]
pos (P m i)       = [] : [ 1 : ps | ps <- pos m]
pos (Inj i m tau) = [] : [ 1 : ps | ps <- pos m]
pos (Case m ms)   = [] : [ 1 : ps | ps <- pos m] ++ [ 2 : i : ps | i <- [1..length ms], ps <- pos (ms !! (i-1))]
pos t             = [ [] ]

getExpr :: Expr -> [Int] -> [Int] -> [Expr]
getExpr (A t1 t2)     cPos target = targetPos cPos target (A t1 t2) (getExpr t1 (cPos ++ [1]) target ++ getExpr t2 (cPos ++ [2]) target)
getExpr (L x tau t)   cPos target = targetPos cPos target (L x tau t) (getExpr t (cPos ++ [1]) target)
getExpr (T ts)        cPos target = targetPos cPos target (T ts) (concat [ getExpr (ts !! (i-1)) (cPos ++ [i]) target | i <- [1..length ts] ])
getExpr (P t i)       cPos target = targetPos cPos target (P t i) (getExpr t (cPos ++ [1]) target)
getExpr (Inj i m tau) cPos target = targetPos cPos target (Inj i m tau) (getExpr m (cPos ++ [1]) target)
getExpr (Case m ms)   cPos target = targetPos cPos target (Case m ms) (getExpr m (cPos ++ [1]) target ++ concat [ getExpr (ms !! (i-1)) (cPos ++ [2] ++ [i]) target | i <- [1..length ms] ])
getExpr t             cPos target = targetPos cPos target t []

targetPos cPos target t ts = if cPos == target then [t] else ts

getRedexPos :: Expr -> [Int] -> Pos
getRedexPos (A (L x tau t1) t2) cPos = cPos : getRedexPos (L x tau t1) (cPos ++ [1]) ++ getRedexPos t2 (cPos ++ [2])
getRedexPos (A t1 t2)     cPos = getRedexPos t1 (cPos ++ [1]) ++ getRedexPos t2 (cPos ++ [2])
getRedexPos (L x tau t)   cPos = getRedexPos t (cPos ++ [1])
getRedexPos (T ts)        cPos = concat [ getRedexPos (ts !! (i-1)) (cPos ++ [i]) | i <- [1..length ts] ]
getRedexPos (P (T ts) i)  cPos = cPos : getRedexPos (T ts) (cPos ++ [1])
getRedexPos (P t i)       cPos = getRedexPos t (cPos ++ [1])
getRedexPos (Inj i m tau) cPos = getRedexPos m (cPos ++ [1])
getRedexPos (Case (Inj i m tau) ms) cPos = cPos : getRedexPos (Inj i m tau) (cPos ++ [1]) ++ concat [ getRedexPos (ms !! (i-1)) (cPos ++ [2] ++ [i]) | i <- [1..length ms] ]
getRedexPos (Case m ms) cPos = getRedexPos m (cPos ++ [1]) ++ concat [ getRedexPos (ms !! (i-1)) (cPos ++ [2] ++ [i]) | i <- [1..length ms] ]
getRedexPos t cPos = []
