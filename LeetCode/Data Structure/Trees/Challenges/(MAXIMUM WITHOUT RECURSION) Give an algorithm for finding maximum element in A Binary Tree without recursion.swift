//
// Give an algorithm for finding maximum element in A Binary Tree without recursion.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Give an algorithm for finding maximum element in A Binary Tree without recursion
 
 Note: This is a binary Tree

*****************************************************************************************************************************/

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
    func findMax(root: TreeNode?) -> Int {
        if root == nil { return -1 }
        var queue: [TreeNode?] = []
        queue.append(root)
        var maxElement = -1
        while !queue.isEmpty {
            var count = queue.count - 1
            var levelMax = -1
            while count >= 0 {
                if let node = queue.removeFirst() {
                    levelMax = max(levelMax, node.val)
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right)}
                    count -= 1
                }
            }
            
            maxElement = max(maxElement, levelMax)
        }
        
        return maxElement
    }
}
