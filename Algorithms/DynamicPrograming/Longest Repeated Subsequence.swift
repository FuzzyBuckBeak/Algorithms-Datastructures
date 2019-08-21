//
//  Longest Repeated Subsequence.swift
//  Learning
//
//  Created by Apo on 8/21/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class LongestRepeatedSubsequence {
    func solution(string1: String) {
        let string2 = string1
        var result = Array(repeating: Array(repeating: 0, count: string2.count + 1), count: string1.count + 1)
        let string1Arr = Array(string1)
        let string2Arr = Array(string2)
        
        for i in 1 ... string1Arr.count {
            for j in 1 ... string2Arr.count {
                
                if string1Arr[i - 1] == string2Arr[j - 1] && i != j{
                    result[i][j] = 1 + result[i-1][j-1]
                } else {
                    result[i][j] = max(result[i-1][j], result[i][j-1])
                }
            }
        }
        
        print("LONGEST COMMON SUBSEQUENCE LENGTH - \(result[string1Arr.count][string2Arr.count])")
        longestCommonSubsequence(string1: string1, string2: string2, m: string1.count, n: string2.count, result: result, temp: "")
    }
    
    func longestCommonSubsequence(string1: String, string2: String, m: Int, n: Int, result: [[Int]], temp: String) {
        let arr1 = Array(string1)
        let arr2 = Array(string2)
        
        if m == 0 || n == 0 { print(temp); return }
        if arr1[m - 1] == arr2[n - 1] && m != n {
            let some = String(arr2[n - 1]) + temp
            longestCommonSubsequence(string1: string1, string2: string2, m: m - 1, n: n - 1, result: result, temp: some)
        } else  {
            if result[m - 1][n] > result[m][n - 1] {
                longestCommonSubsequence(string1: string1, string2: string2, m: m - 1, n: n, result: result, temp: temp)
            } else {
                longestCommonSubsequence(string1: string1, string2: string2, m: m, n: n - 1, result: result, temp: temp)
            }
        }
    }
}
