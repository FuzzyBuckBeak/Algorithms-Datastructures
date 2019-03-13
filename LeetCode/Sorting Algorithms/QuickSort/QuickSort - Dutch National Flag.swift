//
//  QuickSort - Dutch national flag partitioning
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement QuickSort - Dutch national flag partitioning
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
    func quicksort(arr: inout[Int], start: Int, end: Int) {
        if start < end {
            let pivotIndex: Int = Int.random(in: start ... end)
            let (p, q) = partition(arr: &arr, start: start, end: end, pivot: arr[pivotIndex])
            quicksort(arr: &arr, start: start, end: p - 1)
            quicksort(arr: &arr, start: q + 1, end: end)
        }
    }
    
    private func partition(arr: inout[Int], start: Int, end: Int, pivot: Int) -> (Int, Int) {
        var low = start
        var equal = start
        var high = end
        
        
        while (equal <= high) {
            if (arr[equal] < pivot) {
                (arr[equal], arr[low]) = (arr[low], arr[equal])
                equal += 1
                low += 1
            } else if (arr[equal] == pivot) {
                equal += 1
            } else {
                (arr[equal], arr[high]) = (arr[high], arr[equal])
                high -= 1
            }
        }
        
        return (low, high)
    }
}
