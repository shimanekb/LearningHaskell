import Data.List

groupFold :: (a -> a -> Bool) -> [a] -> [[a]]
groupFold p xs = foldl step [] xs
  where step [] x = [[x]]
        step acc x | p (head (last acc)) x = (init acc) ++ [((last acc) ++ [x])]
                   | otherwise             = acc ++ [[x]]