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

*n.b.* the very first algorithm in this chapter is an imperative version of binary search, using a loop, but since recursion is more idiomatic in haskell, using just this definition instead.

Implemented in [BinarySearch.hs](BinarySearch.hs).

## Selection Sort

```
Procedure SELECTION-SORT(A, n)

Inputs:
  A: an array.
  n: the number of elements in A to sort.

Result: The elements of A are sorted into non-decreasing
order.

1. For i = 1 to n - 1:
   A. Set smallest to i.
   B. For j = i + 1 to n:
      i. if A[j] < A[smallest], then set smallest to j.
   C. Swap A[i] with A[smallest].
```

Implemented in [SelectionSort.hs](SelectionSort.hs).

## Insertion Sort

```
Procedure INSERTION-SORT(A, n)

Inputs and Outputs: Same as SELECTION-SORT.

1. For i = 2 to n:
   A. Set key to A[i], and set j to i - 1.
   B. While j > 0 and A[j] > key, do the following:
      i. Set A[j + 1] to A[j].
     ii. Decrement j (i.e., set j to j - 1).
   C. Set A[j + 1] to key.
```

Implemented in [InsertionSort.hs](InsertionSort.hs).
