//
//  Merge Sort
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement Merge Sort
 
 Time complexity - O(nlogn)
 Stable Algorithm
 Not Inspace Algorithm
 
 Runtime:   Average: O(nlogn)
            Worst: O(nlogn)
 Memory:    O(n)
 ********************************************************************************/
import Foundation

class MergeSort {
    func mergeSort(intArr: [Int]) -> [Int] {
        guard intArr.count > 1 else { return intArr }
        let middleIndex = intArr.count / 2
        let leftSide = mergeSort(intArr: Array(intArr[0 ..< middleIndex]))
        let rightSide = mergeSort(intArr: Array(intArr[middleIndex ..< intArr.count]))
        return merge(left: leftSide, right: rightSide)
    }
    
    private func merge(left: [Int], right: [Int]) -> [Int] {
        var leftPointer = 0
        var rightPointer = 0
        var resultArray: [Int] = []
        while (leftPointer < left.count && rightPointer < right.count) {
            if (left[leftPointer] < right[rightPointer]) {
                resultArray.append(left[leftPointer])
                leftPointer += 1
            } else if (left[leftPointer] > right[rightPointer]) {
                resultArray.append(right[rightPointer])
                rightPointer += 1
            } else {
                resultArray.append(right[rightPointer])
                rightPointer += 1
                resultArray.append(left[leftPointer])
                leftPointer += 1
            }
        }
        
        while (leftPointer < left.count) {
            resultArray.append(left[leftPointer])
            leftPointer += 1
        }
        
        while (rightPointer < right.count) {
            resultArray.append(right[rightPointer])
            rightPointer += 1
        }
        
        return resultArray
    }
}
