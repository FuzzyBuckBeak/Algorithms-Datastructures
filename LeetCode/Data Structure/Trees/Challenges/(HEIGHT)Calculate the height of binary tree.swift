//
// Calculate the height of binary tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/17/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
Calculate the height of binar tree
*****************************************************************************************************************************/

import Foundation

class TreeNode: CustomStringConvertible {
    var value: Int
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(value: Int) {
        self.value = value
    }
    
    var description: String {
        return String(self.value)
    }
}

class BinaryTree {
    func calculateHeightOfTree(root: TreeNode?) -> Int {
        if root == nil { return -1 }   // If there is no node then the height is -1; If there is only one node height is 0
        return 1 + max(calculateHeightOfTree(root: root?.leftChild), calculateHeightOfTree(root: root?.rightChild))
    }
    
    func calculateHeightOfTreeWithOutRecursion(root: TreeNode?) -> Int {
        guard root != nil  else { return -1 }
        var queue: [TreeNode?] = []
        queue.append(root)
        
        var height: Int = -1
        while !queue.isEmpty {
            var size = queue.count - 1
            while count >= 0 {
                if let node = queue.removeFirst() {
                    if  let leftChild = node.leftChild { queue.append(leftChild) }
                    if let rightChild = node.rightChild { queue.append(rightChild) }
                    count -= 1
                }
            }
            height += 1
        }
        
        return height
    }
}
