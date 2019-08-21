//
//  Longest Common Substring of given string.swift
//  Learning
//
//  Created by Apo on 8/20/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class LongestCommonSubstring {
    func solution(string1: String, string2: String) {
        var result = Array(repeating: Array(repeating: 0, count: string2.count + 1), count: string1.count + 1)
        let string1 = Array(string1)
        let string2 = Array(string2)
        
        var substringLength: Int = 0
        var coordinateLocation: (Int, Int) = (0, 0)
        
        for i in 1 ... string1.count {
            for j in 1 ... string2.count {
                if string1[i - 1] == string2[j - 1] {
                    result[i][j] = 1 + result[i-1][j-1]
                } else {
                    result[i][j] = 0
                }
                
                if substringLength < result[i][j] {
                    substringLength = result[i][j]
                    coordinateLocation = (i, j)
                }
            }
        }
        
        print("LONGEST COMMON SUBSTRING LENGTH - \(substringLength)")
        
        var value = substringLength
        var i = coordinateLocation.0
        var j = coordinateLocation.1
        
        var resultString: String = ""
        while value != 0 && i >= 0 && j >= 0 {
            resultString = String(string1[i - 1]) + resultString
            i = i - 1
            j = j - 1
            value = result[i][j]
        }
        
        print("LONGEST COMMON SUBSTRING - \(resultString)")
    }
}
