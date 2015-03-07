import Data.List

customAny :: (a -> Bool) -> [a] -> Bool
customAny f xs = validate' validatedArray
                 where validatedArray = foldl' (\x y -> (f y): x) [] xs
                       validate' xs | null (filter (==True) xs) = False
                                    | otherwise                 = True