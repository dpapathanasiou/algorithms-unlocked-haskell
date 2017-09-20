module BinarySearch (
recursiveBinarySearch
) where

recursiveBinarySearch :: (Eq a) => [a] -> Int -> Int -> a -> Int
recursiveBinarySearch a p r x
                    | p > r       = -1
                    | a !! q == x = q
                    | a !! q  > x = recursiveBinarySearch a p (q - 1) x
                    | otherwise   = recursiveBinarySearch a (q + 1) r x
                    where q = (p + r) `div` 2
