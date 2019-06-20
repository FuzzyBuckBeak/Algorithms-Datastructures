//
//  MaximumSubArray.swift
//  Learning
//
//  Created by Apo on 6/17/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//
//Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

//Example:

//Input: [-2,1,-3,4,-1,2,1,-5,4],
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.

import Foundation

class MaxSubArray {
    
    //bottom up approach
    func solution(arr: [Int]) -> Int {
        var maxsoFar = arr[0]
        var maxEndingHere = arr[0]
        
        for index in 1 ..< arr.count {
            maxEndingHere = max(arr[index] + maxEndingHere, arr[index])
            maxsoFar = max(maxsoFar, maxEndingHere)
        }
        
        return maxsoFar
    }
}
