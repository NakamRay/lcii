module Typing where
import DataType

-- Typing
typing :: [Decl] -> Expr -> Type
typing ga U       = Unit
typing ga (C c tau) = tau
typing ga (V x)     = if elem x (dom ga) then lkup ga x 
                                         else Failure

typing ga (L x tau1 m1) = let tau2 = typing ((x,tau1):ga) m1
                            in tau1 :=> tau2

typing ga (A m1 m2) = let tau1 = typing ga m1
                          tau2 = typing ga m2
                            in if isArrowType tau1 && source tau1 == tau2
                               then target tau1 else Failure

typing ga (T ms)   = let taus = map (typing ga) ms
                        in Prod taus

typing ga (P m i) = let tau = typing ga m
                      in if isProdType tau 
                         then (prodTypes tau)!!(i-1)
                         else Failure

typing ga (Inj i m t) = let tau = typing ga m
                           in case t of
                              Variant ts -> if tau == ts !! (i-1)
                                            then Variant ts else Failure
                              t' -> Failure

typing ga (Case m ms) = let tau = typing ga m
                           in if isVariantType tau
                              then caseType ga ms (variantList tau) (target (typing ga (ms !! 0))) else Failure

-- Utility functions
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

isVariantType (Variant taus) = True
isVariantType tau            = False

variantList (Variant taus) = taus

caseType :: [Decl] -> [Expr] -> [Type] -> Type -> Type
caseType ga [] [] res   = res
caseType ga [] taus res = Failure
caseType ga ms [] res  = Failure
caseType ga (m:ms) (tau:taus) res = if source (typing ga m) == tau && target (typing ga m) == res
                                 then caseType ga ms taus res
                                 else Failure

ttest = typing [] $ Case (Inj 1 (C "i" INT) (Variant [INT, BOOL])) [L "x" INT (V "x"), L "x" BOOL (C "n" INT)]
