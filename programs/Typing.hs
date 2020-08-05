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

typing ga (L x tau1 m1) = let tau2 = typing ((x,tau1):ga) m1
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

-------------------------------------------------------------------------------
-- Check Typing Error
-------------------------------------------------------------------------------
hasFailure :: Type -> Bool
hasFailure (tau1 :=> tau2) = hasFailure tau1 || hasFailure tau2
hasFailure (Prod taus)     = or $ map hasFailure taus
hasFailure (Variant taus)  = or $ map hasFailure taus
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