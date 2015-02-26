safeHead :: [a] -> Maybe a
safeHead (x:_) = Just x
safeHead []    = Nothing

safeTail :: [a] -> Maybe [a]
safeTail (_ : xs) = Just xs
safeTail []       = Nothing

safeLast :: [a] -> Maybe a
safeLast xs = if not (null xs)
	      then Just (last xs)
	      else Nothing
	      
safeInit :: [a] -> Maybe [a]
safeInit xs = if not (null xs)
	      then Just (init xs)
	      else Nothing