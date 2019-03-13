//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Return top k elements in the Array using Max Heap
 
 Time Complexity: O(klogn) + O(n)
 Build Heap: O(n)
 heapify elements: O(logn): heapify k elements: O(klogn)
 Total = O(n) + O(klogn) ~ O(nlogn)
 *******************************************************************************************/

import Foundation

class TopKElementsMaxHeap {
    func fetchtTopKElement(arr: [Int], k: Int) -> [Int] {
        guard k < arr.count else { return arr }
        let distinct = Array(Set(arr))
        guard distinct.count > k else { return distinct }
        let heap = MaxHeap(elements: distinct)
        var count = distinct.count
        for _ in 0 ..< k {
            count -= 1
            heap.deleteMax(size: count)
        }
        
        return Array(heap.elements[distinct.count - k ... distinct.count - 1])
    }
}


class MaxHeap {
    var elements: [Int]
    init(elements: [Int]) {
        self.elements = elements
        buildHeap()
    }
    
    private func leftChildIndex(parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    private func rightChildIndex(parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    
    private func parentIndex(childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    private func buildHeap() {
        for i in stride(from: (elements.count - 1)/2, through: 0, by: -1) {
            heapifyDown(index: i, size: elements.count)
        }
        
        print(elements)
    }
    
    private func heapifyDown(index: Int, size: Int) {
        
        var newIndex = index
        while(leftChildIndex(parentIndex: newIndex) < size) {
            var chosenIndex = leftChildIndex(parentIndex: newIndex)
            
            let rightChild = rightChildIndex(parentIndex: newIndex)
            if rightChild < size && elements[rightChild] > elements[chosenIndex] {
                chosenIndex = rightChild
            }
            
            if elements[newIndex] > elements[chosenIndex] { return }
            (elements[newIndex], elements[chosenIndex]) = (elements[chosenIndex], elements[newIndex])
            
            newIndex = chosenIndex
            
        }
    }
    
    func deleteMax(size: Int) {
        (elements[0], elements[size]) = (elements[size], elements[0])
        heapifyDown(index: 0, size: size)
    }
}
