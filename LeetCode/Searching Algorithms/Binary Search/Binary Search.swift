//
//   Binary Search.swift
//
//  Created by FuzzyBuckBeak on 12/23/18..
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Binary Search
 Prerequisite - Array has to be sorted
 
 Time Complexity: O(logn)
 *******************************************************************************************/

import Foundation

class Search {
    func binary(arr: [Int], searchElement: Int) -> Bool {
        return _internalBinary(arr: arr, start: 0, end: arr.count - 1, searchElement: searchElement)
    }
    
    
    private func _internalBinary(arr: [Int], start: Int, end: Int, searchElement: Int) -> Bool {
        if end < start { return false }
        let mid = start + (end - start) / 2
        if arr[mid] == searchElement { return true }
        if arr[mid] > searchElement { return _internalBinary(arr: arr, start: start, end: mid - 1, searchElement: searchElement) }
        return _internalBinary(arr: arr, start: mid + 1, end: end, searchElement: searchElement)
    }
}
