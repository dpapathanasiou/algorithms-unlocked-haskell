# Algorithms for Sorting and Searching

## Binary Search

```
Procedure RECURSIVE-BINARY-SEARCH(A, p, r x)

Inputs and Outputs: Inputs A and x are the same as
LINEAR-SEARCH, as is the output. The inputs p and r
delineate the subarray A[p..r] under consideration.

1. If p > r, then return NOT-FOUND
2. Otherwise (p <= r), do the following:
   A. Set q to [(p+r)/2].
   B. If A[q] = x, then return q.
   C. Otherwise (A[q] != x), if A[q] > x, then return
      RECURSIVE-BINARY-SEARCH(A, p, q-1, x).
   D. Otherwise (A[q] < x), return
      RECURSIVE-BINARY-SEARCH(A, q+1, r, x).
```
