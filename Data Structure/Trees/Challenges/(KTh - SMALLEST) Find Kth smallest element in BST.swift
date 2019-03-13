//
// Find Kth smallest element in BST.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

Note:
You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

Example 1:

Input: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
Output: 1
 
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

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        return smallest(root: root, k: k, count: &count)?.val ?? -1
    }
    
    private func smallest(root: TreeNode?, k: Int, count: inout Int) -> TreeNode? {
        if root == nil { return nil }
        let left = smallest(root: root?.left, k: k, count: &count)
        count += 1
        if k == count { return root }
        let right = smallest(root: root?.right, k: k, count: &count)
        return left != nil ? left : right
    }
}
