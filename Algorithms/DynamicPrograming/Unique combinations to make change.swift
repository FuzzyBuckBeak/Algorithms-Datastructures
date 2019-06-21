//
//  Unique combinations to make change.swift
//  Learning
//
//  Created by Apo on 6/20/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class UniqueWaysOfCoinChange {
    func solution(coins: [Int], amount: Int) -> Int {
        //If amount is Zero, irrespective of number of coins
        //There is one way to make a change - by not giving change
        if amount == 0  { return 1 }
        
        //If coins is Zero, irrespective of amount, we can form no change
        if coins.count == 0 { return 0 }
        
        var arr = Array(repeating: Array(repeating: 0, count: amount + 1), count: coins.count + 1)
        
        for i in 0 ... amount { arr[0][i] = 0 }
        for i in 0 ... coins.count { arr[i][0] = 1 }
        
        for i in 1 ... coins.count {
            for j in 1 ... amount {
                if coins[i - 1] <= j {
                    
                    //if the coin in less than the amount
                    //Amount = 5, coins [1, 2, 3]
                    //for example if amount = 5; coin = 2
                    //if we consider to use 2: 5-2 = 3.
                    //How many ways can 3 be expressed in terms of 2 and 1 ?
                    // 1 + 1 + 1
                    // 2 + 1 that is two ways + above ways(ways to express 5 in terms of 1)
                    //hence 3 ways
                    //      0   1   2   3   4   5
                    /* 0    [1, 0,  0,  0,  0,  0],
                       1    [1, 1,  1,  1,  1,  1],
                       2    [1, 1,  2,  2,  3,  3],
                       3    [1, 1,  2,  3,  4,  5]]*/
                    arr[i][j] = arr[i - 1][j] + arr[i][j - coins[i - 1]]
                } else {
                    
                    //  if not included, copy from above. Consider just the previous coin
                    arr[i][j]  = arr[i-1][j]
                }
            }
        }
        return arr[coins.count][amount]
    }
}
