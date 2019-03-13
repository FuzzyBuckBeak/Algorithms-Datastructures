//
// Given Binary Tree print top view
// DataStructures
//
// Created by: FuzzyBuckBeak on 2/1/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
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
    func printTopViewOfBinaryTree(node: TreeNode?) {
        var hash: [Int: [Int]] = [:]
        
        var queue: [(node: TreeNode?, column: Int)] = []
        queue.append((node, 0))
       
        while !queue.isEmpty {
            var count = queue.count - 1
            while count >= 0 {
                let value = queue.removeFirst()
                if let treeNode = value.node {
                    
                    if var inHash = hash[value.column] {
                        inHash.append(treeNode.val)
                        hash[value.column] = inHash
                    } else {
                        hash[value.column] = [treeNode.val]
                    }
                    if let left = treeNode.left { queue.append((node: left, column: value.column - 1))}
                    if let right = treeNode.right { queue.append((node: right, column: value.column + 1))}
                }
                
                count -= 1
            }
        }
        
        for (_, value) in hash {
            print(value.count > 0 ? value[0] : "NA")
        }
    }

   
}
