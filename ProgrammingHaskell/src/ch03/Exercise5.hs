checkPalindrome:: Eq a => [a] -> Bool
checkPalindrome xs = xs == (reverse xs)