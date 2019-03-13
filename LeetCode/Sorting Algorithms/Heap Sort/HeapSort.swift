//
//  Heap sort
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Implement Heap Sort
 
 unstable Algorithm
 Inspace Algorithm
 
 (Depending on heap type)
 buildHeap
    O(n)
 
 Performance of heap sort is O(n log n) for its best, worse and average cases
 *******************************************************************************************/

import Foundation


class Heap {
    private var elements: [Int]
    private let priorityFunction: (Int, Int) -> Bool
    
    init(elements:[Int], priorityFunction: @escaping (Int, Int) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        BuildHeap()
    }
    
    private func BuildHeap() {
        for index in (0 ..< elements.count / 2).reversed() {
            heapifyDown(index: index, size: elements.count)
        }
    }
    
    private func isHigherPriority(at firstItem: Int, than secondItem: Int) -> Bool {
        return priorityFunction(firstItem, secondItem)
    }
    
    private func parentOfIndex(index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(parentIndex: Int) -> Int {
        return (2 * parentIndex ) + 1
    }
    
    private func rightChildIndex(parentIndex: Int) -> Int {
        return (2 * parentIndex ) + 2
    }
    
    private func isRoot(index: Int) -> Bool {
        return index == 0
    }
    
    private func heapifyDown(index: Int, size: Int) {
        //time complexity for heapifyDown operation is O(log n)
        var newIndex = index
        while(leftChildIndex(parentIndex: newIndex) < size) {
            var chosenIndex = leftChildIndex(parentIndex: newIndex)
            
            let rightIndex = rightChildIndex(parentIndex: newIndex)
            if (rightIndex < size) && (isHigherPriority(at: elements[rightIndex], than: elements[chosenIndex])) {
                chosenIndex = rightIndex
            }
            
            if isHigherPriority(at: elements[newIndex], than: elements[chosenIndex]) { return }
            (elements[newIndex], elements[chosenIndex]) = (elements[chosenIndex], elements[newIndex])
            newIndex = chosenIndex
        }
    }
}

extension Heap {
    //Assumes that the max heap is given - Sorting in the ascending order.
    func heapSort() -> [Int] {
        var endPointer = elements.count
        while (endPointer > 0) {
            endPointer -= 1
            (elements[0], elements[endPointer]) = (elements[endPointer], elements[0])
            heapifyDown(index: 0, size: endPointer)
        }
        return self.elements
    }
    
    //Try with recursion
//    func heapSort() -> [Int] {
//        return heapSort(endPointer: self.elements.count)
//    }
//    func heapSort(endPointer: Int) -> [Int] {
//        if endPointer == 0 { return elements }
//        let end = endPointer - 1
//        (elements[0], elements[end]) = (elements[end], elements[0])
//        heapifyDown(index: 0, size: end)
//        return heapSort(endPointer: end)
//    }

}
