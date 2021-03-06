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


Although QuickSort works better in practice, the advantage of HeapSort worst case upper bound of O(nLogn).

MergeSort also has upper bound as O(nLogn) and works better in practice when compared to HeapSort. But MergeSort requires O(n) extra space

HeapSort is not used much in practice, but can be useful in real time (or time bound where QuickSort doesn’t fit) embedded systems where less space is available (MergeSort doesn’t fit)


Selection sort performs n iterations, where the average iteration takes n/2 steps, for a total of O(n2) time.
> But what if we improve the data structure? 

It takes O(1) time to remove a particular item from an unsorted array once it has been located, but O(n) time to find the smallest item. These are exactly the operations supported by priority queues. 

So what happens if we replace the data structure with a better priority queue implementation, either a heap or a balanced binary tree? 

Operations within the loop now take O(log n) time each, instead of O(n). Using such a priority queue implementation speeds up selection sort from O(n2) to O(n log n).
The name typically given to this algorithm, heapsort, obscures the relationship between them, but heapsort is nothing but an implementation of selection sort using the right data structure
