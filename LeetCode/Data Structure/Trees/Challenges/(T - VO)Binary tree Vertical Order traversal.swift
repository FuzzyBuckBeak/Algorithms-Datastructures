//
// Binary tree Vertical Order traversal.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/24/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************

    Give an aglorithm for finding the vertical order of a binary Tree

      3
     / \
    9  20
  /  \
 15   7
 
 Vertical Order - 15 -> 9 -> 3 -> 7 -> 20
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
    func verticalOrderTraversal(node: TreeNode?) -> String {
        var result: [String] = []
        var queue: [(node: TreeNode?, column: Int)] = []
        var hash: [Int: [Int]] = [:]
        
        queue.append((node: node, column: 0))
        while !queue.isEmpty {
            let value = queue.removeFirst()
            if let root = value.node {
                if let left = root.left { queue.append((node: left, column: value.column - 1)) }
                if let right = root.right { queue.append((node: right, column: value.column + 1))}
                
                if var isInHash = hash[value.column] {
                    isInHash.append(root.val)
                    hash[value.column] = isInHash
                } else {
                    hash[value.column] = [root.val]
                }
            }
        }
        
        for key in hash.keys.sorted() {
            if let value = hash[key] {
                result.append(contentsOf: value.map {String($0)})
            }
        }
        
        return result.joined(separator: "->")
    }
}
