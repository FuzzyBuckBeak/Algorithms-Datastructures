# Heap

> A heap is a complete binary tree, also known as a binary heap, that can be constructed using an array.

### Heap Types:
1. Max heap, in which elements with a higher value have a higher priority.
2. Min heap, in which elements with a lower value have a higher priority.

### Properties of Heap:
1. In a max heap, parent nodes must always contain a value that is greater than or equal to the value in its children. The root node will always contain the highest value.
2. In a min heap, parent nodes must always contain a value that is less than or equal to the value in its children. The root node will always contain the lowest value.


### Operations on heap:
1. Inserting an element                               
2. Removing an element
3. Removing a given element
4. Building heap from Array
5. Searching for given element in the heap

Time complexity: O(logn)


| Insert | deleteMin | remove | findMin/Max | buildHeap | searchHeap |
| ------ | ------ | ------ | ------ | ------ | ------ |
| O(log n)  | O(log n)  | O(log n) |   O(1) | O(n) | O(n) |
