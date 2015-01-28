computeNumber:: Int -> [a] -> Int
computeNumber n xs = if null xs
			then n
		     else computeNumber (n + 1) (tail xs)