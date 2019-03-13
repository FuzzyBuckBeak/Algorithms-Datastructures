
//   Given an array check if it is a Max heap or min Heap
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Given an array determine the type of heap
 Output: If it is a Max heap return "Max heap Type"
         if It is a Min heap return "Min heap Type"
         else return "Not a valid Heap Type"
 
 unstable Algorithm
 Inspace Algorithm
 
 *******************************************************************************************/

import Foundation

enum HeapType: String {
    case maxHeap = "Max Heap"
    case minHeap = "Min Heap"
    case invalidType = "Invalid Heap Type"
}

class Heap {
    private var elements: [Int]
   
    init(elements: [Int]) {
        self.elements = elements
    }

    private func rightChildIndex(parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    private func leftChildIndex(parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    func determineHeapType() -> String {
        if evaluate(type: .maxHeap) { return HeapType.maxHeap.rawValue }
        else if evaluate(type: .minHeap) { return HeapType.minHeap.rawValue }
        return HeapType.invalidType.rawValue
    }
    
    private func determinePriorityFor(type: HeapType, first: Int, second: Int) -> Bool {
        switch type {
            case .maxHeap: return first < second
            case .minHeap: return first > second
            default: return false
        }
    }
    
    private func evaluate(type: HeapType) -> Bool {
        for index in 0 ..< elements.count {
            let leftIndex = leftChildIndex(parentIndex: index)
            if ( leftIndex < elements.count) {
                if determinePriorityFor(type: type, first: elements[index], second: elements[leftIndex]) { return false }
            }
            
            let rightIndex = rightChildIndex(parentIndex: index)
            if (rightIndex < elements.count) {
                if determinePriorityFor(type: type, first: elements[index] , second: elements[rightIndex]) { return false }
            }
        }
        return true
    }
}

