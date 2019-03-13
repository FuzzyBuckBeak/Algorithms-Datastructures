//
// Convert Sorted Array to Binary Search Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted array: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return arrayToBST(nums: nums, left: 0, right: nums.count - 1)
    }
    
    private func arrayToBST(nums: [Int], left: Int, right: Int) -> TreeNode? {
        if left > right { return nil }
        
        if left == right { return TreeNode(val: nums[left]) }
        else {
            let mid = (left + right) / 2
            let node = TreeNode(val: nums[mid])
            node.left = arrayToBST(nums: nums, left: left, right: mid - 1)
            node.right = arrayToBST(nums: nums, left: mid + 1, right: right)
            return node
        }
    }
}
