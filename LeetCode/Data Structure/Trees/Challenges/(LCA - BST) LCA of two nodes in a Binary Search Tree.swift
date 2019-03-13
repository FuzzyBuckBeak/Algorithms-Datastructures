//
// LCA of two nodes in a Binary Search Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
LCA of two nodes in a Binary Search Tree
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
    func lowestCommonAncestor(root: TreeNode?, p: TreeNode, q:TreeNode) -> TreeNode? {
        if root == nil { return nil }
        if p.val > root!.val && q.val < root!.val ||
            p.val < root!.val && q.val > root!.val { return root }
        if p.val < root!.val && q.val < root!.val {
            return lowestCommonAncestor(root: root!.left, p: p, q: q)
        } else {
            return lowestCommonAncestor(root: root!.right, p: p, q: q)
        }
    }
}
