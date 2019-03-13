//
//   Linear Search.swift
//
//  Created by FuzzyBuckBeak on 12/23/18..
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Linear Search
 
 Time Complexity: O(n)
 *******************************************************************************************/

import Foundation

class Search {
    func linear(arr: [Int], searchElement: Int) -> Bool {
        for element in arr {
            if element == searchElement {
                return true
            }
        }
        
        return false
    }
}
