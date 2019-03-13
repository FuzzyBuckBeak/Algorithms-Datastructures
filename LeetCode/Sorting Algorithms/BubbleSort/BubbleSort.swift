//
//  Bubble Sort
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement Bubble Sort
 Sometimes this algorithm is refered as Sinking sort, due to the larger, or heavier elements sinking to the end of the array.
 
 Time complexity - O(n^2)
 Stable Algorithm
 Inspace Algorithm
 
 Runtime:   Average: O(N^2)
            Worst: O(N^2)
 Memory:    O(1)
 ********************************************************************************/
import Foundation

class BubbleSort {
    
    func bubbleSort(arr: inout[Int]) {
        for i in 0 ..< arr.count {
            for j in 1 ..< arr.count - i {
                if (arr[j] < arr[j - 1]) {
                    (arr[j], arr[j - 1]) = (arr[j - 1], arr[j])
                }
            }
        }
    }
    
}
