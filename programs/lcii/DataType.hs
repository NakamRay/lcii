{-# LANGUAGE MultiParamTypeClasses
           , TemplateHaskell
           , ScopedTypeVariables
           , FlexibleInstances
           , FlexibleContexts
           , UndecidableInstances
#-}

module DataType where

import Unbound.LocallyNameless
import Unbound.LocallyNameless.Ops (unsafeUnbind)
import Data.List

type Id = String

type TyName = Name Type
type TmName = Name Expr

type Decl = (TmName,Type)
type Pos = [[Int]]

data Type = Unit
          | INT | BOOL
          | Arr Type Type
          | Prod [Type]
          | Rec [(String, Type)]
          | Var [(String, Type)]
          | TyVar TyName
          | Poly (Bind TyName Type)
          | Failure
  deriving Show

data Expr = U -- Unit
          | C TmName Type -- Const
          | V TmName -- Variable
          | A Expr Expr -- Application
          | L (Bind (TmName, Embed Type) Expr) -- Abstraction
          | T [Expr] -- Tuple
          | P Expr Int -- Projection
          | R [(String, Expr)] -- Record
          | F Expr String      -- Field
          | Inj String Expr Type -- allow Variant Type only
          | Case Expr [(String, Expr)]
          | TyL (Bind TyName Expr) -- Type Abstraction
          | TyA Expr Type -- Type Application
          | N Int -- numbers to lambda term
  deriving Show

$(derive [''Type, ''Expr])

instance Alpha Type
instance Alpha Expr

instance Subst Expr Type where
instance Subst Type Expr where
instance Subst Expr Expr where
    isvar (V x) = Just (SubstName x)
    isvar _  = Nothing
instance Subst Type Type where
    isvar (TyVar x) = Just (SubstName x)
    isvar _ = Nothing

-- instance Show Type where
--     show = showType

-- instance Show Expr where
--     show = showExpr

-- Names of bound variables
bound = ["x","y","z","u","v","w"] ++ map (:[]) ['a'..'t']
tyBound = map (:[]) ['A'..'Z']

x :: TmName
y :: TmName
z :: TmName
(x,y,z) = (string2Name "x", string2Name "y", string2Name "z")

a :: TyName
b :: TyName
c :: TyName
(a,b,c) = (string2Name "a", string2Name "b", string2Name "c")

showType :: Type -> String
showType Unit        = "Unit"
showType INT         = "INT"
showType BOOL        = "BOOL"
showType (Arr t1 t2) = typeL ++ "->" ++ typeR
    where
        isArrowType (Arr tau1 tau2) = True
        isArrowType tau             = False
        typeL = if isArrowType t1
                then "(" ++ show t1 ++ ")"
                else show t1
        typeR = if isArrowType t1 && isArrowType t2
                then "(" ++ show t2 ++ ")"
                else show t2
showType (Prod ts)   = "{" ++ showTypes ts ++ "}"
    where
        showTypes []     = " **Error: The Prod type is empty.**"
        showTypes (t:[]) = showType t
        showTypes (t:ts) = showType t ++ ", " ++ showTypes ts
showType (Rec ts) = "{" ++ showTypes ts ++ "}"
    where
        showTypes []     = " **Error: The Rec type is empty.**"
        showTypes ((s, t):[]) = s ++ ":" ++ showType t
        showTypes ((s, t):ts) = s ++ ":" ++ showType t ++ ", " ++ showTypes ts
showType (Var ts) = "<" ++ showTypes ts ++ ">"
    where
        showTypes []     = " **Error: The Var type is empty.**"
        showTypes ((s, t):[]) = s ++ ":" ++ showType t
        showTypes ((s, t):ts) = s ++ ":" ++ showType t ++ ", " ++ showTypes ts
showType (TyVar t) = name2String t
showType (Poly bnd) = "∀ " ++ (name2String t) ++ "." ++ showType tau
    where
        (t, tau) = unsafeUnbind bnd
showType Failure = "Failure"

showGa :: [Decl] -> IO ()
showGa []     = putStrLn ""
showGa (g:[]) = putStrLn $ name2String (fst g) ++ ":" ++ show (snd g)
showGa (g:gs) = do 
    putStr $ name2String (fst g) ++ ":" ++ show (snd g) ++ ", "
    showGa gs

showExpr :: Expr -> String
showExpr U           = "()"
showExpr (C x tau)   = name2String x ++ ":" ++ show tau
showExpr (V x)       = name2String x
showExpr (A m1 m2)   = exprL ++ " " ++ exprR
    where
        exprL = case m1 of
                    L bnd -> "(" ++ showExpr (L bnd) ++ ")"
                    TyL bnd -> "(" ++ showExpr (TyL bnd) ++ ")"
                    m         -> showExpr m
        exprR = case m2 of
                    A m1 m2   -> "(" ++ showExpr (A m1 m2) ++ ")"
                    L bnd -> "(" ++ showExpr (L bnd) ++ ")"
                    TyL bnd -> "(" ++ showExpr (TyL bnd) ++ ")"
                    m         -> showExpr m
showExpr (L bnd) = "λ" ++ name2String x ++ ":" ++ show tau ++ "." ++ showExpr m
    where
        ((x, Embed tau), m) = unsafeUnbind bnd
showExpr (T ms)      = "{" ++ showExprs (map (\x -> showExpr x) ms) ++ "}"
    where
        showExprs []     = " **Error: The list in the Tuple is empty.** "
        showExprs (s:[]) = s
        showExprs (s:ss) = s ++ ", " ++ showExprs ss
showExpr (P m i)     = showExpr m ++ "." ++ show i
showExpr (R ms)      = "{" ++ showExprs (map (\(s,m') -> (s,showExpr m')) ms) ++ "}"
    where
        showExprs []     = " **Error: The list in the Rec is empty.** "
        showExprs ((s, m):[]) = s ++ " = " ++ m
        showExprs ((s, m):ss) = s ++ " = " ++ m ++ ", " ++ showExprs ss
showExpr (F m s)     = showExpr m ++ "." ++ s
showExpr (Inj s m (Var taus)) = "(<" ++ s ++ " = " ++ showExpr m ++ ">:" ++ show (Var taus) ++ ")"
showExpr (Inj s m tau) = " **Error: The type in Inj is not a Var Type.**"
showExpr (Case m ms)    = "case " ++ showExpr m ++ " of " ++ showExprs (map (\(s,m') -> (s,showExpr m')) ms)
    where
        showExprs []     = " **Error: The list in the Case is empty.** "
        showExprs ((s, m):[]) = s ++ " => " ++ m
        showExprs ((s, m):ss) = s ++ " => " ++ m ++ ", " ++ showExprs ss
showExpr (TyL bnd) = "Λ" ++ name2String x ++ "." ++ showExpr m
    where
        (x, m) = unsafeUnbind bnd
showExpr (TyA m tau) = exprL ++ " " ++ exprR
    where
        exprL = case m of
                    A m1 m2   -> "(" ++ showExpr (A m1 m2) ++ ")"
                    L bnd -> "(" ++ showExpr (L bnd) ++ ")"
                    TyL bnd   -> "(" ++ showExpr (TyL bnd) ++ ")"
                    m         -> showExpr m
        exprR = case tau of
                    Arr t1 t2 -> "(" ++ showType (Arr t1 t2) ++ ")"
                    Poly bnd  -> "(" ++ showType (Poly bnd) ++ ")"
                    tau       -> showType tau

-- showTerm :: Expr -> String
-- showTerm U           = "()"
-- showTerm (V x)       = x
-- showTerm (A m1 m2)   = exprL ++ " " ++ exprR
--     where
--         exprL = case m1 of
--                     L x tau m -> "(" ++ showTerm (L x tau m) ++ ")"
--                     m         -> showTerm m
--         exprR = case m2 of
--                     A m1 m2   -> "(" ++ showTerm (A m1 m2) ++ ")"
--                     L x tau m -> "(" ++ showTerm (L x tau m) ++ ")"
--                     m         -> showTerm m
-- showTerm (L x tau m) = "λ" ++ x ++ "." ++ showTerm m
-- showTerm (T ms)      = "{" ++ showTerms (map (\x -> showTerm x) ms) ++ "}"
--     where
--         showTerms []     = " **Error: The list in the Tuple is empty.** "
--         showTerms (s:[]) = s
--         showTerms (s:ss) = s ++ ", " ++ showTerms ss
-- showTerm (P m i)     = showTerm m ++ "." ++ show i
-- showTerm (R ms)      = "{" ++ showTerms (map (\(s,m') -> (s,showTerm m')) ms) ++ "}"
--     where
--         showTerms []     = " **Error: The list in the Rec is empty.** "
--         showTerms ((s, m):[]) = s ++ " = " ++ m
--         showTerms ((s, m):ss) = s ++ " = " ++ m ++ ", " ++ showTerms ss
-- showTerm (F m s)     = showTerm m ++ "." ++ s
-- showTerm (Inj s m tau) = "(<" ++ s ++ " = " ++ showTerm m ++ ">" ++ ")"
-- showTerm (Case m ms)    = "case " ++ showTerm m ++ " of " ++ showTerms (map (\(s,m') -> (s,showTerm m')) ms)
--     where
--         showTerms []     = " **Error: The list in the Case is empty.** "
--         showTerms ((s, m):[]) = s ++ " => " ++ m
--         showTerms ((s, m):ss) = s ++ " => " ++ m ++ ", " ++ showTerms ss
-- showTerm (N i) = show i
