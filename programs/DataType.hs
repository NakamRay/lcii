module DataType where

type Id = String
type Decl = (Id,Type)
type Pos = [[Int]]

data Type = Unit
          | INT | BOOL
          | Type :=> Type
          | Prod [Type]
          | Variant [Type]
          | Failure
          deriving (Eq)

data Expr = U
          | C Id Type
          | V Id
          | A Expr Expr
          | L Id Type Expr
          | T [Expr]
          | Inj Int Expr Type -- allow Variant Type only
          | Case Expr [Expr]
          | P Expr Int
            deriving (Eq)

instance Show Type where
    show = showType

instance Show Expr where
    show = showExpr

-- Names of bound variables
bound = ["x","y","z","u","v","w"] ++ map (:[]) ['a'..'t']

showType :: Type -> String
showType Unit        = "Unit"
showType INT         = "INT"
showType BOOL        = "BOOL"
showType (t1 :=> t2) = show t1 ++ "->" ++ show t2
showType (Prod ts)   = "(" ++ showTypes ts ++ ")"
    where
        showTypes []     = " **Error: The Prod type is empty.**"
        showTypes (t:[]) = showType t
        showTypes (t:ts) = showType t ++ ", " ++ showTypes ts
showType (Variant ts) = "(" ++ showTypes ts ++ ")"
    where
        showTypes []     = " **Error: The Variant type is empty.**"
        showTypes (t:[]) = showType t
        showTypes (t:ts) = showType t ++ " + " ++ showTypes ts
showType Failure = "Failure"

showGa :: [Decl] -> IO ()
showGa []     = putStrLn ""
showGa (g:[]) = putStrLn $ fst g ++ ":" ++ show (snd g)
showGa (g:gs) = do 
    putStr $ fst g ++ ":" ++ show (snd g) ++ ", "
    showGa gs

showExpr :: Expr -> String
showExpr U           = "()"
showExpr (C x tau)   = x ++ ":" ++ show tau
showExpr (V x)       = x
showExpr (A m1 m2)   = exprL ++ " " ++ exprR
    where
        exprL = case m1 of
                    L x tau m -> "(" ++ showExpr (L x tau m) ++ ")"
                    m         -> showExpr m
        exprR = case m2 of
                    A m1 m2   -> "(" ++ showExpr (A m1 m2) ++ ")"
                    L x tau m -> "(" ++ showExpr (L x tau m) ++ ")"
                    m         -> showExpr m
showExpr (L x tau m) = "λ" ++ x ++ ":" ++ show tau ++ "." ++ showExpr m
showExpr (T ms)      = "(" ++ showExprs (map (\x -> showExpr x) ms) ++ ")"
    where
        showExprs []     = " **Error: The list in the Tuple is empty.** "
        showExprs (s:[]) = s
        showExprs (s:ss) = s ++ ", " ++ showExprs ss
showExpr (P m i)     = showExpr m ++ "." ++ show i
showExpr (Inj i m (Variant taus)) = "(<" ++ show i ++ " = " ++ showExpr m ++ ">:" ++ show (Variant taus) ++ ")"
showExpr (Inj i m tau) = " **Error: The type in Inj is not a Variant Type.**"
showExpr (Case m ms)    = "case " ++ showExpr m ++ " of " ++  showExprs (map (\x -> showExpr x) ms)
    where
        showExprs []     = " **Error: The list in the Tuple is empty.** "
        showExprs (s:[]) = s
        showExprs (s:ss) = s ++ ", " ++ showExprs ss

injCasetest = putStrLn $ showExpr $ Case (Inj 1 (C "c" INT) (Variant [INT,BOOL])) [L "x" INT (V "x"), L "x" BOOL (C "n" INT)]

showTerm :: Expr -> String
showTerm U           = "()"
showTerm (C x tau)   = x
showTerm (V x)       = x
showTerm (A m1 m2)   = exprL ++ " " ++ exprR
    where
        exprL = case m1 of
                    L x tau m -> "(" ++ showTerm (L x tau m) ++ ")"
                    m         -> showTerm m
        exprR = case m2 of
                    A m1 m2   -> "(" ++ showTerm (A m1 m2) ++ ")"
                    L x tau m -> "(" ++ showTerm (L x tau m) ++ ")"
                    m         -> showTerm m
showTerm (L x tau m) = "λ" ++ x ++ "." ++ showTerm m
showTerm (T ms)      = "(" ++ showExprs (map (\x -> showTerm x) ms) ++ ")"
    where
        showExprs []     = " **Error: The term's list in this Tuple is empty.** "
        showExprs (s:[]) = s
        showExprs (s:ss) = s ++ ", " ++ showExprs ss
showTerm (P m i)     = showTerm m ++ "." ++ show i
