//
// Give an algorithm for finding all full nodes in binary tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Give an algorithm for finding all full nodes in binary tree

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
func returnFullNodes(root: TreeNode?) -> [TreeNode] {
    if root == nil { return [] }
    var queue: [TreeNode?] = []
    queue.append(root)
    var leafNode: [TreeNode] = []
    
    while !queue.isEmpty {
        if let node = queue.removeFirst() {
            if node.left != nil && node.right != nil { leafNode.append(node) }
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
    }

    return leafNode
}
}
