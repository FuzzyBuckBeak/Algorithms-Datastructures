////
//// Implement postorder traversal without recursion.swift
//// DataStructures
////
//// Created by: FuzzyBuckBeak on 1/26/19
//// Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//
//
//
///*****************************************************************************************************************************
//IMPLEMENT A POSTORDER TRAVERSAL WITHOUT RECURSION
//*****************************************************************************************************************************/
//
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
    func postOrderTraversal(root: TreeNode?) -> String {
        var stack: [TreeNode?] = []
        var resultStack: [String] = []
        stack.append(root)
        while !stack.isEmpty {
            if let node = stack.removeLast() {
                resultStack.insert(String(node.val), at: 0)
                if let left = node.left { stack.append(left) }
                if let right = node.right { stack.append(right) }
            }
        }
        
        return resultStack.joined(separator: "->")
    }
}
