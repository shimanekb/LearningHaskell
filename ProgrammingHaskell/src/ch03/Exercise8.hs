data Tree a = Node a (Tree a) (Tree a)
			| Empty
			deriving (Eq,Show)
			
			
determineTreeHeight :: Eq a => Tree a -> Int -> Int
determineTreeHeight (Node _ x y) r = if not (x == Empty)
                                        then determineTreeHeight x (r + 1) 
                                     else if not (y == Empty)
                                        then determineTreeHeight y (r + 1) 
                                     else r                                         