//
// Determine if given binary tree is a subtree of another binary tree or not
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Determine if given binary tree is a subtree of another binary tree or not
 
*****************************************************************************************************************************/

import Foundation

class TreeNode: CustomStringConvertible {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    var next: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
    
    var description: String {
        return String(self.val)
    }
}


class BinaryTree {
    func subTree(root: TreeNode?, subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        if root == nil { return false }
        if isIdentical(first: root, second: subRoot) { return true }
        return subTree(root: root?.left, subRoot: subRoot) ||
                subTree(root: root?.right, subRoot: subRoot)
    }

    private func isIdentical(first: TreeNode?, second: TreeNode?) -> Bool {
        if first == nil, second == nil { return true }
        if first == nil || second == nil { return false }
        
        if first?.val == second?.val,
            isIdentical(first: first?.left, second: second?.left),
            isIdentical(first: first?.right, second: second?.right) {
            return true
        }
        return false
    }
}
