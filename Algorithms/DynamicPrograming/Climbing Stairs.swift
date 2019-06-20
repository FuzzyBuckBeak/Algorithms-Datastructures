//
//  Climbing Stairs.swift
//  Learning
//
//  Created by Apo on 6/19/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation
class climbingStairs {
    func solution(steps: [Int], n: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: n+1)
        dp[0] = 1
        
        for i in 1...n {
            var count = 0
            for step in steps {
                if step <= i {
                    count += dp[i-step]
                }
            }
            dp[i] = count
        }
        
        return dp[n]
    }
}
