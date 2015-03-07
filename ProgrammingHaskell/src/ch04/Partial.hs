import Data.List

isInAny3 needle haystack = any (isInfixOf needle) haystack