//
//  QuickSort - Using iterative approach
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement QuickSort - Using iterative approach
 This is prefered when the array that has to be sorted have duplicate values
 Time complexity - O(nlogn)
 
 Properties
 1. Unstable Algorithm - meaning the order of input is not maintained when its
 sorted
 2. Inspace Algorithm - The Space Complexity is constant. There is no auxiliary
 space used for this sorting algorithm
 ********************************************************************************/

import Foundation

class QuickSort {
    
    func quicksort(arr: inout [Int], start: Int, end: Int) {
        var quickSortCallSack: [Int?] = []
        quickSortCallSack.append(start)
        quickSortCallSack.append(end)
       
        while !quickSortCallSack.isEmpty {
            guard let end = quickSortCallSack.removeLast(),
                let start = quickSortCallSack.removeLast() else { continue }
            
            
            let p = partition(arr: &arr, start: start, end: end)
            
            if (p + 1 < end) {
                quickSortCallSack.append(p + 1)
                quickSortCallSack.append((end))
            }
            
            if (p - 1 > start) {
                quickSortCallSack.append(start)
                quickSortCallSack.append((p - 1))
            }
            
        }
        
    }
    
    private func partition(arr: inout[Int], start: Int, end: Int) -> Int {
        var i = start
        let pivot = arr[end] //Lomuto algorithm always uses the last element as the pivot
        
        for j in start ..< end {
            if (arr[j] <= pivot) {
                (arr[i], arr[j]) = (arr[j], arr[i])
                i += 1
            }
        }
        (arr[i], arr[end]) = (arr[end], arr[i])
        return i
    }
}
