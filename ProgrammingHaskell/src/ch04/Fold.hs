foldle :: (a -> b -> a) -> a -> [b] -> a
foldle step zero (x:xs) = foldle step (step zero x) xs
foldle _    zero []     = zero

foldSum xs = foldle step 0 xs
             where step acc x = acc + x
             
niceSum :: [Int] -> Int
niceSum xs = foldle (+) 0 xs

foldri :: (a -> b -> b) -> b -> [a] -> b
foldri step zero (x:xs) = step x (foldri step zero xs)
foldri _    zero []     = zero

filterCu :: (a -> Bool) -> [a] -> [a]
filterCu p []                 = []
filterCu p (x:xs) | p x       = x : filterCu p xs
                | otherwise = filterCu p xs

myFilter p xs = foldri step [] xs
                where step x ys | p x       = x : ys
                                | otherwise = ys
                                
myMap :: (a -> b) -> [a] -> [b]

myMap f xs = foldri step [] xs
             where step x ys = f x : ys
             
myFoldLe :: (a -> b -> a) -> a -> [b] -> a
myFoldLe f z xs = foldri step id xs z
                  where step x g a = g (f a x)
                  
identity :: [a] -> [a]
identity xs = foldri (:) [] xs

append :: [a] -> [a] -> [a]
append xs ys = foldri (:) ys xs