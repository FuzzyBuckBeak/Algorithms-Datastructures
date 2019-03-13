//
// Vertical Order Traversal of a Binary Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Find the Vertical sum of given binary tree
 
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
    func returnVerticalSum(node: TreeNode?) -> [Int] {
        var hashMap: [Int: Int] = [:]
        verticalOrderTraversal(node: node, hash: &hashMap, column: 0)
        let sortedHashMap = hashMap.sorted { $0.key < $1.key }
        
        var result: [Int] = []
        for (_, value) in sortedHashMap {
           result.append(value)
        }
        
        return result
    }
    
    private func verticalOrderTraversal(node: TreeNode?, hash: inout [Int: Int], column: Int) {
        guard node != nil else { return }
        verticalOrderTraversal(node: node?.left, hash: &hash, column: column - 1)
        if var value = hash[column] {
            value += node!.val
            hash[column] = value
        } else {
            hash[column] = node!.val
        }
        verticalOrderTraversal(node: node?.right, hash: &hash, column: column + 1)
    }
}
