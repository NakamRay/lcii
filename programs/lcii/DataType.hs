module DataType where

type Id = String
type Decl = (Id,Type)
type Pos = [[Int]]

data Type = Unit
          | INT | BOOL
          | Type :=> Type
          | Prod [Type]
          | Rec [(String, Type)]
          | Var [(String, Type)]
          | TyVar String
          | Poly String Type
          | Failure
          | Pair (Type, Type)
          | Sum (Type, Type)
          | Zero
          | Thunk Comp
          deriving (Eq)

data Effect = Op Type Type Effect
            | Empty

data Comp = F Type
          | Type :-> Comp
          | Top
          | Comp :& Comp

data Handler = Handler Type Effect Effect Comp

data Expr = U -- Unit
          | C Id Type -- Const
          | V Id -- Variable
          | A Expr Expr -- Application
          | L Id Type Expr -- Abstraction
          | T [Expr] -- Tuple
          | P Expr Int -- Projection
          | R [(String, Expr)] -- Record
          | F Expr String      -- Field
          | Inj String Expr Type -- Injection for Case
          | Case Expr [(String, Expr)]
          | TyL String Expr -- Type Abstraction
          | TyA Expr Type -- Type Application
          | N Int -- numbers to lambda term
          | Pa (Expr, Expr)
          | In Int Expr
          | Th TermComp
            deriving (Eq)

data TermComp = Split Expr String String TermComp
              | CaseZero Expr
              | Ca Expr String TermComp String TermComp
              | Sus Expr -- V!
              | Return Expr
              | Let String TermComp TermComp
              | Abs String
              | TermComp :@ Expr
              | Prj Int TermComp
              | TermOp Expr String TermComp
              | Handle TermComp TermHandler

data TermHandler = Ret String TermComp
                 | HandlerOp TermHandler TermComp 

instance Show Type where
    show = showType

instance Show Expr where
    show = showExpr

-- Names of bound variables
bound = ["x","y","z","u","v","w"] ++ map (:[]) ['a'..'t']
tyBound = map (:[]) ['A'..'Z']

showType :: Type -> String
showType Unit        = "Unit"
showType INT         = "INT"
showType BOOL        = "BOOL"
showType (t1 :=> t2) = typeL ++ "->" ++ typeR
    where
        isArrowType (tau1 :=> tau2) = True
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
showType (TyVar t) = t
showType (Poly t tau) = "∀ " ++ t ++ "." ++ showType tau
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
                    TyL t m -> "(" ++ showExpr (TyL t m) ++ ")"
                    m         -> showExpr m
        exprR = case m2 of
                    A m1 m2   -> "(" ++ showExpr (A m1 m2) ++ ")"
                    L x tau m -> "(" ++ showExpr (L x tau m) ++ ")"
                    TyL t m -> "(" ++ showExpr (TyL t m) ++ ")"
                    m         -> showExpr m
showExpr (L x tau m) = "λ" ++ x ++ ":" ++ show tau ++ "." ++ showExpr m
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
showExpr (TyL t m) = "Λ" ++ t ++ "." ++ showExpr m
showExpr (TyA m tau) = exprL ++ " " ++ exprR
    where
        exprL = case m of
                    A m1 m2   -> "(" ++ showExpr (A m1 m2) ++ ")"
                    L x tau m -> "(" ++ showExpr (L x tau m) ++ ")"
                    TyL t m   -> "(" ++ showExpr (TyL t m) ++ ")"
                    m         -> showExpr m
        exprR = case tau of
                    t1 :=> t2  -> "(" ++ showType (t1 :=> t2) ++ ")"
                    Poly t tau -> "(" ++ showType (Poly t tau) ++ ")"
                    tau        -> showType tau

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
showTerm (T ms)      = "{" ++ showExprs (map (\x -> showTerm x) ms) ++ "}"
    where
        showExprs []     = " **Error: The term's list in this Tuple is empty.** "
        showExprs (s:[]) = s
        showExprs (s:ss) = s ++ ", " ++ showExprs ss
showTerm (P m i)     = showTerm m ++ "." ++ show i
