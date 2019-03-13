
//   Return top k elements in the Array
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Return top k elements in the Array
 
 Time Complexity: O(nlogn).
 *******************************************************************************************/

import Foundation

class TopKElements {
    
    func fetchTopKElements(arr: [Int], k: Int) -> [Int] {
        var arr = Array(Set(arr))
        if k > arr.count { return arr }
        quickSort(arr: &arr, start: 0, end: arr.count - 1)
        return Array(arr[arr.count - k ... arr.count - 1])
    }
    
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

        let pivot = arr[Int.random(in: start ... end)] //Choosing any Random Pivot or first pivot

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

