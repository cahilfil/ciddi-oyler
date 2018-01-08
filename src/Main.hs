module Main where

import System.Environment
import Euler

main :: IO ()
main = do 
    args <- getArgs
    case (null args) of 
        True -> putStr $ "Wow! Apparently, you've solved " ++ show count ++ " problem" ++ (if count > 1 then "s" else "") ++ ".\n\n"
        False -> do 
            let n = read $ args !! 0
            solve n
            putStrLn ""
