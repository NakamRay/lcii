module Eval where

import Data.List
import Data.Maybe
import Data.Set as S hiding (map)

import Control.Monad
import Control.Monad.Except

import Typing
import DataType
import Coloring
import Parser

import Unbound.LocallyNameless
import Unbound.LocallyNameless.Ops (unsafeUnbind)
import Unbound.LocallyNameless.Name

-------------------------------------------------------------------------------
-- One step reduction
-------------------------------------------------------------------------------
reduction t pos = eval t [] pos

redTest = runLFreshM $ reduction (A (lam x INT (lam y INT (V x))) (V y)) []

lam :: TmName -> Type -> Expr -> Expr
lam x tau m = L $ bind (x, Embed tau) m

subsTest :: LFreshM Expr
subsTest = return $ subst y (V z) (subst x (V y) (lam y INT (V x)))

test1 :: Expr -> LFreshM (Maybe Bool)
test1 (L bnd) = do
    lunbind bnd $ \((x, Embed tau), m) -> do
    case m of
        V y -> return $ Just $ isBound y
        otherwise -> return Nothing

test2 = runLFreshM $ test1 (lam x INT (V x))

test3 = runLFreshM $ reduction (parseExp "(λx:INT.λy:INT.x) y") []

test4 = runLFreshM $ reduction (v2f (parseExp "(λx:INT.λy:INT.x) y")) []

-- type M = ExceptT String LLFreshM
eval :: Expr -> [Int] -> [Int] -> LFreshM Expr
eval (A m1 m2)    cPos rPos = do
    m1' <- eval m1 (cPos ++ [1]) rPos
    m2' <- eval m2 (cPos ++ [2]) rPos
    case m1 of
        L bnd -> do
            lunbind bnd $ \((x, Embed tau), m) -> do
            if cPos == rPos
                then do
                    ac $ subst x m2 m
                    -- return $ subst x m2 m
                else return $ A m1' m2'
        otherwise -> return $ A m1' m2'
eval (L bnd)  cPos rPos = do
    lunbind bnd $ \((x, Embed tau), m) -> do
    m' <- eval m (cPos ++ [1]) rPos
    return $ L (bind (x, Embed tau) m')
eval (T ms)       cPos rPos = return $ T [ runLFreshM $ eval (ms !! (i-1)) (cPos ++ [i]) rPos | i <- [1..length ms] ]
eval (P (T ms) i) cPos rPos =
    if cPos == rPos
        then return $ ms !! (i-1)
        else do
            ms' <- eval (T ms) (cPos ++ [1]) rPos
            return $ P ms' i
eval (P m i)       cPos rPos = do
    m' <- eval m (cPos ++ [1]) rPos
    return $ P m' i
eval (R ms)        cPos rPos = return $ R [ (fst (ms !! (i-1)), runLFreshM $ eval (snd (ms !! (i-1))) (cPos ++ [i]) rPos) | i <- [1..length ms] ]
eval (F (R ms) s)  cPos rPos =
    if cPos == rPos
        then return $ caseFind ms s
        else do
            ms' <- eval (R ms) (cPos ++ [1]) rPos
            return $ F ms' s
eval (F m s)       cPos rPos = do
    m' <- eval m (cPos ++ [1]) rPos
    return $ F m' s
eval (Inj s m tau) cPos rPos = do
    m' <- eval m (cPos ++ [1]) rPos
    return $ Inj s m' tau
eval (Case (Inj s m tau) ms) cPos rPos =
    if cPos == rPos
        then return $ A (caseFind ms s) m
        else return $ Case (runLFreshM $ eval (Inj s m tau) (cPos ++ [1]) rPos) [ ((fst (ms !! (i-1))), runLFreshM $ eval (snd (ms !! (i-1))) (cPos ++ [2] ++ [i]) rPos) | i <- [1..length ms] ]
eval (Case m ms) cPos rPos = return $ Case (runLFreshM $ eval m (cPos ++ [1]) rPos) [ (fst (ms !! (i-1)), runLFreshM $ eval (snd (ms !! (i-1))) (cPos ++ [2] ++ [i]) rPos) | i <- [1..length ms] ]
eval (TyL bnd)   cPos rPos = return $ TyL (bind t (runLFreshM $ eval m (cPos ++ [1]) rPos))
    where
        (t, m) = unsafeUnbind bnd
eval (TyA (TyL bnd) tau) cPos rPos =
    if cPos == rPos
        then return $ substBind bnd tau
        else return $ TyA (runLFreshM $ eval (TyL bnd) (cPos ++ [1]) rPos) tau
    where
        (t, m) = unsafeUnbind bnd
eval (TyA m tau)   cPos rPos = return $ TyA (runLFreshM $ eval m (cPos ++ [1]) rPos) tau
eval t cPos rPos = return $ t

caseFind :: [(String, Expr)] -> String -> Expr
caseFind ((s, m):[]) s' = if s == s' then m else U
caseFind ((s, m):ss) s' = if s == s' then m else caseFind ss s'

-- avoidCapture
ac :: Expr -> LFreshM Expr
ac (C x tau)   = return $ C x tau
ac (V x)       = return $ V x
ac (A m1 m2)   = do
    m1' <- ac m1
    m2' <- ac m2
    return $ A m1' m2'
ac (L bnd)     =
    lunbind bnd $ \((x, Embed tau), m) -> do
        if notElem x (fv m :: [TmName])
        -- if notElem (name2String x) (map name2String (fv m :: [TmName]))
        then do
            m' <- ac m
            return $ L (bind (x, Embed tau) m')
        else do
            new <- lfresh x
            return $ L (bind (new, Embed tau) (subst x (V new) m))
ac (T ms)        = return $ T $ map (\x -> runLFreshM $ ac x) ms
ac (P m i)       = return $ P (runLFreshM $ ac m) i
ac (R ms)        = return $ R (map (\(s,m') -> (s, runLFreshM $ ac m')) ms)
ac (F m s)       = return $ F (runLFreshM $ ac m) s
ac (Inj s m tau) = return $ Inj s (runLFreshM $ ac m) tau
ac (Case m ms)   = return $ Case (runLFreshM $ ac m) (map (\(s,m') -> (s, runLFreshM $ ac m')) ms)
ac (TyL bnd)     = return $ TyL (bind t (runLFreshM $ ac m))
    where
        (t, m) = unsafeUnbind bnd
ac (TyA m t)   = return $ TyA (runLFreshM $ ac m) t
ac e           = return $ e

v2f :: Expr -> Expr
v2f t = let fvs = fv t :: [TmName]
        in  Data.List.foldl (\t x -> subst x (FV x) t) t fvs

-- assign :: Expr -> String -> Expr -> [Id] -> Expr
-- assign (C x tau)   name am bv = C x tau
-- assign (V x)       name am bv = if x == name then am else V x
-- assign (A m1 m2)   name am bv = A (assign m1 name am bv) (assign m2 name am bv)
-- assign (L x tau m) name am bv = if x /= name && notElem x (getFV am)
--                                then L x tau $ assign m name am (x:bv)
--                                else if x /= name && elem x (getFV am)
--                                then L new tau (assign (assign m x (V new) bv) name am (new:bv))
--                                else L x tau m
--                                where
--                                    fresh = filter (\x -> notElem x (getFV m ++ getFV am)) bound
--                                    new = (filter (\x -> notElem x bv) fresh) !! 0
-- assign (T ms)      name am bv = T $ map (\x -> assign x name am bv) ms
-- assign (P m i)     name am bv = P (assign m name am bv) i
-- assign (R ms)      name am bv = R (map (\(s,m') -> (s, assign m' name am bv)) ms)
-- assign (F m s)     name am bv = F (assign m name am bv) s
-- assign (Inj s m tau) name am bv = Inj s (assign m name am bv) tau
-- assign (Case m ms) name am bv = Case (assign m name am bv) (map (\(s,m') -> (s, assign m' name am bv)) ms)
-- assign (TyL t m)   name am bv = TyL t $ assign m name am bv
-- assign (TyA m t)   name am bv = TyA (assign m name am bv) t
-- assign e           name am bv = e

assign :: Expr -> TmName -> Expr -> LFreshM Expr
assign (C x tau)   name am = return $ C x tau
assign (V x)       name am = if x == name then return $ am else return $ V x
assign (A m1 m2)   name am = return $ A (runLFreshM $ assign m1 name am) (runLFreshM $ assign m2 name am)
assign (L bnd) name am =
    let
        ((x, Embed tau), m) = unsafeUnbind bnd
        new = runLFreshM $ lfresh x
    in
        if x /= name && notElem x (fv am :: [TmName])
        then return $ L (bind (x, Embed tau) (runLFreshM $ assign m name am))
        else if x /= name && elem x (fv am :: [TmName])
        then return $ L (bind (new, Embed tau) (runLFreshM $ assign (runLFreshM $ assign m x (V new)) name am))
        else return $ L bnd
assign (T ms)        name am = return $ T $ map (\x -> runLFreshM $ assign x name am) ms
assign (P m i)       name am = return $ P (runLFreshM $ assign m name am) i
assign (R ms)        name am = return $ R (map (\(s,m') -> (s, runLFreshM $ assign m' name am)) ms)
assign (F m s)       name am = return $ F (runLFreshM $ assign m name am) s
assign (Inj s m tau) name am = return $ Inj s (runLFreshM $ assign m name am) tau
assign (Case m ms)   name am = return $ Case (runLFreshM $ assign m name am) (map (\(s,m') -> (s, runLFreshM $ assign m' name am)) ms)
assign (TyL bnd)     name am = return $ TyL (bind t (runLFreshM $ assign m name am))
    where
        (t, m) = unsafeUnbind bnd
assign (TyA m t)   name am = return $ TyA (runLFreshM $ assign m name am) t
assign e           name am = return $ e

{--

-- getFV :: Expr -> [Id]
-- getFV (C x tau)     = []
-- getFV (V x)         = [x]
-- getFV (A m1 m2)     = getFV m1 ++ getFV m2
-- getFV (L x tau m)   = filter (/= x) $ getFV m
-- getFV (T ms)        = concat $ map getFV ms
-- getFV (P m i)       = getFV m
-- getFV (R ms)        = concat (map getFV (map snd ms))
-- getFV (F m s)       = getFV m
-- getFV (Inj s m tau) = getFV m
-- getFV (Case m ms)   = getFV m ++ concat (map getFV (map snd ms))
-- getFV (TyL t m)     = getFV m
-- getFV (TyA m t)     = getFV m
-- getFV m             = []

-------------------------------------------------------------------------------
-- α-conversion
-------------------------------------------------------------------------------
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
getAlpha (P m i)       cPos rPos bv = getAlpha m (cPos ++ [1]) rPos bv
getAlpha (R ms)        cPos rPos bv =
    if cPos == rPos
        then []
        else concat [ getAlpha (snd (ms !! (i-1))) (cPos ++ [i]) rPos bv | i <- [1..length ms] ]
getAlpha (F m s)       cPos rPos bv = getAlpha m (cPos ++ [1]) rPos bv
getAlpha (Inj s m tau) cPos rPos bv = getAlpha m (cPos ++ [1]) rPos bv
getAlpha (Case m ms)   cPos rPos bv =
    if cPos == rPos
        then []
        else getAlpha m (cPos ++ [1]) rPos bv ++ concat [ getAlpha (snd (ms !! (i-1))) (cPos ++ [2] ++ [i]) rPos bv | i <- [1..length ms] ]
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
getA (R ms)        name t bv = concat (map (\(s,m') -> getA m' name t bv) ms)
getA (F m s)       name t bv = getA m name t bv
getA (Inj s m tau) name t bv = getA m name t bv
getA (Case m ms)   name t bv = getA m name t bv ++ concat (map (\(s,m') -> getA m' name t bv) ms)
getA m             name t bv = []

--}

-------------------------------------------------------------------------------
-- Numbers to Lambda Term
-------------------------------------------------------------------------------
n2l :: Expr -> Expr
n2l (A m1 m2) = A (n2l m1) (n2l m2)
n2l (L bnd) = L (bind (x, Embed tau) (n2l m))
    where
        ((x, Embed tau), m) = unsafeUnbind bnd
n2l (T ms) = T (map n2l ms)
n2l (P m i) = P (n2l m) i
n2l (R rs) = R (map (\(s,m) -> (s, n2l m)) rs)
n2l (F m s) = F (n2l m) s
n2l (Inj s m tau) = Inj s (n2l m) tau
n2l (Case m ms) = Case (n2l m) (map (\(s,m) -> (s, n2l m)) ms)
n2l (TyL bnd) = TyL (bind s (n2l m))
    where
        (s, m) = unsafeUnbind bnd
n2l (TyA m tau) = TyA (n2l m) tau
n2l (N i) = L (bind ((string2Name "f"), Embed Unit) (L  (bind (string2Name "x", Embed Unit) (encN i))))
n2l m = m

encN :: Int -> Expr
encN 0 = V $ string2Name "x"
encN i = A (V $ string2Name "f") (encN (i-1))

-- succ = parseExp "λn:UNIT.λf:UNIT.λx:UNIT.f (n f x)"

-------------------------------------------------------------------------------
-- Show
-------------------------------------------------------------------------------
showRedexes :: Bool -> Expr -> IO ()
showRedexes isU t = do
    let loop i | i < length redexes = do
            putStrLn $ coloring (Just i) $ show (i + 1) ++ ". " ++ pRCshow isU (redexes !! i)
            loop $ i + 1
        loop _ = return ()
    loop 0
    where
        pos = getRedexPos t []
        redexes = map (\x -> (getExpr t [] x) !! 0) pos

-- print redex with color
printWithColor :: Bool -> Expr -> IO ()
printWithColor isU t = putStrLn $ pRC isU t (getRedexPos t []) [] []

pRC :: Bool -> Expr -> Pos -> [Int] -> [Int] -> String
pRC isU (C x tau) pos cPos rPos = coloring (elemIndex rPos pos) $ pRCshow isU (C x tau)
pRC isU (V x)     pos cPos rPos = coloring (elemIndex rPos pos) $ pRCshow isU (V x)
pRC isU (A (L bnd) t2) pos cPos rPos = coloring (elemIndex cPos pos) "(" ++ pRC isU (L bnd) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) ") " ++ exprM2
    where
        exprM2 = case t2 of
                    A m1 m2   -> coloring (elemIndex cPos pos) "(" ++ pRC isU (A m1 m2) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")" 
                    L bnd     -> coloring (elemIndex cPos pos) "(" ++ pRC isU (L bnd) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")" 
                    TyL bnd   -> coloring (elemIndex cPos pos) "(" ++ pRC isU (TyL bnd) pos (cPos ++ [2]) cPos ++ coloring (elemIndex cPos pos) ")"
                    m         -> pRC isU m pos (cPos ++ [2]) cPos
pRC isU (A t1 t2) pos cPos rPos = exprL ++ " " ++ exprR
    where
        exprL = case t1 of
                    L bnd     -> coloring (elemIndex rPos pos) "(" ++ pRC isU (L bnd) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")" 
                    TyL bnd   -> coloring (elemIndex rPos pos) "(" ++ pRC isU (TyL bnd) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")"
                    m         -> pRC isU m pos (cPos ++ [1]) rPos
        exprR = case t2 of
                    A m1 m2   -> coloring (elemIndex rPos pos) "(" ++ pRC isU (A m1 m2) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    L bnd     -> coloring (elemIndex rPos pos) "(" ++ pRC isU (L bnd) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    TyL bnd   -> coloring (elemIndex rPos pos) "(" ++ pRC isU (TyL bnd) pos (cPos ++ [2]) rPos ++ coloring (elemIndex rPos pos) ")"
                    m         -> pRC isU m pos (cPos ++ [2]) rPos
pRC isU (L bnd) pos cPos rPos =
    coloring (elemIndex rPos pos) "λ" ++
    coloring (elemIndex rPos pos) (name2String x) ++
    (if isU then "" else coloring (elemIndex rPos pos) ":" ++
    coloring (elemIndex rPos pos) (show tau)) ++
    coloring (elemIndex rPos pos) "." ++
    pRC isU m pos (cPos ++ [1]) rPos
    where
        ((x, Embed tau), m) = unsafeUnbind bnd
pRC isU (T ts)      pos cPos rPos = coloring (elemIndex rPos pos) "{" ++ pRCT ts pos cPos rPos 1 ++ coloring (elemIndex rPos pos) "}"
    where
        pRCT [] pos cPos rPos idx = " **Error: The term's list in this Tuple is empty.** "
        pRCT (t:[]) pos cPos rPos idx = pRC isU t pos (cPos ++ [idx]) rPos
        pRCT (t:ts) pos cPos rPos idx = pRC isU t pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ts pos cPos rPos (idx + 1)
pRC isU (P (T ts) i)  pos cPos rPos = pRC isU (T ts) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) ("." ++ show i)
pRC isU (P m i)       pos cPos rPos = pRC isU m pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) "." ++ coloring (elemIndex rPos pos) (show i)
pRC isU (R ms)        pos cPos rPos = coloring (elemIndex rPos pos) "{" ++ pRCT ms pos cPos rPos 1 ++ coloring (elemIndex rPos pos) "}"
    where
        pRCT [] pos cPos rPos idx = " **Error: The list in the Rec is empty.** "
        pRCT ((s,m):[]) pos cPos rPos idx = coloring (elemIndex rPos pos) (s ++ " = ") ++ pRC isU m pos (cPos ++ [idx]) rPos
        pRCT ((s,m):ms) pos cPos rPos idx = coloring (elemIndex rPos pos) (s ++ " = ") ++ pRC isU m pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ms pos cPos rPos (idx + 1)
pRC isU (F (R ms) s)  pos cPos rPos = pRC isU (R ms) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) ("." ++ s)
pRC isU (F m s)       pos cPos rPos = pRC isU m pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) "." ++ coloring (elemIndex rPos pos) s
pRC isU (Inj s m (Var taus)) pos cPos rPos = coloring (elemIndex rPos pos) ("(<" ++ s ++ " = ") ++ pRC isU m pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) (">:" ++ show (Var taus) ++ ")")
pRC isU (Case (Inj s m t) ms) pos cPos rPos = coloring (elemIndex cPos pos) "case " ++ pRC isU (Inj s m t) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) " of " ++ pRCT ms pos (cPos ++ [2]) cPos 1
    where
        pRCT [] pos cPos rPos idx = " **Error: The list in the Case is empty.** "
        pRCT ((s,m):[]) pos cPos rPos idx = coloring (elemIndex rPos pos) (s ++ " => ") ++ pRC isU m pos (cPos ++ [idx]) rPos
        pRCT ((s,m):ms) pos cPos rPos idx = coloring (elemIndex rPos pos) (s ++ " => ")++ pRC isU m pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ms pos cPos rPos (idx + 1)
pRC isU (Case m ms) pos cPos rPos = coloring (elemIndex rPos pos) "case " ++ pRC isU m pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) " of " ++ pRCT ms pos (cPos ++ [2]) rPos 1
    where
        pRCT [] pos cPos rPos idx = " **Error: The list in the Case is empty.** "
        pRCT ((s,m):[]) pos cPos rPos idx = coloring (elemIndex rPos pos) (s ++ " => ") ++ pRC isU m pos (cPos ++ [idx]) rPos
        pRCT ((s,m):ms) pos cPos rPos idx = coloring (elemIndex rPos pos) (s ++ " => ") ++ pRC isU m pos (cPos ++ [idx]) rPos ++ coloring (elemIndex rPos pos) ", " ++ pRCT ms pos cPos rPos (idx + 1)
pRC isU (TyL bnd) pos cPos rPos = coloring (elemIndex rPos pos) ("Λ" ++ name2String t ++ ".") ++ pRC isU m pos (cPos ++ [1]) rPos
    where
        (t, m) = unsafeUnbind bnd
pRC isU (TyA (TyL bnd) tau) pos cPos rPos = coloring (elemIndex cPos pos) "(" ++ pRC isU (TyL bnd) pos (cPos ++ [1]) cPos ++ coloring (elemIndex cPos pos) ")" ++ " " ++ exprR
    where
        exprR = case tau of
                    Arr t1 t2  -> coloring (elemIndex cPos pos) $ "(" ++ showType (Arr t1 t2) ++ ")"
                    Poly bnd -> coloring (elemIndex cPos pos) $ "(" ++ showType (Poly bnd) ++ ")"
                    tau        -> coloring (elemIndex cPos pos) $ showType tau
pRC isU (TyA m tau) pos cPos rPos = exprL ++ " " ++ exprR
    where
        exprL = case m of
                    A m1 m2   -> coloring (elemIndex rPos pos) "(" ++ pRC isU (A m1 m2) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")"
                    L bnd     -> coloring (elemIndex rPos pos) "(" ++ pRC isU (L bnd) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")"
                    TyL bnd   -> coloring (elemIndex rPos pos) "(" ++ pRC isU (TyL bnd) pos (cPos ++ [1]) rPos ++ coloring (elemIndex rPos pos) ")"
                    m         -> pRC isU m pos (cPos ++ [1]) rPos
        exprR = case tau of
                    Arr t1 t2  -> coloring (elemIndex rPos pos) $ "(" ++ showType (Arr t1 t2) ++ ")"
                    Poly bnd -> coloring (elemIndex rPos pos) $ "(" ++ showType (Poly bnd) ++ ")"
                    tau        -> coloring (elemIndex rPos pos) $ showType tau
pRC isU m pos cPos rPos = coloring (elemIndex rPos pos) $ pRCshow isU m

pRCshow :: Bool -> Expr -> String
pRCshow isU m = if isU then showTerm m else show m

-------------------------------------------------------------------------------
-- Position
-------------------------------------------------------------------------------
pos :: Expr -> Pos
pos (C x tau)     = [ [] ]
pos (V x)         = [ [] ]
pos (A m1 m2)     = [] : [ 1 : ps | ps <- pos m1] ++ [ 2 : ps | ps <- pos m2]
pos (L bnd)   = [] : [ 1 : ps | ps <- pos m]
    where
        ((x, Embed tau), m) = unsafeUnbind bnd
pos (T ms)        = [] : [ i : ps | i <- [1..length ms], ps <- pos (ms !! (i-1))]
pos (P m i)       = [] : [ 1 : ps | ps <- pos m]
pos (R ms)        = [] : [ i : ps | i <- [1..length ms], ps <- pos (snd (ms !! (i-1)))]
pos (F m s)       = [] : [ 1 : ps | ps <- pos m]
pos (Inj s m tau) = [] : [ 1 : ps | ps <- pos m]
pos (Case m ms)   = [] : [ 1 : ps | ps <- pos m] ++ [ 2 : i : ps | i <- [1..length ms], ps <- pos (snd (ms !! (i-1)))]
pos (TyL bnd)     = [] : [ 1 : ps | ps <- pos m]
    where
        (t, m) = unsafeUnbind bnd
pos (TyA m tau)   = [] : [ 1 : ps | ps <- pos m]
pos t             = [ [] ]

getExpr :: Expr -> [Int] -> [Int] -> [Expr]
getExpr (A t1 t2)     cPos target = targetPos cPos target (A t1 t2) (getExpr t1 (cPos ++ [1]) target ++ getExpr t2 (cPos ++ [2]) target)
getExpr (L bnd)       cPos target = targetPos cPos target (L bnd) (getExpr m (cPos ++ [1]) target)
    where
        ((x, Embed tau), m) = unsafeUnbind bnd
getExpr (T ms)        cPos target = targetPos cPos target (T ms) (concat [ getExpr (ms !! (i-1)) (cPos ++ [i]) target | i <- [1..length ms] ])
getExpr (P m i)       cPos target = targetPos cPos target (P m i) (getExpr m (cPos ++ [1]) target)
getExpr (R ms)        cPos target = targetPos cPos target (R ms) (concat [ getExpr (snd (ms !! (i-1))) (cPos ++ [i]) target | i <- [1..length ms] ])
getExpr (F m s)       cPos target = targetPos cPos target (F m s) (getExpr m (cPos ++ [1]) target)
getExpr (Inj s m tau) cPos target = targetPos cPos target (Inj s m tau) (getExpr m (cPos ++ [1]) target)
getExpr (Case m ms)   cPos target = targetPos cPos target (Case m ms) (getExpr m (cPos ++ [1]) target ++ concat [ getExpr (snd (ms !! (i-1))) (cPos ++ [2] ++ [i]) target | i <- [1..length ms] ])
getExpr (TyL bnd)     cPos target = targetPos cPos target (TyL bnd) (getExpr m (cPos ++ [1]) target)
    where
        (t, m) = unsafeUnbind bnd
getExpr (TyA m t)     cPos target = targetPos cPos target (TyA m t) (getExpr m (cPos ++ [1]) target)
getExpr m             cPos target = targetPos cPos target m []

targetPos cPos target t ts = if cPos == target then [t] else ts

getRedexPos :: Expr -> [Int] -> Pos
getRedexPos (A (L bnd) t2) cPos = cPos : getRedexPos (L bnd) (cPos ++ [1]) ++ getRedexPos t2 (cPos ++ [2])
getRedexPos (A t1 t2)     cPos = getRedexPos t1 (cPos ++ [1]) ++ getRedexPos t2 (cPos ++ [2])
getRedexPos (L bnd)   cPos = getRedexPos m (cPos ++ [1])
    where
        ((x, Embed tau), m) = unsafeUnbind bnd
getRedexPos (T ms)        cPos = concat [ getRedexPos (ms !! (i-1)) (cPos ++ [i]) | i <- [1..length ms] ]
getRedexPos (P (T ms) i)  cPos = cPos : getRedexPos (T ms) (cPos ++ [1])
getRedexPos (P m i)       cPos = getRedexPos m (cPos ++ [1])
getRedexPos (R ms)        cPos = concat [ getRedexPos (snd (ms !! (i-1))) (cPos ++ [i]) | i <- [1..length ms] ]
getRedexPos (F (R ms) s)  cPos = cPos : getRedexPos (R ms) (cPos ++ [1])
getRedexPos (F m s)       cPos = getRedexPos m (cPos ++ [1])
getRedexPos (Inj s m tau) cPos = getRedexPos m (cPos ++ [1])
getRedexPos (Case (Inj s m tau) ms) cPos = cPos : getRedexPos (Inj s m tau) (cPos ++ [1]) ++ concat [ getRedexPos (snd (ms !! (i-1))) (cPos ++ [2] ++ [i]) | i <- [1..length ms] ]
getRedexPos (Case m ms) cPos = getRedexPos m (cPos ++ [1]) ++ concat [ getRedexPos (snd (ms !! (i-1))) (cPos ++ [2] ++ [i]) | i <- [1..length ms] ]
getRedexPos (TyL bnd)   cPos = getRedexPos m (cPos ++ [1])
    where
        (t, m) = unsafeUnbind bnd
getRedexPos (TyA (TyL bnd) tau) cPos = cPos : getRedexPos (TyL bnd) (cPos ++ [1])
getRedexPos (TyA m tau) cPos = getRedexPos m (cPos ++ [1])
getRedexPos m cPos = []
