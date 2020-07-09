module Typing where
import DataType

-- Typing
typing :: [Decl] -> Expr -> Type
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

typing ga U       = Unit

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
