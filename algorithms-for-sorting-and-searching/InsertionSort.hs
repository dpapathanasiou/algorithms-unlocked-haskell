module InsertionSort (
sort
) where

replace :: (Ord a) => [a] -> Int -> a -> [a]
replace a i x = let h = take i a
                    t = drop (i + 1) a
                in h ++ [x] ++ t

decrementInner :: (Ord a) => [a] -> Int -> a -> ([a], Int)
decrementInner a j k
             | j == -1    = (a, j)
             | a !! j < k = (a, j)
             | otherwise  = decrementInner (replace a (j + 1) (a !! j)) (j - 1) k

insertionSort :: (Ord a) => [a] -> Int -> [a]
insertionSort a i
            | i == (length a) = a
            | otherwise = let k = a !! i
                              (a', j) = decrementInner a (i - 1) k
                          in insertionSort (replace a' (j + 1) k) (i + 1)

sort :: (Ord a) => [a] -> [a]
sort a
   | (length a) < 2 = a
   | otherwise = insertionSort a 1
