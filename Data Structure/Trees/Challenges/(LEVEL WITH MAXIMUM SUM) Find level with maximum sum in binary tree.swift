//
// Find level with maximum sum in binary tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/22/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Find level with maximum sum in binary tree
*****************************************************************************************************************************/

import Foundation

import Foundation

class TreeNode: CustomStringConvertible {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
    
    var description: String {
        return String(self.val)
    }
}



class BinaryTree {
    func findLevelWithMaxSum(root: TreeNode?) -> Int {
        guard root != nil  else { return 0 }
        var queue: [TreeNode?]  = []
        var result: (sum: Int, level: Int) = (0, 0)
        var level: Int = 0
        
        queue.append(root)
        while !queue.isEmpty {
            var sum = 0
            var count = queue.count - 1
            
            while count >= 0 {
                if let node = queue.removeFirst() {
                    count -= 1
                    sum = sum + node.val
                    
                    if let leftChild = node.left { queue.append(leftChild) }
                    if let rightChild = node.right { queue.append(rightChild) }
                }
            }
            if sum > result.sum { result.sum = sum; result.level = level }
            level += 1
        }
        return result.level
    }
    
    
    
    //Another version of question - Find Max level sum.
     func maxLevelSum(root: TreeNode) -> Int {
        var queue: [TreeNode] = []
        queue.append(root)
        var maxSum: Int = 0
        while !queue.isEmpty {
            var count = queue.count - 1
            let levelSum = queue.reduce(0) { $0 + $1.value }
            
            while count >= 0 {
                let node = queue.removeFirst()
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
                count -= 1
            }
            maxSum = max(maxSum, levelSum)
        }
        
        print("maxSum - \(maxSum)")
        return maxSum
    }
}
