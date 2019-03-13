
//   Given a min heap convert to max heap
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Given a min heap convert to max heap
 
 unstable Algorithm
 Inspace Algorithm
 
 Time Complexity: O(n).
 
 *******************************************************************************************/

import Foundation

class Heap {
    private var elements: [Int]
    
    init(elements: [Int]) {
        self.elements = elements
    }
    
    private func isRoot(index: Int) -> Bool {
        return index == 0
    }
    
    private func parentIndex(of childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    private func rightChildIndex(parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    private func leftChildIndex(parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    func printHeap() {
        print(self.elements)
    }
    
    private func heapifyDown(index: Int) {
        var newIndex = index
        while (leftChildIndex(parentIndex: newIndex) < elements.count) {
            var chosenIndex = leftChildIndex(parentIndex: newIndex)
            
            let rightIndex = rightChildIndex(parentIndex: newIndex)
            if(rightIndex < elements.count && elements[chosenIndex] < elements[rightIndex]) {
                chosenIndex = rightIndex
            }
            
            if elements[newIndex] > elements[chosenIndex] { return }
            (elements[newIndex], elements[chosenIndex]) = (elements[chosenIndex], elements[newIndex])
            newIndex = chosenIndex
        }
    }
    
    func convertMaxToMin() {
        for i in stride(from: (elements.count - 1) / 2, through: 0, by: -1) {
            heapifyDown(index: i)
        }
    }
}



