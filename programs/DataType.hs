module DataType where

type Id = String
type Decl = (Id,Type)
type Pos = [[Int]]

data Type = INT | BOOL
          | Type :=> Type
          | Prod [Type]
          | Failure
          deriving (Eq)

data Expr = C Id Type
          | V Id
          | A Expr Expr
          | L Id Type Expr
          | T [Expr]
          | P Expr Int
            deriving (Eq)

instance Show Type where
    show = showType

instance Show Expr where
    show = showExpr

showType :: Type -> String
showType INT         = "INT"
showType BOOL        = "BOOL"
showType (t1 :=> t2) = show t1 ++ "->" ++ show t2
showType (Prod ts)   = "(" ++ showTypes ts ++ ")"
    where
        showTypes []     = " **Error: The Prod type is empty.**"
        showTypes (t:[]) = showType t
        showTypes (t:ts) = showType t ++ ", " ++ showTypes ts

showGa :: [Decl] -> IO ()
showGa []     = putStrLn ""
showGa (g:[]) = putStrLn $ fst g ++ ":" ++ show (snd g)
showGa (g:gs) = do 
    putStr $ fst g ++ ":" ++ show (snd g) ++ ", "
    showGa gs

showExpr :: Expr -> String
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
        showExprs []     = " **Error: The term's list in this Tuple is empty.** "
        showExprs (s:[]) = s
        showExprs (s:ss) = s ++ ", " ++ showExprs ss
showExpr (P m i)     = showExpr m ++ "." ++ show i

showTerm :: Expr -> String
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
