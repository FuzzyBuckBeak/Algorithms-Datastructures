//
// Give an algorithm for deepest node of the binary Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Give an algorithm for deepest node of the binary Tree

 Note: This is Binary Tree not a BST

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
    func deepestNodeInBinaryTree(root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        var queue: [TreeNode?] = []
        queue.append(root)
        
        var deepestNode: TreeNode? = nil
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                deepestNode = node
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }

        return deepestNode
    }
}
