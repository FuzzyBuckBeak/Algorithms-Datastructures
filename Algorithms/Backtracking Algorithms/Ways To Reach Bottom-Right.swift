//
//  Ways To Reach Bottom-Right.swift
//  Learning
//
//  Created by Apo on 8/14/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class WaysToReach {
    func solution(n: Int) -> Int {
        var index: Int = 0
        print(solve(i: 0, j: 0, index: index, n: n))
        return index
    }
    
    private func solve(i: Int, j: Int, index: Int, n: Int) -> Int {
        
        if i == n - 1 || j == n - 1 {
            return 1
        }
        
        return solve(i: i, j: j + 1, index: index, n: n) +
         solve(i: i + 1, j: j, index: index, n: n)
    }
}
