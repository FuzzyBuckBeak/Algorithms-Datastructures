//
// 226. Invert Binary Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/22/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************

 Invert a binary tree.
 
 Example:
 
 Input:
 
    4
   /   \
  2     7
 / \   / \
1   3 6   9
 Output:
 
     4
   /   \
  7     2
 / \   / \
9   6 3   1

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        let left = invertTree(root?.left)
        let right = invertTree(root?.right)
        root?.left = right
        root?.right = left
        return root
    }
    
    func areMirrors(root1: TreeNode?, root2: TreeNode?) -> Bool {
        if root1 == nil, root2 == nil { return true }
        if root1 == nil || root2 == nil { return false }
        if root1?.val != root2?.val { return false }
        return areMirrors(root1: root1?.left, root2: root2?.right) &&
            areMirrors(root1: root1?.right, root2: root2?.left)
    }
}
