//
// 98. Validate Binary Search Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 
 Input:
    2
   / \
  1   3
Output: true
 
    5
   / \
  1   4
     / \
    3   6
Output: false
Explanation: The input is: [5,1,4,null,null,3,6]. The root node's value
is 5 but its right child's value is 4.
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
    func isValidBST(_ root: TreeNode?) -> Bool {
       return isBst(root, min: Int.min, max: Int.max)
    }
    
    private func isBst(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        if node == nil { return true }
        if node!.val < min || node!.val > max { return false }
        return isBst(node?.left, min: min, max: node!.val) &&
               isBst(node?.right, min: node!.val, max: max)
        
    }
}
