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

    func floor(root: TreeNode?, data: Int) -> TreeNode? {
        var floor: TreeNode? = nil
        findFloor(node: root, floor: &floor, data: data)
        return floor
    }
    
    private func findFloor(node: TreeNode?, floor: inout TreeNode?, data: Int) {
        if node == nil { return }
        if node!.val == data { floor = floor == nil ?  node : floor}
        if node!.val < data {
            floor = node
            findFloor(node: node?.right, floor: &floor, data: data)
        } else {
            findFloor(node: node?.left, floor: &floor, data: data)
        }
    }
}
