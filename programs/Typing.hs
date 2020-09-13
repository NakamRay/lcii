module Typing where
import DataType

-------------------------------------------------------------------------------
-- Typing
-------------------------------------------------------------------------------
typing :: [Decl] -> Expr -> Type
typing ga U         = Unit
typing ga (C c tau) = tau
typing ga (V x)     = if elem x (dom ga) then lkup ga x
                                         else Failure

typing ga (L x tau1 m) = let tau2 = typing ((x,tau1):ga) m
                            in tau1 :=> tau2

typing ga (A m1 m2) = let tau1 = typing ga m1
                          tau2 = typing ga m2
                            in if isArrowType tau1 && source tau1 == tau2
                               then target tau1 else Failure

typing ga (T ms) = let taus = map (typing ga) ms
                     in Prod taus

typing ga (P m i) = let tau = typing ga m
                      in if isProdType tau 
                         then (prodTypes tau)!!(i-1)
                         else Failure

typing ga (R ms) = let taus = map (\(s,m) -> (s, typing ga m)) ms
                     in Rec taus

typing ga (F m s) = let tau = typing ga m
                        in if isRecType tau
                           then caseTypeFind (recList tau) s else Failure 

typing ga (Inj s m t) = let tau = typing ga m
                           in case t of
                              Var taus -> if tau == caseTypeFind taus s
                                            then Var taus else Failure
                              t' -> Failure

typing ga (Case m ms) = let tau = typing ga m
                           in if isVarType tau
                              then caseType ga ms (varList tau) (target (typing ga (snd (ms !! 0)))) else Failure

typing ga (TyL t m) = if elem t (dom ga) then Failure
                                         else Poly t (typing ga m)

typing ga (TyA m sig2) = let tau = typing ga m
                           in case tau of
                              Poly t sig1 -> typing ga $ tySubst m t sig2 []
                              tau' -> Failure

tytest = typing [] $ TyA (TyL "t" (A (C "f" (BOOL :=> INT)) (C "c" (TyVar "t")))) BOOL

-------------------------------------------------------------------------------
-- For Polymorphic Type
-------------------------------------------------------------------------------
-- ここでのbvは型変数のbv(getFTVが初期値)
tySubst :: Expr -> String -> Type -> [String] -> Expr
tySubst (C x tau)     name tau' bv = C x (tyAssign tau name tau' bv)
tySubst (A m1 m2)     name tau' bv = A (tySubst m1 name tau' bv) (tySubst m2 name tau' bv)
tySubst (L x tau m)   name tau' bv = L x (tyAssign tau name tau' bv) (tySubst m name tau' bv)
tySubst (T ms)        name tau' bv = T $ map (\m -> tySubst m name tau' bv) ms
tySubst (P m i)       name tau' bv = P (tySubst m name tau' bv) i
tySubst (R rs)        name tau' bv = R $ map (\(l,m) -> (l,tySubst m name tau' bv)) rs
tySubst (F m l)       name tau' bv = F (tySubst m name tau' bv) l
tySubst (Inj l m tau) name tau' bv = Inj l (tySubst m name tau' bv) (tyAssign tau name tau' bv)
tySubst (Case m rs)   name tau' bv = Case (tySubst m name tau' bv) $ map (\(l,m) -> (l,tySubst m name tau' bv)) rs
tySubst (TyL t m)     name tau' bv = TyL t (tySubst m name tau' (t:bv))
tySubst (TyA m tau)   name tau' bv = TyA (tySubst m name tau' bv) (tyAssign tau name tau' bv)
tySubst m             name tau' bv = m

tyAssign :: Type -> String -> Type -> [String] -> Type
tyAssign (TyVar x)    name tau' bv = if x == name then tau' else TyVar x
tyAssign (Poly x tau) name tau' bv = if x /= name && notElem x (getFTV tau')
                                     then Poly x $ tyAssign tau name tau' (x:bv)
                                     else if x /= name && elem x (getFTV tau')
                                     then Poly new $ tyAssign (tyAssign tau x (TyVar new) bv) name tau' (new:bv)
                                     else Poly x tau
                                     where
                                        fresh = filter (\x -> notElem x (getFTV tau ++ getFTV tau')) bound
                                        new = (filter (\x -> notElem x bv) fresh) !! 0
tyAssign (tau1 :=> tau2) name tau' bv = (tyAssign tau1 name tau' bv) :=> (tyAssign tau2 name tau' bv)
tyAssign (Prod taus) name tau' bv = Prod (map (\x -> tyAssign x name tau' bv) taus)
tyAssign (Rec taus) name tau' bv = Rec (map (\(s,x) -> (s,tyAssign x name tau' bv)) taus)
tyAssign (Var taus) name tau' bv = Var (map (\(s,x) -> (s,tyAssign x name tau' bv)) taus)
tyAssign tau name tau' bv = tau

getFTV :: Type -> [Id]
getFTV (TyVar tau)     = [tau]
getFTV (tau1 :=> tau2) = getFTV tau1 ++ getFTV tau2
getFTV (Poly t s)      = filter (/= t) $ getFTV s
getFTV tau             = []

-------------------------------------------------------------------------------
-- Check Typing Error
-------------------------------------------------------------------------------
hasFailure :: Type -> Bool
hasFailure (tau1 :=> tau2) = hasFailure tau1 || hasFailure tau2
hasFailure (Prod taus)     = or $ map hasFailure taus
hasFailure (Rec taus)      = or $ map (\(s,t) -> hasFailure t) taus
hasFailure (Var taus)      = or $ map (\(s,t) -> hasFailure t) taus
hasFailure (Poly s tau)    = hasFailure tau
hasFailure Failure         = True
hasFailure _               = False

-------------------------------------------------------------------------------
-- Utility
-------------------------------------------------------------------------------
dom :: [Decl] -> [Id]
dom ga = map fst ga

lkup :: [Decl] -> Id -> Type
lkup []           x = Failure
lkup ((y,tau):ga) x = if y == x then tau else lkup ga x

isArrowType (tau1 :=> tau2) = True
isArrowType tau             = False

source (tau1 :=> tau2) = tau1

target (tau1 :=> tau2) = tau2

isProdType (Prod taus)      = True
isProdType tau              = False

prodTypes (Prod taus) = taus

isVarType (Var taus) = True
isVarType tau        = False

isRecType (Rec taus) = True
isRecType tau        = False

varList (Var taus) = taus

recList (Rec taus) = taus

caseType :: [Decl] -> [(String, Expr)] -> [(String, Type)] -> Type -> Type
caseType ga [] [] res   = res
caseType ga [] taus res = Failure
caseType ga ms [] res   = Failure
caseType ga ((s, m):ms) ((s',tau):taus) res = if source (typing ga m) == tau && target (typing ga m) == res
                                    then caseType ga ms taus res
                                    else Failure

caseTypeFind :: [(String, Type)] -> String -> Type
caseTypeFind ((s, t):[]) s' = if s == s' then t else Failure
caseTypeFind ((s, t):ss) s' = if s == s' then t else caseTypeFind ss s'