import Data.List

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith boolFunction xs = let predicate = filter boolFunction xs
			        suffix    = filter (\n -> not (boolFunction n)) xs
			    in [predicate, suffix]