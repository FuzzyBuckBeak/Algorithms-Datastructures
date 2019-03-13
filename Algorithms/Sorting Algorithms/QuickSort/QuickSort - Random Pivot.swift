//
//  QuickSort - Random Pivot algorithm
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement QuickSort - Choosing any Random Pivot
 Time complexity - O(nlogn)
 Properties
    1. Unstable Algorithm - meaning the order of input is not maintained when its
                            sorted
    2. Inspace Algorithm - The Space Complexity is constant. There is no auxiliary
                            space used for this sorting algorithm
 ********************************************************************************/
import Foundation

class QuickSort {
    
    func quickSort(arr: inout [Int], start: Int, end: Int) {
        if (start < end) {
            let pivot = partition(arr: &arr, start: start, end: arr.count - 1)
            quickSort(arr: &arr, start: start, end: pivot - 1)
            quickSort(arr: &arr, start: pivot + 1, end: end)
        }
    }
    
    private func partition(arr: inout [Int], start: Int, end: Int) -> Int {
        var i = start
        var j = start
        
        let pivot = arr[start] //Choosing any Random Pivot or first pivot
        
        while (j < end ) {
            if (arr[j] < pivot) {
                (arr[j], arr[i]) = (arr[i], arr[j])
                i += 1
            } else if (arr[j] == pivot) {
                (arr[j], arr[end]) = (arr[end], arr[j])
                j -= 1
            }
            
            j += 1
        }
        
        (arr[i], arr[end]) = (arr[end], arr[i])
        return i
    }
}
