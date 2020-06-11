import Eval
import Parser
import Typing

import Control.Exception
import System.Environment (getArgs)

main = do
    args <- getArgs
    let
        ga = parseEnv (args !! 0)
        t = parseExp (args !! 1)
    catch (showRedexForWeb ga t) $ \(SomeException e) -> print "Parse Error"
