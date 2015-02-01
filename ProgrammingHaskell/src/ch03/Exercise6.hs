import Data.List
import Data.Function

sortLists:: [[a]] -> [[a]]
sortLists xs = if null xs
                  then xs
               else sortBy (compare `on` length) xs  