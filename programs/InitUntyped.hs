import Eval
import Parser
import Typing

import Control.Exception
import System.Environment (getArgs)

main = do
    args <- getArgs
    let t = parseTerm (args !! 0)
    catch (showRedexForWeb' t) $ \(SomeException e) -> print "Parse Error"
