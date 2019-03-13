//
// Give an algorithm for finding the shortest path between two nodes.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Give an algorithm for finding the shortest path between two nodes
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
    func shortestPathBetween(p: TreeNode?, q: TreeNode?, root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return distanceBetweenNodes(p:p, q:q, root: root)
    }
    
    private func distanceBetween(node: TreeNode?, root: TreeNode?) -> Int {
        if node == nil || node === root { return 0 }
        if node!.val < root!.val {
            return 1 + distanceBetween(node: node, root: root?.left)
        } else {
            return 1 + distanceBetween(node: node, root: root?.right)
        }
    }
  
    @discardableResult
    func distanceBetweenNodes(p: TreeNode?, q: TreeNode?, root: TreeNode?) -> Int {
        if p!.val < root!.val && q!.val < root!.val {
          distanceBetweenNodes(p: p, q: q, root: root?.left)
        } else if p!.val > root!.val && q!.val > root!.val {
            distanceBetweenNodes(p: p, q: q, root: root?.left)
        } else {
            return distanceBetween(node: p, root: root) + distanceBetween(node: q, root: root)
        }
        return 0
    }
}
