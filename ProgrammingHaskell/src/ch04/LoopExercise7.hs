customTakeWhile :: (a -> Bool) -> [a] -> [a] -> [a]
customTakeWhile f (x:xs) ys | null xs       = reverse (x:ys)
                            | (f x) == True = customTakeWhile f xs (x:ys)
                            | otherwise     = reverse ys