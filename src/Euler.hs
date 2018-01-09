module Euler(solve, count) where

import System.IO
import Data.List.Extra
import Text.Format

{- Helper Functions -}

out :: Show a => a -> String
out x = "result: " ++ show x

getInput :: [String] -> String -> IO String
getInput varNames returnExp = do
    putStr $ "Gets " ++ foldr1 (\s t -> s ++ ", " ++ t) varNames ++ ".\n"
    putStr $ format ("Returns " ++ returnExp ++ ".\n\n") varNames
    putStr $ intercalate " " varNames ++ ": "
    hFlush stdout
    line <- getLine
    return line

printOutput :: Show a => a -> IO ()
printOutput = putStrLn . out

solver :: Show a => [String] -> String -> (String -> a) -> IO ()
solver varNames returnExp f = do
    inp <- getInput varNames returnExp
    printOutput $ f inp

{- Project Euler Solutions -}

-- Don't forget to increase the counter!
count :: Int
count = 2

solve :: Int -> IO ()
solve 1 = solver 
    ["a", "b", "c"] 
    "the sum of multiples of {0} and {1} below {2}"
    (\inp -> let (a:b:c:_) = map read $ words inp
                 xs = [x | x <- [1..c-1], x `mod` a == 0 || x `mod` b == 0]
             in sum xs)

solve 173 = solver
    ["n"] 
    "the number of different square laminaes using up to {0} tiles"
    (\inp -> let n = read inp
                 laminaes = nubOrd [(a,b) | a <- [1..n], b <- takeWhile (\x -> x^2-a^2 <= n) [a+1..n], (b - a) `mod` 2 == 0] -- O(n*sqrt(n))
             in length laminaes)

solve _ = putStrLn "I don't know :(" 
