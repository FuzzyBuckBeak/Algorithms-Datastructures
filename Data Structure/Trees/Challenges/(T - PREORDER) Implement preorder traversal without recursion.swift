//
// Implement preorder traversal without recursion.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
IMPLEMENT A PREORDER TRAVERSAL WITHOUT RECURSION
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
    func preOrderTraversal(node: TreeNode?) -> String {
        var stack: [TreeNode?] = []
        var currentNode: TreeNode? = node
        var result: [String] = []
        
        while !stack.isEmpty  || currentNode != nil {
            if currentNode != nil {
                result.append(String(currentNode!.val))
                stack.append(currentNode)
                currentNode = currentNode?.left
            } else {
                if let node = stack.removeLast() {
                    currentNode = node
                    currentNode = currentNode?.right
                }
            }
        }
        
        return result.joined(separator: "->")
    }
}
