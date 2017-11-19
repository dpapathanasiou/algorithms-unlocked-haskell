module TopologicalSort2D (
topologicalSort
) where

import Data.Array

isMatrix :: (Enum e, Num e, Ix e) => Array (e, e) e -> Bool
isMatrix graph = (fst dim) == (snd dim)
         where dim = snd (bounds graph)

inDegree :: (Enum e, Num e, Ix e) => Array (e, e) e -> [e]
inDegree graph = [sum [graph ! (i, j) | i <- [0..cols]] | j <- [0..cols]]
       where cols = snd (snd (bounds graph))

topologicalSort :: (Enum e, Num e, Ix e) => Array (e, e) e -> Maybe [e]
topologicalSort graph
              | isMatrix(graph) = Just (inDegree(graph))
              | otherwise = Nothing
