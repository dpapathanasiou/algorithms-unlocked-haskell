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

## Merge Sort

```
Procedure MERGE-SORT(A, p, r)

Inputs:
  A: an array.
  p, r: starting and ending indices of a subarray of A.

Result: The elements of the subarray A[p..r] are sorted
into non-decreasing order.

1. If p >= r, then the subarray A[p..r] has at most one
   element, and so it is already sorted. Just return
   without doing anything.
2. Otherwise, do the following:
   A. Set q to (p+r)/2.
   B. Recursively call MERGE-SORT(A, p, q).
   C. Recursively call MERGE-SORT(A, q+1, r).
   D. Call MERGE(A, p, q, r).
```

which requires MERGE:

```
Procedure MERGE(A, p, q, r)

Inputs:
  A: an array.
  p, q, r: indices into A. Each of the subarrays A[p..q]
  and A[q+1..r] is assumed to be already sorted.

Result: The subarray A[p..r] contains the elements originally in A[p..q] and A[q+1..r], but now the entire
subarray A[p..r] is sorted.

1. Set n1 to q-p+1, and set n2 to r-q.
2. Let B[1..n1 + 1] and C[1..n2 + 1] be new arrays.
3. Copy A[p..q] into B[1..n1], and copy A[q+1..r] into
   C[1..n2].
4. Set both B[n1+1] and C[n2+1] to infinity.
5. Set both i and j to 1.
6. For k = p to r:
   A. If B[i] <= C[j], then set A[k] to B[i] and
      increment i.
   B. Otherwise (i.e., B[i] > C[j]), set A[k] to C[j] and
      increment j.
```

Implemented in [MergeSort.hs](MergeSort.hs) without the explicit (p, q, r) parameters, since those are all idiomatically determinable by the property of the input array.

## Quick Sort

```
Procedure QUICKSORT(A, p, r)

Inputs and Result: Same as MERGE-SORT.

1. If p >= r, then just return without doing anything.
2. Otherwise, do the following:
   A. Call PARTITION(A, p, r), and set q to its result.
   B. Recursively call QUICKSORT(A, p, q-1).
   C. Recursively call QUICKSORT(A, q+1, r).
```

which requires PARTITION:

```
Procedure PARTITION(A, p, r)

Inputs: Same as MERGE-SORT.

Result: Rearranges the elements of A[p..r] so that every
element in A[p..q-1] is less than or equal to A[q] and
every element in A[q+1..r] is greater than q. Returns
the index of q to the caller.

1. Set q to p.
2. For u = p to r-1 do:
   A. If A[u] <= A[r], then swap A[q] with A[u] and then
      increment q.
3. Swap A[q] with A[r] and then return q.
```

Implemented in [QuickSort.hs](QuickSort.hs), again without the explicit (p, q, r) parameters, using a definition found in [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/recursion#quick-sort), which is a great illustration of how to implement something like PARTITION idiomatically.
