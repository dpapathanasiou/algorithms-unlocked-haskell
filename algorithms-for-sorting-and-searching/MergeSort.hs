slice :: (Ord a) => [a] -> Int -> Int -> [a]
slice a i j
    | i > j = a
    | otherwise = take (j - i + 1) (drop i a)

merge' :: (Ord a) => [a] -> [a] -> [a] -> [a]
merge' a [] c = a ++ c
merge' a b [] = a ++ b
merge' a (bh:bt) (ch:ct)
     | bh <= ch  = merge' (a ++ [bh]) bt (ch:ct)
     | otherwise = merge' (a ++ [ch]) (bh:bt) ct

merge :: (Ord a) => [a] -> Int -> Int -> Int -> [a]
merge a p q r = merge' [] (slice a p q) (slice a (q + 1) r)

mergeSort :: (Ord a) => [a] -> Int -> Int -> [a]
mergeSort a p r
        | p >= r = a
        | otherwise = merge (mergeSort (mergeSort a p q) (q + 1) r) p q r
        where q = (p + r) `div` 2
