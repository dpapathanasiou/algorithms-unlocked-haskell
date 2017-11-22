# Directed Acyclic Graphs

## Topological Sort

```
Procedure TOPOLOGICAL-SORT(G)

Input: G: a directed acyclic graph with vertices numbered 1 to n.

Output: A linear order of the vertices such that u appears before v in the  
linear order if (u, v) is an edge in the graph.

1. Let in-degree [1..n] be a new array, and create an empty linear order
   of vertices.
2. Set all values in in-degree to 0.
3. For each vertex u:
   A. For each vertex v adjacent to u:
      i. Increment in-degree[v]
4. Make a list next consisting of all vertices u such that in-degree[u]
   equals 0.
5. While next is not empty, do the following:
   A. Delete a vertex from next, and call it vertex u.
   B. Add u to the end of the linear order.
   C. For each vertex v adjacent to u:
      i. Decrement in-degree[v].
     ii. If in-degree[v] = 0, then insert v into the next list.
6. Return the linear order.
```

[TopologicalSort2D.hs](TopologicalSort2D.hs) implements the graph as a two-dimensional array, or adjacency matrix, where each value is either zero or one, using [Data.Array](http://hackage.haskell.org/package/array/docs/Data-Array.html), as shown in [this example](https://lotz84.github.io/haskellbyexample/ex/arrays).

Producing the in-degree array in steps 1 to 3 is achieved by taking a sum of all the columns in the matrix.

Retrieving the list of adjacent nodes in step 5C is achieved by pulling the given node (row) from the matrix, and scanning it for non-zero values.
