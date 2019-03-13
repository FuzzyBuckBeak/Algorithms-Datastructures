//
// Convert a given Binary Tree to Doubly Linked List.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 Convert a given Binary Tree to Doubly Linked List.
 
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
    var head: TreeNode? = nil
    
    func convertToDLL(node: TreeNode?) -> TreeNode? {
        
        var prev: TreeNode? = nil
        bstToDll(node: node, prev: &prev)
        return head
    }
    
    private func bstToDll(node: TreeNode?, prev: inout TreeNode?) {
        if node == nil { return }
        bstToDll(node: node?.left, prev: &prev)
        
        if prev == nil {
            head = node
        } else {
            prev?.right = node
            node?.left = prev
        }
        prev = node
        bstToDll(node: node?.right, prev: &prev)
    }
}
