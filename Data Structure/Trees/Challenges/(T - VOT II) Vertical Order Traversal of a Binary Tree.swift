//
// Given a binary tree, return the vertical order traversal of its nodes values.
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 Given a binary tree, return the vertical order traversal of its nodes values.
 
 If two nodes have the same position, then the value of the node that is reported first is the value that is smaller.
 
 Input: [3,9,20,null,null,15,7]
 Output: [[9],[3,15],[20],[7]]
 Explanation:
 Without loss of generality, we can assume the root node is at position (0, 0):
 Then, the node with value 9 occurs at position (-1, -1);
 The nodes with values 3 and 15 occur at positions (0, 0) and (0, -2);
 The node with value 20 occurs at position (1, -1);
 The node with value 7 occurs at position (2, -2).
 
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
   func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        var queue: [(node: TreeNode?, column: Int)] = []
        var hash: [Int: [Int]] = [:]
        
        queue.append((node: root, column: 0))
        while !queue.isEmpty {
            var count = queue.count - 1
            var temp: [Int: [Int]] = [:]
            while count >= 0 {
                let value = queue.removeFirst()
                if let root = value.node {
                    if let left = root.left { queue.append((node: left, column: value.column - 1)) }
                    if let right = root.right { queue.append((node: right, column: value.column + 1))}
                    
                    if var isInHash = temp[value.column] {
                        isInHash.append(root.val)
                        temp[value.column] = isInHash
                    } else {
                        temp[value.column] = [root.val]
                    }
                    
                }
                count -= 1
            }
            if !temp.isEmpty {
                for (key, value) in temp {
                    if var isInHash = hash[key] {
                        isInHash.append(contentsOf: value.sorted())
                        hash[key] = isInHash
                    } else {
                        hash[key] = value.sorted()
                    }
                }
            }
        }
        
        for key in hash.keys.sorted() {
            if let value = hash[key] {
                result.append(value)
            }
        }
    
        return result
    }
}
