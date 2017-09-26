module QuickSort(
quickSort
) where

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
    let smaller = quickSort [a | a <- xs, a <= x]
        larger  = quickSort [a | a <- xs, a > x]
    in  smaller ++ [x] ++ larger
