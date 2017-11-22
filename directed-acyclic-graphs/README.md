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

While there is a dedicated [graph data structure](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/) in Haskell, it also already implements topological sort.

So [TopologicalSort2D.hs](TopologicalSort2D.hs) implements the graph as a two-dimensional array, or adjacency matrix, where each value is either zero or one, using [Data.Array](http://hackage.haskell.org/package/array/docs/Data-Array.html), as shown in [this example](https://lotz84.github.io/haskellbyexample/ex/arrays).

Producing the in-degree array in steps 1 to 3 is achieved by taking a sum of all the columns in the matrix.

Retrieving the list of adjacent nodes in step 5C is achieved by pulling the given node (row) from the matrix, and scanning it for non-zero values.

## Relax

```
Procedure RELAX(u, v)

Inputs: u, v: vertices such that there is an edge (u, v).

Result: The value of shortest[v] might decrease, and if it does, pred[v]
becomes u.

1. If shortest[u] + weight(u, v) < shortest[v], then set shortest[v]
to shortest[u] + weight(u, v) and set pred[v] to u.
```

### Shortest Path

```
Procedure DAG-SHORTEST-PATHS(G, s)

Inputs:

  G: a weighted directed acyclic graph containing a set V of n vertices
  and a set E of m directed edges.

  s: a source vertex in V.

Result: For each non-source vertex v in V, shortest[v] is the weight
of sp(s, v) of a shortest path from s to v and pred[v] is the vertex
preceding v on some shortest path.

For the source vertex s, shortest[s] = 0 and pred[s] = NULL. If there
is no path from s to v, then shortest[v] = ∞ and pred[v] = NULL.

1. Call TOPOLOGICAL-SORT(G) and set l to be the linear order of vertices
returned by the call.
2. Set shortest[v] to ∞ for each vertex v except s, set shortest[s]
to 0, and set pred[v] to NULL for each vertex v.
3. For each vertex u, taken in the order given by l:
   A. For each vertex v adjacent to u:
      i. Call RELAX(u, v)
```
