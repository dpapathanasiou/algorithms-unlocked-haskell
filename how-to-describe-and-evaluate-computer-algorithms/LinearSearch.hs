module LinearSearch(
myElem
) where

myElem :: (Eq a) => a -> [a] -> Bool
myElem a [] = False
myElem a (x:xs)
     | a == x    = True
     | otherwise = a `myElem` xs
