module Typing where
import DataType
import Unbound.LocallyNameless
import Unbound.LocallyNameless.Ops (unsafeUnbind)

-------------------------------------------------------------------------------
-- Typing
-------------------------------------------------------------------------------
typing :: [TyName] -> [Decl] -> Expr -> Type
typing xi ga m = let tau = typing' xi ga m
                   in if typeTyping xi tau then tau else Failure

-- TyL "T1" (TyL "T2" (TyL "T3" (L "n" (((TyVar "T1") :=> (TyVar "T2")) :=> ((TyVar "T3") :=> (TyVar "T1"))) (L "f" ((TyVar "T1") :=> (TyVar "T2")) (L "x" (TyVar "T3") (A (V "f") (A (A (V "n") (V "f")) (V "x"))))))))

typing' :: [TyName] -> [Decl] -> Expr -> Type
typing' xi ga U         = Unit
typing' xi ga (C c tau) = tau
typing' xi ga (V x)     = if elem x (dom ga) then lkup ga x
                                             else Failure

typing' xi ga (L bnd) = let ((x, Embed tau1), m) = unsafeUnbind bnd
                            tau2 = typing' xi ((x,tau1):ga) m
                        in  Arr tau1 tau2

typing' xi ga (A m1 m2) = let tau1 = typing' xi ga m1
                              tau2 = typing' xi ga m2
                            in if isArrowType tau1 && source tau1 `aeq` tau2
                               then target tau1 else Failure

typing' xi ga (T ms) = let taus = map (typing' xi ga) ms
                        in Prod taus

typing' xi ga (P m i) = let tau = typing' xi ga m
                         in if isProdType tau 
                         then (prodTypes tau)!!(i-1)
                         else Failure

typing' xi ga (R ms) = let taus = map (\(s,m) -> (s, typing' xi ga m)) ms
                        in Rec taus

typing' xi ga (F m s) = let tau = typing' xi ga m
                        in if isRecType tau
                           then caseTypeFind (recList tau) s else Failure 

typing' xi ga (Inj s m t) = let tau = typing' xi ga m
                            in case t of
                              Var taus -> if tau `aeq` caseTypeFind taus s
                                            then Var taus else Failure
                              t' -> Failure

typing' xi ga (Case m ms) = let tau = typing' xi ga m
                            in if isVarType tau
                               then caseType xi ga ms (varList tau) (target (typing' xi ga (snd (ms !! 0)))) else Failure

typing' xi ga (TyL bnd) = let (a, m) = unsafeUnbind bnd
                              tau = typing' (a:xi) ga m
                          in  Poly (bind a tau)

-- typing' xi ga (TyA m sig) = let tau = typing' xi ga m
--                              in if isPolyType tau && typeTyping xi sig
--                                 then tyAssign (polyTau tau) (polyTV tau) sig xi
--                                 else Failure

typing' xi ga (TyA m sig) = let tau = typing' xi ga m
                             in if typeTyping xi sig
                                then case tau of
                                  Poly bnd -> substBind bnd sig
                                  otherwise -> Failure
                                else Failure

substTest = substBind (bind (string2Name "A") (Arr (TyVar (string2Name "A")) (Prod [INT, BOOL, TyVar (string2Name "A")]))) INT
aeqTest = (Poly (bind (string2Name "A") (TyVar (string2Name "A")))) `aeq` (Poly (bind (string2Name "B") (TyVar (string2Name "B"))))

typTest = typing [a] [(y, TyVar a), (z, INT)] $ A (L (bind (x, Embed INT) (V y))) (V z)

typeTyping :: [TyName] -> Type -> Bool
typeTyping xi (Arr tau1 tau2) = (typeTyping xi tau1) && (typeTyping xi tau2)
typeTyping xi (Prod taus)     = and $ map (typeTyping xi) taus
typeTyping xi (Rec taus)      = and $ map (\x -> typeTyping xi (snd x)) taus
typeTyping xi (Var taus)      = and $ map (\x -> typeTyping xi (snd x)) taus
typeTyping xi (TyVar a)       = elem a xi
typeTyping xi (Poly bnd)    = typeTyping (a:xi) tau
    where
        (a, tau) = unsafeUnbind bnd
typeTyping xi tau             = True

-------------------------------------------------------------------------------
-- For Polymorphic Type
-------------------------------------------------------------------------------
-- ここでのbvは型変数のbv(getFTVが初期値)
-- tySubst :: Expr -> TyName -> Type -> [TyName] -> Expr
-- tySubst (C x tau)     name tau' bv = C x (tyAssign tau name tau' bv)
-- tySubst (A m1 m2)     name tau' bv = A (tySubst m1 name tau' bv) (tySubst m2 name tau' bv)
-- tySubst (L bnd)       name tau' bv = L $ bind (x, Embed (tyAssign tau name tau' bv)) (tySubst m name tau' bv)
--     where
--         ((x, Embed tau), m) = unsafeUnbind bnd
-- tySubst (T ms)        name tau' bv = T $ map (\m -> tySubst m name tau' bv) ms
-- tySubst (P m i)       name tau' bv = P (tySubst m name tau' bv) i
-- tySubst (R rs)        name tau' bv = R $ map (\(l,m) -> (l,tySubst m name tau' bv)) rs
-- tySubst (F m l)       name tau' bv = F (tySubst m name tau' bv) l
-- tySubst (Inj l m tau) name tau' bv = Inj l (tySubst m name tau' bv) (tyAssign tau name tau' bv)
-- tySubst (Case m rs)   name tau' bv = Case (tySubst m name tau' bv) $ map (\(l,m) -> (l,tySubst m name tau' bv)) rs
-- tySubst (TyL bnd)     name tau' bv = TyL $ bind x (tySubst m name tau' (x:bv))
--     where
--         (x, m) = unsafeUnbind bnd
-- tySubst (TyA m tau)   name tau' bv = TyA (tySubst m name tau' bv) (tyAssign tau name tau' bv)
-- tySubst m             name tau' bv = m

-- tyAssign :: Type -> TyName -> Type -> [TyName] -> Type
-- tyAssign (TyVar x)    name tau' bv = if x == name then tau' else TyVar x
-- tyAssign (Poly x tau) name tau' bv = if x /= name && notElem x (getFTV tau')
--                                      then Poly x $ tyAssign tau name tau' (x:bv)
--                                      else if x /= name && elem x (getFTV tau')
--                                      then Poly new $ tyAssign (tyAssign tau x (TyVar new) bv) name tau' (new:bv)
--                                      else Poly x tau
--                                      where
--                                         fresh = filter (\x -> notElem x (getFTV tau ++ getFTV tau')) tyBound
--                                         new = (filter (\x -> notElem x bv) fresh) !! 0
-- tyAssign (Arr tau1 tau2) name tau' bv = Arr (tyAssign tau1 name tau' bv) (tyAssign tau2 name tau' bv)
-- tyAssign (Prod taus) name tau' bv = Prod (map (\x -> tyAssign x name tau' bv) taus)
-- tyAssign (Rec taus) name tau' bv = Rec (map (\(s,x) -> (s,tyAssign x name tau' bv)) taus)
-- tyAssign (Var taus) name tau' bv = Var (map (\(s,x) -> (s,tyAssign x name tau' bv)) taus)
-- tyAssign tau name tau' bv = tau

-- getFTV :: Type -> [TyName]
-- getFTV (TyVar tau)     = [tau]
-- getFTV (Arr tau1 tau2) = getFTV tau1 ++ getFTV tau2
-- getFTV (Poly t s)      = filter (/= t) $ getFTV s
-- getFTV tau             = []

-------------------------------------------------------------------------------
-- Check Typing Error
-------------------------------------------------------------------------------
-- hasFailure :: Type -> Bool
-- hasFailure (Arr tau1 tau2) = hasFailure tau1 || hasFailure tau2
-- hasFailure (Prod taus)     = or $ map hasFailure taus
-- hasFailure (Rec taus)      = or $ map (\(s,t) -> hasFailure t) taus
-- hasFailure (Var taus)      = or $ map (\(s,t) -> hasFailure t) taus
-- hasFailure (Poly s tau)    = hasFailure tau
-- hasFailure Failure         = True
-- hasFailure _               = False

-------------------------------------------------------------------------------
-- Utility
-------------------------------------------------------------------------------
dom :: [Decl] -> [TmName]
dom ga = map fst ga

lkup :: [Decl] -> TmName -> Type
lkup []           x = Failure
lkup ((y,tau):ga) x = if y == x then tau else lkup ga x

isArrowType (Arr tau1 tau2) = True
isArrowType tau             = False

source (Arr tau1 tau2) = tau1

target (Arr tau1 tau2) = tau2

isProdType (Prod taus)      = True
isProdType tau              = False

prodTypes (Prod taus) = taus

isVarType (Var taus) = True
isVarType tau        = False

isRecType (Rec taus) = True
isRecType tau        = False

varList (Var taus) = taus

recList (Rec taus) = taus

isPolyType (Poly bnd) = True
isPolyType tau          = False

-- polyTV (Poly a tau) = a
-- polyTau (Poly a tau) = tau

caseType :: [TyName] -> [Decl] -> [(String, Expr)] -> [(String, Type)] -> Type -> Type
caseType xi ga [] [] res   = res
caseType xi ga [] taus res = Failure
caseType xi ga ms [] res   = Failure
caseType xi ga ((s, m):ms) ((s',tau):taus) res = if source (typing' xi ga m) `aeq` tau && target (typing' xi ga m) `aeq` res
                                    then caseType xi ga ms taus res
                                    else Failure

caseTypeFind :: [(String, Type)] -> String -> Type
caseTypeFind ((s, t):[]) s' = if s == s' then t else Failure
caseTypeFind ((s, t):ss) s' = if s == s' then t else caseTypeFind ss s'