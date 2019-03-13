//
//  Heap
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Implement Heap Data Structure
 
 unstable Algorithm
 Inspace Algorithm
 
 Using a binary heap, the runtime of both the deleteMin and insert operations is O(log n).
 
                                        (Depending on heap type)
 insert        deleteMin        remove        findMin/Max       buildHeap        searchHeap
O(log n)        O(log n)        O(log n)        O(1)              O(n)              O(n)

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
            heapifyDown(index: index)
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
    
    private func heapifyUp(index: Int) {
        var newIndex = index
        while(!isRoot(index: newIndex) && isHigherPriority(at: elements[newIndex], than: elements[parentOfIndex(index: newIndex)])) {
            let parentIndex = parentOfIndex(index: newIndex)
            (elements[newIndex], elements[parentIndex]) =  (elements[parentIndex], elements[newIndex])
            newIndex = parentIndex
        }
    }
    
    private func heapifyDown(index: Int) {
        var newIndex = index
        while (leftChildIndex(parentIndex: newIndex) < elements.count ) {
            var chosenIndex = leftChildIndex(parentIndex: newIndex)
            
            let rightIndex = rightChildIndex(parentIndex: newIndex)
            if(rightIndex < elements.count && isHigherPriority(at: elements[rightIndex], than: elements[chosenIndex])) {
                chosenIndex = rightIndex
            }
            
            if (isHigherPriority(at: elements[newIndex], than: elements[chosenIndex])) { return }
            (elements[newIndex], elements[chosenIndex]) = (elements[chosenIndex], elements[newIndex])
            newIndex = chosenIndex
        }
    }
    
    private func isMinHeap() -> Bool {
        return elements.min() == elements[0]
    }
    
    func enqueue(value: Int) {
        elements.append(value)
        heapifyUp(index: elements.count - 1)
    }
    
    func dequeue() {
        (elements[0], elements[elements.count - 1]) = (elements[elements.count - 1], elements[0])
        elements.removeLast()
        heapifyDown(index: 0)
    }
    
    func remove(item: Int) {
        guard let index = elements.index(of: item) else { return }
        (elements[index], elements[elements.count - 1]) = (elements[elements.count - 1], elements[index])
        elements.removeLast()
        heapifyDown(index: index)
    }
    
    func decrease(item: Int, by value: Int) {
        guard let index = elements.index(of: item) else { return }
        let decreaseCount = elements[index] - value
        
        if isMinHeap() {
            elements[index] = decreaseCount
            heapifyUp(index: index)
        } else {
            elements[index] = decreaseCount
            heapifyDown(index: index)
        }
    }
    
    func boost(item: Int, by value: Int) {
        guard let index = elements.index(of: item) else { return }
        let boostCount = elements[index] + value
        
        if isMinHeap() {
            elements[index] = boostCount
            heapifyDown(index: index)
        } else {
            elements[index] = boostCount
            heapifyUp(index: index)
        }
    }
    
    
    func search(element: Int, at index: Int) -> Bool {
        if (index > elements.count) { return false }
        if elements[index] == element { return true }
        //For a max heap: if the element you are searching for is greater than the element at a given node
            //That element will never be avaialable in the heap at all
        //For a min heap: if the element you are searching for is lesser than the element at a given node
        //  That element will never be avaialable in the heap at all
        if isHigherPriority(at: element, than: elements[index]) { return false }
        if search(element: element, at: leftChildIndex(parentIndex: index)) { return true }
        if search(element: element, at: rightChildIndex(parentIndex: index))  { return true }
        return false
    }
    
    func printHeap() {
        print(elements)
    }
}
