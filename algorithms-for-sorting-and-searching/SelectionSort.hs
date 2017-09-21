module SelectionSort (
sort
) where

swap :: (Ord a) => [a] -> Int -> Int -> [a]
swap a i j
   | i >= j = a
   | otherwise = let h = take i a
                     m = take (j - i - 1) (drop (i + 1) a)
                     t = drop (j + 1) a
                 in h ++ [a !! j] ++ m ++ [a !! i] ++ t

findSmallest :: (Ord a) => [a] -> Int -> Int -> Int
findSmallest a i j
           | j == (length a) = i
           | a !! j < a !! i = findSmallest a j (j + 1)
           | otherwise       = findSmallest a i (j + 1)

selectionSort :: (Ord a) => [a] -> Int -> [a]
selectionSort a i
             | i == (length a) = a
             | otherwise = selectionSort (swap a i (findSmallest a i (i + 1))) (i + 1)

sort :: (Ord a) => [a] -> [a]
sort a = selectionSort a 0
