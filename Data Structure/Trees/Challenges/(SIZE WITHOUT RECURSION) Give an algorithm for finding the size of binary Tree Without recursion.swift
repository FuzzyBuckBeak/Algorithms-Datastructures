//
// Give an algorithm for finding the size of binary Tree without recursion.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Give an algorithm for finding the size of binary Tree without recursion

 Note: This is Binary Tree not a BST

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
func size(root: TreeNode?) -> Int {
    if root == nil { return 0 }
    var queue: [TreeNode?] = []
    queue.append(root)
    
    var count = 0
    while !queue.isEmpty {
        if let node = queue.removeFirst() {
            count += 1
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
    }
    return count
}
}
