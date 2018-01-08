module Euler(solve, count) where

import System.IO

-- Don't forget to increase the counter!
count :: Int
count = 1

out :: Show a => a -> String
out s = "result: " ++ show s

solve :: Int -> IO ()
solve 1 = do
    putStr "Gets a, b, c.\nReturns the sum of multiples of a and b below c.\n\n"
    putStr "a b c: "
    hFlush stdout
    line <- getLine
    let (a:b:c:_) = map read $ words line
        sol = sum [x | x <- [1..c-1], x `mod` a == 0 || x `mod` b == 0] 
    putStrLn $ out sol

solve _ = putStrLn "I don't know :(" 
