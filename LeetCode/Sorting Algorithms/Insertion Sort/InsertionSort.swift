//
//  Insertion Sort
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement Insertion Sort
 Insertion sort is actually very fast for sorting small arrays
 
 Time complexity - O(n^2)
 Stable Algorithm
 Inspace Algorithm
 
 Runtime:   Average: O(N^2)
            Worst: O(N^2)
 Memory:    O(1)
 ********************************************************************************/
import Foundation

class InsertionSort {
    func InsertionSort(arr: inout[Int]) {
        for i in 1 ..< arr.count {
            var y = i
            while ( y > 0 && arr[y] < arr[y - 1]) {
                (arr[y], arr[y - 1]) = (arr[y - 1], arr[y])
                y -= 1
            }
        }
    }
}
