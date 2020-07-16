module LCII where

import Data.List
import Data.Char

import Eval
import Typing
import DataType
import Coloring
import Parser

-------------------------------------------------------------------------------
-- Lambda Calculus Interactive Intepreter
-------------------------------------------------------------------------------
lcii :: IO ()
lcii = do
    putStrLn ""
    putStrLn "*****************************************************"
    putStrLn "    LCII: Lambda Calculus Interactive Interpreter    "
    putStrLn "*****************************************************"
    putStrLn ""
    putStrLn ":typed   :t   Use typed lambda calculus"
    putStrLn ":untyped :u   Use untyped lambda calculus"
    putStrLn ":quit    :q   Quit LCII"

    let loop = do
        putStrLn ""
        putStrLn "* Input a command *"
        putStr "LCII > "
        cmd  <- getLine
        res <- lciiCmd cmd
        if res == 0
        then do loop
        else do return ()
    loop
    

lciiCmd :: String -> IO Int
lciiCmd cmd = do
    if cmd == ":typed" || cmd == ":t" then do
        putStrLn "* Input typed lambda term *"
        putStr "LCII > "
        t  <- getLine
        putStrLn "* Input type environment *"
        putStr "LCII > "
        ga <- getLine
        if ga == ""
        then ii [] (parseExp t)
        else ii (parseEnv ga) (parseExp t)
        return 0
    else if cmd == ":untyped" || cmd == ":u" then do
        putStrLn "* Input untyped lambda term *"
        putStr "LCII > "
        t  <- getLine
        iiUntyped (parseExp t)
        return 0
    else if cmd == ":quit" || cmd == ":q" then do
        putStrLn "* Quit LCII *"
        return 1
    else do
        putStrLn "* Error *"
        return 0

ii :: [Decl] -> Expr -> IO ()
ii ga t = do
    putStrLn ""
    printWithColor t
    if hasFailure $ typing ga t
    then do
        putStrLn "Typing Error"
    else do
        if occ == []
        then do
            showGa ga
        else do
            showRedexes t
            putStr "Redex: "
            num <- getLine
            if not $ isNumber' num
            then do
                putStrLn $ "Invalid input"
                ii ga t
            else do
                let idx = (read num :: Int) - 1
                if idx > length occ - 1
                then do
                    putStrLn $ "The maximum redex number is " ++ show (length occ)
                    ii ga t
                else do
                    let alpha = gA t (occ !! idx)
                    if alpha == []
                    then do putStr ""
                    else do
                        putStrLn ""
                        putStr $ ansi' Reverse $ "α: " ++ (concat $ intersperse ", " alpha)
                        putStrLn ""
                    ii ga $ reduction t (occ !! idx)
    where
        occ = getRedexPos t []

iiUntyped :: Expr -> IO ()
iiUntyped t = do
    putStrLn ""
    printWithColor' t
    if occ == []
    then do
        putStr ""
    else do
        showRedexes' t
        putStr "Redex: "
        num <- getLine
        if not $ isNumber' num
        then do
            putStrLn $ "Invalid input"
            iiUntyped t
        else do
            let idx = (read num :: Int) - 1
            if idx > length occ - 1
            then do
                putStrLn $ "The maximum redex number is " ++ show (length occ)
                iiUntyped t
            else do
                let alpha = gA t (occ !! idx)
                if alpha == []
                then do putStr ""
                else do
                    putStrLn ""
                    putStr $ ansi' Reverse $ "α: " ++ (concat $ intersperse ", " alpha)
                    putStrLn ""
                iiUntyped $ reduction t (occ !! idx)
    where
        occ = getRedexPos t []

-------------------------------------------------------------------------------
-- Utility
-------------------------------------------------------------------------------
isNumber' xs = all isDigit xs
