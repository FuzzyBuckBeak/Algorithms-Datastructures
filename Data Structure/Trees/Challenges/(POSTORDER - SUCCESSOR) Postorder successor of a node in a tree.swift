//
// Postorder successor of a node in a tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/27/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Postorder successor of a node in a tree
*****************************************************************************************************************************/

import Foundation

class TreeNode: CustomStringConvertible {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
    
    var description: String {
        return String(self.val)
    }
}



class BinaryTree {
    //Given a parent Pointer
    func postOrderSuccessor(node: TreeNode?, root: TreeNode?) -> Int? {
        if root == nil,
            node == nil { return nil }
        
        if node?.parent?.left === node {
            return findLeafLeftInRight(node: node?.parent?.right)?.val
        } else {
            return node?.parent?.val
        }
    }
    
    private func findLeafLeftInRight(node: TreeNode?) -> TreeNode? {
        var node = node
        while node?.left != nil {
            node = node?.left
        }
        
        return node
    }
}
