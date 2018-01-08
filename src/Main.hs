module Main where

import System.Environment
import Euler

main :: IO ()
main = do
    args <- getArgs
    let n = read $ args !! 0
    solve n
    putStrLn ""
