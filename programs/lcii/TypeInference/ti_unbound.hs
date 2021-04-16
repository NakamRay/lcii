{-# LANGUAGE MultiParamTypeClasses
           , TemplateHaskell
           , ScopedTypeVariables
           , FlexibleInstances
           , FlexibleContexts
           , UndecidableInstances
#-}

module TypeInference where

import Unbound.LocallyNameless
import Data.List

-- Identifier
type ID = String

type TyName = Name Type
type TmName = Name Term

data Type = TyVar TyName
          | INT | CHAR | BOOL
          | Arr Type Type
          | Failure
          deriving (Eq, Show)

data Term = TmVar TmName
          | Cons TmName Type
          | Abs (Bind TmName Term)
          | App Term Term
          deriving Show

-- Unbound
$(derive [''Type, ''Term])

instance Alpha Type
instance Alpha Term

instance Subst Term Type where
instance Subst Term Term where
  isvar (TmVar x) = Just (SubstName x)
  isvar _  = Nothing
instance Subst Type Type where
  isvar (TyVar x) = Just (SubstName x)
  isvar _ = Nothing

type Decl = (TmName,Type)
type Infer = ([Decl],Type)

fresh = TyVar $ string2Name "Fresh"

x :: Name Term
y :: Name Term
z :: Name Term
(x,y,z) = (string2Name "x", string2Name "y", string2Name "z")

a :: Name Type
b :: Name Type
c :: Name Type
(a,b,c) = (string2Name "a", string2Name "b", string2Name "c")

-- pts :: Term -> Infer
-- pts (Cons id tau) = ([], tau)
-- pts (TmVar x) = ([(x, TypeInference.fresh)], TypeInference.fresh)
-- pts (Abs bnd) = let (x, e) = unbind bnd
--                     (ga, rho) = pts (snd e)
--                 in  if elem x (dom ga)
--                     then (filter (\ga -> fst ga /= x) ga, Arr (lkup ga x) rho)
--                     else (ga, Arr TypeInference.fresh rho)
-- pts (App e1 e2) = let (ga1, rho1) = pts e1
--                       (ga2, rho2) = pts e2
--                       s = u (matches ga1 ga2 `Data.List.union` [(rho1, Arr rho2 TypeInference.fresh)])
--                   in  (substA s ga1 `Data.List.union` substA s ga2, TypeInference.fresh)

substA :: [(Type,Type)] -> [Decl] -> [Decl]
substA s ga = map (\(a,tau) -> (a,substA' s tau)) ga

substA' :: [(Type,Type)] -> Type -> Type
substA' [] tau = tau
substA' ((tau1,tau2):ss) tau = substA' ss (subst' tau tau1 tau2)

dom :: [Decl] -> [TmName]
dom ga = map fst ga

lkup :: [Decl] -> TmName -> Type
lkup []           x = Failure
lkup ((y,tau):ga) x = if y == x then tau else lkup ga x

matches :: [Decl] -> [Decl] -> [(Type,Type)]
matches ga1 ga2 = [(lkup ga1 x, lkup ga2 x) | x <- intersect (dom ga1) (dom ga2)]

u :: [(Type,Type)] -> [(Type,Type)]
u e = case unify (e,[]) of
        ([],s)    -> s
        otherwise -> []

unify :: ([(Type,Type)],[(Type,Type)]) -> ([(Type,Type)],[(Type,Type)])
unify ([],s) = ([],s)
unify ((tau1,tau2):es,s)
    | tau1 == tau2 = unify (es,s)
    | isArrowType tau1 && isArrowType tau2 = unify ((source tau1,source tau2):(target tau1,target tau2):es,s)
    | otherwise = (TypeInference.subst es tau1 tau2, (tau1,tau2):(TypeInference.subst s tau1 tau2))

subst e tau1 tau2 = map (\(a,b) -> (subst' a tau1 tau2, subst' b tau1 tau2)) e

subst' :: Type -> Type -> Type -> Type
subst' (TyVar x) tau1 tau2 = if (TyVar x) == tau1 then tau2 else (TyVar x)
subst' (Arr t1 t2) tau1 tau2 = Arr (subst' t1 tau1 tau2) (subst' t2 tau1 tau2)
subst' tau tau1 tau2 = tau

isArrowType (Arr tau1 tau2) = True
isArrowType tau             = False

source (Arr tau1 tau2) = tau1

target (Arr tau1 tau2) = tau2

-- test = pts $ Abs (bind x (Abs (bind y (TmVar y))))
