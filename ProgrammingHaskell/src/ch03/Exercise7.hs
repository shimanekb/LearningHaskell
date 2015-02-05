intersperse :: a -> [[a]] -> [a]
intersperse _ [] = []
intersperse x ys | length ys == 1 = (head ys)
intersperse x ys = (head ys ++ [x])++intersperse x (tail ys)