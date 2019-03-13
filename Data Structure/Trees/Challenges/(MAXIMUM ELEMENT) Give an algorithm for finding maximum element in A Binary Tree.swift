//
// Give an algorithm for finding maximum element in A Binary Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Give an algorithm for finding maximum element in A Binary Tree
 
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
        if (root?.left == nil) && (root?.right == nil) { return root!.val }
        let left  = findMax(root: root?.left)
        let right = findMax(root: root?.right)
        return max(max(left, right), root!.val)
    }
}
