//
// Give an algorithm to find the sum of all elements in a binary Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 
 Give an algorithm to find the sum of all elements in a binary Tree

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
    func sum(root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return root!.val + sum(root: root?.left) + sum(root: root?.right)
    }
    
    func sumWithoutRecursion(root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var queue: [TreeNode?] = []
        queue.append(root)
        var sum = 0
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                sum += node.val
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        return sum
    }
}
