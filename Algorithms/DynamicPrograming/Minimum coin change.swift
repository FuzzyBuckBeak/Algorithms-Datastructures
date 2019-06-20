//
//  CoinChange.swift
//  Learning
//
//  Created by Apo on 6/17/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//
//You are given coins of different denominations
//and a total amount of money amount.
//Write a function to compute the fewest number of coins
//that you need to make up that amount.
//If that amount of money cannot be made up by any combination of the coins,
//return -1.

//Example 1:

//Input: coins = [1, 2, 5], amount = 11
//Output: 3
//Explanation: 11 = 5 + 5 + 1


import Foundation

class CoinChange {
    
    //Bottom up Approach
    func solution(amount: Int, coins: [Int]) -> Int {
        var arr = Array(repeating: amount+1, count: amount+1)
        arr[0] = 0
        
        
        for i in 1 ..< arr.count {
            for coin in coins {
                if coin <= i {
                    arr[i] = min(arr[i], arr[i - coin] + 1)
                }
            }
        }
    
        return arr[amount] > amount ? -1 : arr[amount]
    }
    
    
    //TopDown Approach.
    func solutionTopDown(amount: Int, coins: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 0, count: amount + 1)
        return helper(coins: coins, remainder: amount, dp: &dp)
    }
    
    private func helper(coins: [Int], remainder: Int, dp: inout [Int]) -> Int {
        if remainder == 0 { return 0 }
        if remainder < 0 { return -1 }
        if dp[remainder] != 0 { return dp[remainder] }
        var minimum = Int.max
        for coin in coins {
            let change = helper(coins: coins, remainder: remainder - coin, dp: &dp)
            if change >= 0 && change < minimum {
                minimum = 1 + change
            }
        }
        dp[remainder] = (minimum == Int.max) ? -1 : minimum;
        return dp[remainder]
    }
}
