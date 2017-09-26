merge' :: (Ord a) => [a] -> [a] -> [a] -> [a]
merge' a [] c = a ++ c
merge' a b [] = a ++ b
merge' a (bh:bt) (ch:ct)
     | bh <= ch  = merge' (a ++ [bh]) bt (ch:ct)
     | otherwise = merge' (a ++ [ch]) (bh:bt) ct

mergeSort :: (Ord a) => [a] -> [a]
mergeSort a
        | (length a) < 2 = a
        | otherwise = merge' [] (mergeSort (take mid a)) (mergeSort (drop mid a))
        where mid = (length a) `div` 2
