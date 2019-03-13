//
// Diagonal Order Traversal of a Binary Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Diagonal Order Traversal of a Binary Tree
 
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
    func diagonalOrderTraversal(root: TreeNode?) -> [[Int]] {
        var hash: [Int: [Int]] = [:]
        var queue: [(node: TreeNode?, column: Int)] = []
        
        queue.append((node: root, column: 0))
        
        while !queue.isEmpty {
            let value = queue.removeFirst()
            if let root = value.node {
                if let left = root.left { queue.append((node: left, column: value.column + 1 ))}
                if let right = root.right { queue.append((node: right, column: value.column ))}
                
                if var isInHash = hash[value.column] {
                    isInHash.append(root.val)
                    hash[value.column] = isInHash
                } else {
                    hash[value.column] = [root.val]
                }
            }
        }
        
        var result: [[Int]] = []
        
        for key in hash.keys.sorted() {
            if let value = hash[key] {
                result.append(value)
            }
        }
        
        return result
    }
}
