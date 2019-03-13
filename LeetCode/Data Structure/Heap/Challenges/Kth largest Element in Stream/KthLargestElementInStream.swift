//
//   Find K’th largest element in a stream
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 K’th largest element in a stream
 
 Time Complexity: O(Logk)
 *******************************************************************************************/

import Foundation

class KthLargestInStream {
    private var elements: [Int] = []
    private let k: Int
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        BuildHeapStream(nums: nums)
    }
    
    private func BuildHeapStream(nums: [Int]) {
        for index in (0 ..< nums.count) {
            addElementsToHeap(nums[index])
        }
    }
    

    private func addElementsToHeap(_ val: Int) {
        if elements.count < k {
            elements.append(val)
            heapifyUp(index: elements.count - 1)
        } else if val > elements[0] {
            elements[0] = val
            heapifyDown(index: 0)
        }
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
        while(!isRoot(index: newIndex) && elements[newIndex] < elements[parentOfIndex(index: newIndex)]) {
            let parentIndex = parentOfIndex(index: newIndex)
            (elements[newIndex], elements[parentIndex]) =  (elements[parentIndex], elements[newIndex])
            newIndex = parentIndex
        }
    }
    
    private func heapifyDown(index: Int) {
        
        var newIndex = index
        while(leftChildIndex(parentIndex: newIndex) < elements.count ) {
            var chosenIndex = leftChildIndex(parentIndex: newIndex)
            
            let rightChild = rightChildIndex(parentIndex: newIndex)
            if rightChild < elements.count && elements[rightChild] < elements[chosenIndex] {
                chosenIndex = rightChild
            }
            
            if elements[newIndex] < elements[chosenIndex] { return }
            (elements[newIndex], elements[chosenIndex]) = (elements[chosenIndex], elements[newIndex])
            
            newIndex = chosenIndex
        }
    }
    
    func add(_ val: Int) -> Int {
        addElementsToHeap(val)
        return elements[0]
    }
}
