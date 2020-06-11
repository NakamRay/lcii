import Eval
import Parser
import Typing
import Coloring

import System.Environment (getArgs)

main = do
    args <- getArgs
    let
        t = parseTerm (args !! 0)
        num = args !! 1
        rPoss = getRedexPos t []
        idx = (read num :: Int) - 1
    if idx > length rPoss - 1
    then do
        putStrLn $ "The maximum redex number is " ++ show (length rPoss)
    else do
        let alpha = gA t (rPoss !! idx)
        if alpha == []
        then do putStr ""
        else do
            putStr $ html' Reverse $ "α: " ++ showA alpha
            putStrLn ""
        showRedexForWeb' $ reduction t (rPoss !! idx)
