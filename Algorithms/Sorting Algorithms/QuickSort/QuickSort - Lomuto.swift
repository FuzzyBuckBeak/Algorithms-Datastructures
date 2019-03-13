//
//  QuickSort - Lomuto algorithm
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement QuickSort - Lomuto's partitioning scheme
 Lomuto algorithm always uses the last element as the pivot
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
        if start < end {
            let pivot = partition(arr: &arr, start: start, end: end)
            quicksort(arr: &arr, start: start, end: pivot - 1)
            quicksort(arr: &arr, start: pivot + 1, end: end)
        }
    }
    
    private func partition(arr: inout[Int], start: Int, end: Int) -> Int {
        var i = start
        let pivot = arr[end] //Lomuto algorithm always uses the last element as the pivot
        
        for j in start ..< end {
            if (arr[j] < pivot) {
                (arr[i], arr[j]) = (arr[j], arr[i])
                i += 1
            }
        }
        (arr[i], arr[end]) = (arr[end], arr[i])
        return i
    }
}
