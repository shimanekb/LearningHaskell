custom_concat :: [[a]] -> [a]
custom_concat xs = foldr (++) [] xs