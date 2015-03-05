import Data.List
import Data.Char (digitToInt)

asInt_fold :: String -> Int
asInt_fold (x:xs) | x == '-' = foldl (\y z -> y * 10 - (digitToInt z)) 0 (xs)
asInt_fold xs = foldl (\y z -> y * 10 + (digitToInt z)) 0 xs