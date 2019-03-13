//
// Give an algorithm for searching for an element in a Binary Tree without using recursion.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Give an algorithm for searching for an element in a Binary Tree without using recursion.swift

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
func searchElement(root: TreeNode?, element: Int) -> Bool {
    if root == nil { return false }
    var queue: [TreeNode?] = []
    queue.append(root)
    
    while !queue.isEmpty {
        if let node = queue.removeFirst() {
            if node.val == element { return true }
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
    }
    return false
}
}
