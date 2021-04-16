import Data.List
import Counter

type Id = String
type Decl = (Id,Type)
type Infer = ([Decl],Type)

data Type = TyVar Id
          | INT | CHAR | BOOL
          | Type :-> Type
          | Failure
          deriving (Eq, Show)

data Expr = TmVar Id
          | Cons Id Type
          | Abs Id Expr
          | App Expr Expr
          deriving (Eq, Show)

xxNewO x = x ++ show (xxCountUp ())

pts :: Expr -> Infer
pts (Cons id tau) = ([], tau)
pts (TmVar x) = let fresh = TyVar (xxNewO "x")
                in  ([(x, fresh)], fresh)
pts (Abs x e) = let (ga, rho) = pts e
                in  if elem x (dom ga)
                    then (filter (\ga -> fst ga /= x) ga, lkup ga x :-> rho)
                    else (ga, TyVar (xxNewO "x") :-> rho)
pts (App e1 e2) = let (ga1, rho1) = pts e1
                      (ga2, rho2) = pts e2
                      fresh = TyVar (xxNewO "x")
                      s = u (matches ga1 ga2 `union` [(rho1, rho2 :-> fresh)])
                  in  (substA s ga1 `union` substA s ga2, substA' s fresh)

substTest = substA' [(TyVar "x", INT :-> BOOL)] ((TyVar "x") :-> (TyVar "y"))
substATest = substA [(TyVar "x", INT :-> BOOL)] [("a",((TyVar "x") :-> (TyVar "y")))]

substA :: [(Type,Type)] -> [Decl] -> [Decl]
substA s ga = map (\(a,tau) -> (a,substA' s tau)) ga

substA' :: [(Type,Type)] -> Type -> Type
substA' [] tau = tau
substA' ((tau1,tau2):ss) tau = substA' ss (subst' tau tau1 tau2)

dom :: [Decl] -> [Id]
dom ga = map fst ga

lkup :: [Decl] -> Id -> Type
lkup []           x = Failure
lkup ((y,tau):ga) x = if y == x then tau else lkup ga x

matchesTest = matches [("x",INT),("y",BOOL)] [("x",CHAR),("z",BOOL)]

matches :: [Decl] -> [Decl] -> [(Type,Type)]
matches ga1 ga2 = [(lkup ga1 x, lkup ga2 x) | x <- intersect (dom ga1) (dom ga2)]

u :: [(Type,Type)] -> [(Type,Type)]
u e = case unify (e,[]) of
        ([],s)    -> s
        otherwise -> []

-- unify :: ([(Type,Type)],[(Type,Type)]) -> ([(Type,Type)],[(Type,Type)])
-- unify ([],s) = ([],s)
-- unify ((tau1,tau2):es,s)
--     | tau1 == tau2 = unify (es,s)
--     | isArrowType tau1 && isArrowType tau2 = unify ((source tau1,source tau2):(target tau1,target tau2):es,s)
--     | otherwise = unify (subst es tau1 tau2, (tau1,tau2):(subst s tau1 tau2))

unify :: ([(Type,Type)],[(Type,Type)]) -> ([(Type,Type)],[(Type,Type)])
unify ([],s) = ([],s)
unify ((tau1,tau2):es,s)
    | isTyVar tau1 = unify (subst es tau1 tau2, (tau1,tau2):(subst s tau1 tau2))
    | isArrowType tau1 && isArrowType tau2 = unify ((source tau1,source tau2):(target tau1,target tau2):es,s)
    | otherwise = unify (es,s)

subst e tau1 tau2 = map (\(a,b) -> (subst' a tau1 tau2, subst' b tau1 tau2)) e

subst' :: Type -> Type -> Type -> Type
subst' (TyVar x) tau1 tau2 = if (TyVar x) == tau1 then tau2 else (TyVar x)
subst' (t1 :-> t2) tau1 tau2 = subst' t1 tau1 tau2 :-> subst' t2 tau1 tau2
subst' tau tau1 tau2 = tau

isArrowType (tau1 :-> tau2) = True
isArrowType tau             = False

isTyVar (TyVar x) = True
isTyVar tau       = False

source (tau1 :-> tau2) = tau1

target (tau1 :-> tau2) = tau2

test1 = pts $ Abs "x" (Abs "y" (TmVar "x"))

ex172 = u [(TyVar "a", TyVar "af" :-> TyVar "ax" :-> TyVar "a1"),(TyVar "af", TyVar "ax" :-> TyVar "a2"),(TyVar "af", TyVar "a2" :-> TyVar "a1")]
ex175 = pts $ Abs "f" (Abs "x" (App (TmVar "f") (App (TmVar "f") (TmVar "x"))))
