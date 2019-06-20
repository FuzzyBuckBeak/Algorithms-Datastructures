//
//  0-1 Knapsack Problem.swift
//  Learning
//
//  Created by Apo on 6/19/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

//Bottom up approach for knapsack problem
class Knapsack {
    func solution(weights: [Int], values: [Int], capacity: Int) -> Int {
        guard weights.count == values.count else { return -1 }
        // create a two dimensional array to hold the values
        //for the sample example:
        //weights = [5, 3, 4, 2]
        //values = [60, 50, 70, 30] respectively
        //capacity of knapsack = 5

        /* The above creates an array as follows
                    0       1       2       3       4       5  --> (capacity of knapsack)
         0    0     0       0       0       0       0       0
         60   1     0
         50   2     0
         70   3     0
         30   4     0
         
         */
        
        var arr = Array(repeating: (Array(repeating: 0, count: capacity + 1)), count: weights.count + 1)
        
        /*The above mentioned conditions are met when we created the array.
        
        The above creates an array as follows
        0       1       2       3       4       5  --> (capacity of knapsack)
        0    0  0       0       0       0       0
        60   1  0       0       0       0       0
        50   2  0       0       0       0       0
        70   3  0       0       0       0       0
        30   4  0       0       0       0       0
 
         */
        
        
        //we loop through all the possible weights
        for i in 0 ... weights.count {
            
            // possible capacity of knapsack
            for j in 0 ... capacity {
                /* if we have a knapsack of capacity 0, we cannot add any item to cart, hence the value it can hold is 0
                 therefore the first column is Zero
                 
                 if we have an item of Zero weight, its equivalent of having no item, hence the value of non item is 0
                 therefore the first row is Zero.
                 
                 These are our base conditions. */
                if (i == 0 || j == 0) { continue }
                
                //if weight of an item is smaller than the knapsack, we consider to include it
                if weights[i-1] <= j {
                    //we check for maximum of the item; if value of newly inlcuded value is greater than the item that was already included.
                    //if we are including newly considered item, does it leave any space in the knapsack?
                    //if it does, we consider the previous item for the remaining knapsack capacity
                    arr[i][j] = max(arr[i-1][j], values[i - 1] + arr[i-1][j - weights[i - 1]])
                } else {
                    
                    // if the weight of the item is greater than the capacity of knapsack, we dont include the new item,
                    //instead we consider the value of the item that was previously added.
                    // This can be got from the previous row
                    arr[i][j] = arr[i-1][j]
                }
            }
        }
        
        //return the last row/cloumn combination for the final answer.
        return arr[weights.count][capacity]
    }
    
}
