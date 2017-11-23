module TopologicalSort2D (
makeGraph,
sort
) where

import Data.Array

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

getNext :: (Ord a, Num a) => [a] -> [Int]
getNext indegree = let fn x = x == 0
                   in findMatches fn indegree 0 []

getAdjacents :: (Ord e, Num e) => Array (Int, Int) e -> Int -> [Int]
getAdjacents graph i = let fn x = x == 1
                      in findMatches fn (getRow graph i) 0 []

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

isMatrix :: Num e => [[e]] -> Bool
isMatrix (h:t) = length (h:t) == length(h)

makeGraph :: Num e => [[e]] -> Maybe(Array (Int, Int) e)
makeGraph dat
        | isMatrix(dat) = let m = (length dat) - 1
                              v = [col | row <- dat, col <- row]
                          in Just (array ((0,0), (m,m)) [((i, j), (v !! ((i * (m + 1)) + j))) | i <- [0..m], j <- [0..m]])
        | otherwise = Nothing

sort :: (Ord e, Num e) => Array (Int, Int) e -> [Int]
sort graph = let indegree = inDegree graph
                 next     = getNext indegree
             in buildLinearOrder graph indegree next []
