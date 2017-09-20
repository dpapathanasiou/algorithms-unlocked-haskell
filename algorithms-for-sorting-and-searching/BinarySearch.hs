module BinarySearch (
search
) where

recursiveBinarySearch :: (Ord a) => [a] -> Int -> Int -> a -> Int
recursiveBinarySearch a p r x
                    | p > r       = -1
                    | a !! q == x = q
                    | a !! q  > x = recursiveBinarySearch a p (q - 1) x
                    | otherwise   = recursiveBinarySearch a (q + 1) r x
                    where q = (p + r) `div` 2

search :: (Ord a) => [a] -> a -> Int
search a x = recursiveBinarySearch a 0 ((length a) - 1) x
