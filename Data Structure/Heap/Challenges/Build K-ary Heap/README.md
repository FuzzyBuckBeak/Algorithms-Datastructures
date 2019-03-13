# K-ary Heap

K-ary heaps are a generalization of binary heap(K=2) in which each node have K children instead of 2. Just like binary heap, it follows two properties:

+ Nearly complete binary tree, with all levels having maximum number of nodes except the last, which is filled in left to right manner.
+  Like Binary Heap, it can be divided into two categories: 
- Max k-ary heap (key at root is greater than all descendants and same is recursively true for all nodes). 
- Min k-ary heap (key at root is lesser than all descendants and same is recursively true for all nodes)


### Implementation
An array represents a K-ary heap such that for any node we consider:
- Parent of the node at index i (except root node) is located at index (i-1)/k
- Children of the node at index i are at indices (k*i)+1 , (k*i)+2 …. (k*i)+k
- The last non-leaf node of a heap of size n is located at index (n-2)/k

### Time Complexity Analysis

- heapifyup - O(log<sub>k</sub>n)
- heapifyDown -  O(k log<sub>k</sub>n).
- Insert and decreaseKey() -  O(log<sub>k</sub>n).
- build heap is O(n)
