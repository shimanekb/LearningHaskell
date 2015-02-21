import Data.List
import Data.Ratio
import Data.Ord

data Direction = TurnLeft 
               | TurnRight 
               | TurnStraight
                 deriving (Show, Eq)
                 
calculateTurn:: (Int, Int) -> (Int, Int) -> Direction
calculateTurn xs ys = let slope = (fst ys - fst xs)
                      in if slope == 0
                         then TurnStraight
                      else if slope < 0
                         then TurnLeft
                      else TurnRight  
                      
calculateTurns:: (Int, Int) -> (Int, Int) -> (Int, Int) -> Direction
calculateTurns x y z = let result = (fst y - fst x) * (snd z - snd x) - (snd y - snd x) * (fst z - fst x)
		       in if result < 0
			     then TurnRight
			  else if result > 0
			     then TurnLeft
			  else TurnStraight
			

calculateDistance:: (Int, Int) -> (Int, Int) -> Double
calculateDistance x y = let xDifference = fromIntegral (fst y - fst x) 
		            yDifference = fromIntegral (snd y - snd x)
		        in sqrt (xDifference**2 + yDifference**2)
		        
calculateAngle :: (Int, Int) -> (Int, Int) -> Double
calculateAngle xs ys = let opposite = calculateDistance (fst ys, snd xs) ys
                           adjacent = calculateDistance xs (fst ys, snd xs)
                        in (180 * atan (opposite / adjacent)) / pi
                        
determineVertexes :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
determineVertexes xs ys = if length xs > 2 && (calculateTurns (xs!!0) (xs!!1) (xs!!2)) == TurnLeft
			     then determineVertexes (tail xs) ((xs!!0):ys)
			  else if length xs > 2
			     then determineVertexes (filter (/=(xs!!1)) xs) ys
			  else ys
                   			  
calculateConvexHull :: [(Int, Int)] -> [(Int, Int)]
calculateConvexHull xs = let p = minimumBy (comparing snd) xs
			     compareAngles a b = calculateAngle p a `compare` calculateAngle p b
			     angleList = filter (/=p) (sortBy compareAngles xs)
                         in determineVertexes ([p] ++ angleList ++ [p, (angleList!!1)]) []