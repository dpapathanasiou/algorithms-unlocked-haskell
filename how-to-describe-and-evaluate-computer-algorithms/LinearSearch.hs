module LinearSearch(
myElem,
search
) where

myElem :: (Eq a) => a -> [a] -> Bool
myElem a [] = False
myElem a (x:xs)
     | a == x    = True
     | otherwise = a `myElem` xs

searchWithIndex :: (Eq a) => a -> [a] -> Int -> Int
searchWithIndex a [] _ = -1
searchWithIndex a (x:xs) i
              | a == x    = i
              | otherwise = searchWithIndex a xs (i + 1)

search :: (Eq a) => a -> [a] -> Int
search a (x:xs) = searchWithIndex a (x:xs) 0
