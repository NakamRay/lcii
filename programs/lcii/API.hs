import Eval
import Parser
import Typing
import DataType
import Coloring

import Data.List
import Options.Applicative
import Control.Exception
import System.Environment (getArgs)

-------------------------------------------------------------------------------
-- Command Line Parsing
-- Ref: https://thoughtbot.com/blog/applicative-options-parsing-in-haskell
--      https://hackage.haskell.org/package/optparse-applicative-0.14.3.0/docs/Options-Applicative.html
-------------------------------------------------------------------------------
data Command = Init Bool String String String
             | Reduce Bool String String String String

parseInit :: Parser Command
parseInit = Init
    <$> switch ( long "untyped" <> short 'u' <> help "For untyped" )
    <*> argument str (metavar "XI")
    <*> argument str (metavar "GAMMA")
    <*> argument str (metavar "TERM")

parseReduce :: Parser Command
parseReduce = Reduce
    <$> switch ( long "untyped" <> short 'u' <> help "For untyped" )
    <*> argument str (metavar "XI")
    <*> argument str (metavar "GAMMA")
    <*> argument str (metavar "TERM")
    <*> argument str (metavar "INT")

parseCommand :: Parser Command
parseCommand = subparser $
    command "init" (parseInit `withInfo` "Initialize process") <>
    command "red"  (parseReduce  `withInfo` "One step reduction")

withInfo :: Parser a -> String -> ParserInfo a
withInfo opts desc = info (helper <*> opts) $ progDesc desc

-------------------------------------------------------------------------------
-- One Step Reduction
-------------------------------------------------------------------------------
showRedexForWeb :: [String] -> [Decl] -> Expr -> IO ()
showRedexForWeb xi ga t = do
    printWithColor t
    if hasFailure $ typing xi ga t
    then do
        putStrLn "Typing Error"
    else do
        if (getRedexPos t []) == []
        then do
            putStrLn "Normal Form"
        else do
            showRedexes t
            putStr "簡約したいRedexの番号を入力してください．"


-- Untyped
showRedexForWeb' :: Expr -> IO ()
showRedexForWeb' t = do
    printWithColor' t
    if getRedexPos t [] == []
    then do
        putStrLn "Normal Form"
    else do
        showRedexes' t
        putStr "簡約したいRedexの番号を入力してください．"

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------
main :: IO ()
main = do
    -- get options
    cmd <- execParser (info parseCommand mempty)
    
    case cmd of
        Init isUntyped xi gamma term ->
            if isUntyped
                then do
                    let term' = parseTerm term
                    catch (showRedexForWeb' term') $ \(SomeException e) -> print "Parse Error"
                else do
                    let
                        xi' = parseTypeContext xi
                        gamma' = parseEnv gamma
                        term' = parseExp term
                    catch (showRedexForWeb xi' gamma' term') $ \(SomeException e) -> print e
        Reduce isUntyped xi gamma term num ->
            if isUntyped
                then do
                    let
                        term' = parseTerm term
                        occ = getRedexPos term' []
                        idx = (read num :: Int) - 1
                    if idx > length occ - 1
                        then do
                            putStrLn $ "The maximum redex number is " ++ show (length occ)
                        else do
                            let alpha = getAlpha term' [] (occ !! idx) (getFV term')
                            if alpha == []
                                then do putStr ""
                                else do
                                    putStr $ html' Reverse $ "α: " ++ (concat $ intersperse ", " alpha)
                                    putStrLn ""
                            showRedexForWeb' $ reduction term' (occ !! idx)
                else do
                    let
                        xi' = parseTypeContext xi
                        gamma' = parseEnv gamma
                        term' = parseExp term
                        occ = getRedexPos term' []
                        idx = (read num :: Int) - 1
                    if idx > length occ - 1
                        then do
                            putStrLn $ "The maximum redex number is " ++ show (length occ)
                        else do
                            let alpha = getAlpha term' [] (occ !! idx) (getFV term')
                            if alpha == []
                                then do putStr ""
                                else do
                                    putStr $ html' Reverse $ "α: " ++ (concat $ intersperse ", " alpha)
                                    putStrLn ""
                            showRedexForWeb xi' gamma' $ reduction term' (occ !! idx)
