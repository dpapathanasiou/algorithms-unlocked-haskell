module TopologicalSort2D (
makeGraph,
sort
) where

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

getNext :: (Ord a, Num a) => [a] -> [Int]
getNext indegree = findZeros indegree

getAdjacents :: (Ord e, Num e) => Array (Int, Int) e -> Int -> [Int]
getAdjacents graph i = findOnes (getRow graph i)

decrementAt :: (Ord a, Num a) => [a] -> Int -> [a]
decrementAt a i = let h = take i a
                      v = a !! i
                      t = drop (i + 1) a
                  in h ++ [(v - 1)] ++ t

updateInDegree :: (Ord a, Num a) => [a] -> [Int] -> [a]
updateInDegree indegree [] = indegree
updateInDegree indegree (h:t) = updateInDegree (decrementAt indegree h) t

buildLinearOrder :: (Ord e, Num e) => Array (Int, Int) e -> [e] -> [Int] -> [Int] -> [Int]
buildLinearOrder _ _ [] order = order
buildLinearOrder graph indegree (h:t) order = let adjacents     = getAdjacents graph h
                                                  updatedDegree = updateInDegree indegree adjacents
                                                  nextAdditions = [i | i <- adjacents, updatedDegree !! i == 0]
                                              in buildLinearOrder graph updatedDegree (t ++ nextAdditions) (order ++ [h])

makeGraph :: Num e => [[e]] -> Array (Int, Int) e
makeGraph dat = let m = (length dat) - 1
                    v = [col | row <- dat, col <- row]
                in array ((0,0), (m,m)) [((i, j), (v !! ((i * (m + 1)) + j))) | i <- [0..m], j <- [0..m]]

sort :: (Ord e, Num e) => Array (Int, Int) e -> Maybe [Int]
sort graph
   | isMatrix(graph) = let indegree = inDegree graph
                           next     = getNext indegree
                       in Just(buildLinearOrder graph indegree next [])
   | otherwise = Nothing
