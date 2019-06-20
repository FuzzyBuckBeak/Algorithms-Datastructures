//
// 114. Flatten Binary Tree to Linked List.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given a binary tree, flatten it to a linked list in-place.

For example, given the following tree:

    1
   / \
  2   5
 / \   \
3   4   6
The flattened tree should look like:

1
 \
  2
   \
    3
     \
      4
       \
        5
         \
          6
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
    func flatten(_ root: TreeNode?) {
        var result: [TreeNode?] = []
        inorderTraversal(root: root, result: &result)
        
        for i in 0 ..< result.count {
            let next = i + 1
            guard next < result.count else { return }
            let node = result[i]
            node?.left = nil
            node?.right = result[next]
        }
    }
    
    func inorderTraversal(root: TreeNode?, result: inout [TreeNode?]) {
        if root == nil { return }
        result.append(root)
        inorderTraversal(root: root?.left, result: &result)
        inorderTraversal(root: root?.right, result: &result)
    }
}
