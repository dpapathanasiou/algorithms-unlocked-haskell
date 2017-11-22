import Data.Array

isMatrix :: Num e => Array (Int, Int) e -> Bool
isMatrix graph = (fst dim) == (snd dim)
         where dim = snd (bounds graph)

inDegree :: Num e => Array (Int, Int) e -> [e]
inDegree graph = [sum [graph ! (i, j) | i <- [0..cols]] | j <- [0..cols]]
         where cols = snd (snd (bounds graph))

getRow :: Num e => Array (Int, Int) e -> Int -> [e]
getRow graph row = [graph ! (row, j) | j <- [0..rows]]
       where rows = fst (snd (bounds graph))

findMatches :: (Ord a, Num a) => (a -> Bool) -> [a] -> Int -> [Int] -> [Int]
findMatches _ [] _ x = x
findMatches fn (h:t) i x
          | fn(h)     = findMatches fn t (i + 1) (x ++ [i])
          | otherwise = findMatches fn t (i + 1) x

findZeros :: (Ord a, Num a) => [a] -> [Int]
findZeros a = let fn x = x == 0
              in findMatches fn a 0 []

findOnes :: (Ord a, Num a) => [a] -> [Int]
findOnes a = let fn x = x == 1
             in findMatches fn a 0 []

makeGraph :: Num e => [[e]] -> Array (Int, Int) e
makeGraph dat = let m = (length dat) - 1
                    v = [col | row <- dat, col <- row]
                in array ((0,0), (m,m)) [((i, j), (v !! ((i * (m + 1)) + j))) | i <- [0..m], j <- [0..m]]

topologicalSort :: Num e => Array (Int, Int) e -> Maybe [e]
topologicalSort graph
              | isMatrix(graph) = Just (inDegree(graph))
              | otherwise = Nothing
