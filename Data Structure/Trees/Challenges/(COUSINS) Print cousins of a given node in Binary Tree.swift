//
// Print cousins of a given node in Binary Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

Input : root of below tree
             1
           /   \
          2     3
        /   \  /  \
       4    5  6   7
       and pointer to a node say 5.

Output : 6, 7

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

    func printCousin(root: TreeNode?, node: TreeNode) -> String {
        guard root != nil else { return "No Cousins"}
        var queue: [TreeNode?] = []
        queue.append(root)
        
        while !queue.isEmpty {
            var count = queue.count - 1
            while count >= 0 {
                count -= 1
                if let tempNode = queue.removeFirst() {
                    if tempNode === node {
                        var result: [String] = []
                        for treeNode in queue {
                            result.append(treeNode?.val != nil ? String(treeNode!.val): "nil")
                        }
                        return result.count >= 1 ? result.joined(separator: " ,") : "No Cousins"
                    }
                    if let leftChild = tempNode.left {
                        queue.append(leftChild)
                        if leftChild === node { continue }
                    }
                    if let rightChild = tempNode.right {  queue.append(rightChild) }
                }
            }
        }
        return "No Cousins"
    }
}
