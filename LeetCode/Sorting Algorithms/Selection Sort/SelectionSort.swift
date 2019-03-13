//
//  Selection Sort
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement Selection Sort
 
 Time complexity - O(n^2)
 Stable Algorithm
 Inspace Algorithm
 
 Runtime:   Average: O(N^2)
            Worst: O(N^2)
 Memory:    O(1)
 ********************************************************************************/
import Foundation

class SelectionSort {
    func SelectionSort(arr: inout[Int]) {
        for i in 0 ..< arr.count {
            var lowest = i
            for j in i ..< arr.count {
                if arr[j] < arr[lowest] { lowest = j }
            }
            if lowest != i {
                (arr[i], arr[lowest]) = (arr[lowest], arr[i])
            }
        }
    }
}
