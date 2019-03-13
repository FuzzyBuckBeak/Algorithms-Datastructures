# kth largest elements in an array using quick sort partitions

The algorithm is similar to QuickSort. (QuickSelect)
The difference is, instead of recurring for both sides (after finding pivot), it recurs only for the part that contains the k-th smallest element. 
The logic is simple, if index of partitioned element is more than k, then we recur for left part. If index is same as k, we have found the k-th smallest element and we return. If index is less than k, then we recur for right part. 

This reduces the expected complexity from O(n log n) to O(n), with a worst case of O(n^2).
