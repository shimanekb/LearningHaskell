import Data.List
import Data.Either
import Data.Char (digitToInt)
import Data.Char (isDigit)

asInt_fold :: String -> Int
asInt_fold (x:xs) | x == '-' = foldl (\y z -> y * 10 - (digitToInt z)) 0 (xs)
asInt_fold xs = foldl (\y z -> y * 10 + (digitToInt z)) 0 xs

type ErrorMessage = String

asInt_either :: String -> Either ErrorMessage Int
asInt_either []                  = Left "empty string"
asInt_either (x:xs) | (all isDigit xs) == False     = Left  (show (toInt' (x:xs)):: String)
                    | x == '-'                      = Right (negate (toInt' xs))
                    | otherwise                     = Right (toInt' (x:xs))
                      where toInt' ys = foldl (\y z -> y * 10 + (digitToInt z)) 0 ys