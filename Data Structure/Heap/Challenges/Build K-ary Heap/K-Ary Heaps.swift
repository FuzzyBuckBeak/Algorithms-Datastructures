//
//  K-ary heap
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Implement Heap Data Structure with k children
 
 unstable Algorithm
 Inspace Algorithm
 
 Using a k-ary heap, the runtime of both the deleteMin and insert operations is O(log n).
 
 (Depending on heap type)
 insert        deleteMin        remove        findMin/Max       buildHeap        searchHeap
 O(log n)        O(log n)        O(log n)        O(1)              O(n)              O(n)
 
 *******************************************************************************************/
import Foundation

class karyHeap {
    private var element: [Int]
    private let priorityFunction: (Int, Int) -> Bool
    private let kUnit: Int
    
    init(element: [Int], priorityFunction:@escaping (Int, Int) -> Bool, kUnit: Int) {
        self.element = element
        self.priorityFunction = priorityFunction
        self.kUnit = kUnit
        buildHeap()
    }
    
    private func buildHeap() {
        for i in stride(from: (element.count - 1) / kUnit, through: 0, by: -1) {
            heapifyDown(index: i)
        }
    }
    
    private func isRoot(index: Int) -> Bool {
        return index == 0
    }
    
    private func isChildrenPresent(parentIndex: Int) -> Bool {
        return kUnit * parentIndex + 1 < element.count
    }
   
    private func parentOfIndex(childIndex: Int) -> Int {
        return (childIndex - 1) / kUnit
    }
    
    private func isHigherPriority(first: Int, second: Int) -> Bool {
        return priorityFunction(first, second)
    }
    
    private func returnChildrenIndexWithMaxValue(for parentIndex: Int) -> Int {
        var ChildCount = 1
        var chosenIndex = kUnit * parentIndex + ChildCount
        var maxValue = element[chosenIndex]
        
        ChildCount += 1
        while( kUnit * parentIndex + ChildCount < element.count && ChildCount <= kUnit) {
            if isHigherPriority(first: element[kUnit * parentIndex + ChildCount], second: maxValue) {
                chosenIndex = kUnit * parentIndex + ChildCount
                maxValue = element[chosenIndex]
            }
            ChildCount += 1
        }

        return chosenIndex
    }
    
    private func heapifyDown(index: Int) {
        var newIndex = index
    
        while(isChildrenPresent(parentIndex: newIndex)) {
            let chosenIndex = returnChildrenIndexWithMaxValue(for: newIndex)
            if isHigherPriority(first: element[newIndex], second: element[chosenIndex]) { return }
            (element[newIndex], element[chosenIndex]) = (element[chosenIndex], element[newIndex])
            newIndex = chosenIndex
        }
    }
    
    private func heapifyUp(index: Int) {
        var newIndex = index
        while(!isRoot(index: newIndex) && isHigherPriority(first: element[newIndex], second: element[parentOfIndex(childIndex: newIndex)])) {
            let parentIndex = parentOfIndex(childIndex: newIndex)
            (element[newIndex], element[parentIndex]) =  (element[parentIndex], element[newIndex])
            newIndex = parentIndex
        }
    }
    func dequeue() {
        (element[0], element[element.count - 1]) = (element[element.count - 1], element[0])
        element.removeLast()
        heapifyDown(index: 0)
    }
    
    func enqueue(value: Int) {
        element.append(value)
        heapifyUp(index: element.count - 1)
    }
    
    func remove(item: Int) {
        guard let index = element.index(of: item) else { return }
        (element[index], element[element.count - 1]) = (element[element.count - 1], element[index])
        element.removeLast()
        heapifyDown(index: index)
    }
    
    func printHeap() {
        print(element)
    }
}
