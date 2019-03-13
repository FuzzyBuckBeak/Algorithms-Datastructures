
//   Find K’th largest element in an array
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Find K’th largest element in an array
 
 Time Complexity: O(nlogn).
 
 *******************************************************************************************/

import Foundation

class KthLargestElement {
    
    func find(arr: [Int], k: Int) -> Int {
        var arr = arr
        return quickselect(arr: &arr, start: 0, end: arr.count - 1, k: arr.count - k)
    }


    private func quickselect(arr: inout[Int], start: Int, end: Int, k: Int) -> Int {
        let pivot = partition(arr: &arr, start: start, end: end)
        if pivot > k { return quickselect(arr: &arr, start: start, end: pivot - 1, k: k) }
        if pivot == k { return arr[pivot] }
        return quickselect(arr: &arr, start: pivot + 1, end: end, k: k)
    }

    private func partition(arr: inout[Int], start: Int, end: Int) -> Int {
        guard start < end else { return start }
        
        var i = start
        let pivotIndex = Int.random(in: start ... end)
        let pivot  = arr[pivotIndex]
        (arr[pivotIndex], arr[end]) = (arr[end], arr[pivotIndex])
        
        for j in start ..< end {
            if arr[j] < pivot {
                (arr[i], arr[j]) = (arr[j], arr[i])
                i += 1
            }
        }
        
        (arr[i], arr[end]) = (arr[end], arr[i])
        return i
    }
    
}
