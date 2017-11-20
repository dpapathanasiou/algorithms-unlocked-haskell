module TopologicalSort2D (
topologicalSort
) where

import Data.Array

isMatrix :: Num e => Array (Int, Int) e -> Bool
isMatrix graph = (fst dim) == (snd dim)
         where dim = snd (bounds graph)

inDegree :: Num e => Array (Int, Int) e -> [e]
inDegree graph = [sum [graph ! (i, j) | i <- [0..cols]] | j <- [0..cols]]
         where cols = snd (snd (bounds graph))

reduceDegree :: (Num a, Ord a) => a -> a
reduceDegree a = max 0 (a - 1)

getRow :: Num e => Array (Int, Int) e -> Int -> [e]
getRow graph row = [graph ! (row, j) | j <- [0..rows]]
       where rows = fst (snd (bounds graph))

reduceRow :: (Num e, Ord e) => Array (Int, Int) e -> Int -> [e]
reduceRow graph row = map reduceDegree (getRow graph row)

flattenRowCols :: Num t => [[t]] -> [t]
flattenRowCols dat = [col | row <- dat, col <- row]

makeGraph :: Num e => [[e]] -> Array (Int, Int) e
makeGraph dat = let m = (length dat) - 1
                    v = flattenRowCols dat
                 in array ((0,0), (m,m)) [((i, j), (v !! ((i * (m + 1)) + j))) | i <- [0..m], j <- [0..m]]

topologicalSort :: Num e => Array (Int, Int) e -> Maybe [e]
topologicalSort graph
              | isMatrix(graph) = Just (inDegree(graph))
              | otherwise = Nothing
