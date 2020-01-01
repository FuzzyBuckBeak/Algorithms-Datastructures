//
// Given Binary Tree print top-bottom view
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
    func printBottomViewOfBinaryTree(node: TreeNode?) {
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
            print(value.count > 0 ? value[value.count - 1] : "NA")
        }
    }

    //Easier solution
    func verticalOrderTraversal(root: TreeNode) {
        var hash: [Int: [Int]] = [:]
        private_vot(root: root, count: 0, hash: &hash)
        
        for key in hash.keys.sorted(by: <) {
            let value = hash[key]!
            print(value[value.count - 1])
        }
    }
    
    //handler
    func private_vot(root: TreeNode?, count: Int, hash : inout [Int: [Int]]) {
        if root == nil { return }
       
        if let _ = hash[count] {
            hash[count]!.append(root!.value)
        } else {
            hash[count] = [root!.value]
        }
        private_vot(root: root?.left, count: count - 1, hash: &hash)
        private_vot(root: root?.right, count: count + 1, hash: &hash)
    }
   
}
