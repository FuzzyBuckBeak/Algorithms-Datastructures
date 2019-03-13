# K’th largest element in a stream

Given an infinite stream of integers, find the k’th largest element at any point of time.

An Efficient Solution is to use Min Heap of size k to store k largest elements of stream. The k’th largest element is always at root and can be found in O(1) time.

Compare the new element with root of heap.
- If new element is smaller, then ignore it. 
- Otherwise replace root with new element and call heapify for the root of modified heap. 

Time complexity of finding the k’th largest element is O(Logk).

