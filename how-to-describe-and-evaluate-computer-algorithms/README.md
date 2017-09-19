# How to Describe and Evaluate Computer Algorithms

## Linear Search

```
Procedure LINEAR-SEARCH(A, n, x)

Inputs
  A: an array
  n: the number of elements in A to search through
  x: the value being searched for

Output: Either an index i for which A[i] = x, or the
special value NOT-FOUND, which could be any invalid
index into the array, such any negative integer.

1. Set answer to NOT-FOUND
2. For each index i, going from i to n, in order:
    A. If A[i] = x, then set answer to the value of i
3. Return the value of answer as the output
```

The book defines two variants, <tt>BETTER-LINEAR-SEARCH</tt> and <tt>SENTINEL-LINEAR-SEARCH</tt> which assume imperative iterators.

[LinearSearch.hs](LinearSearch.hs) implemented here is naturally recursive, and since it return the matching index once it is found, it is more accurately an implementation of the book's <tt>BETTER-LINEAR-SEARCH</tt> algorithm.
