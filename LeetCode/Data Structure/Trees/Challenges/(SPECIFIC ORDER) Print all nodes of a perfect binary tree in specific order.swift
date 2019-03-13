//
// Print all nodes of a perfect binary tree in specific order
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Print in specific order
              18
           /       \
         15         30
        /  \        /  \
      40    50    100   40
 
 print: 18, 15, 30, 40, 40, 50, 100
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

    func printInSpecificOrder(node: TreeNode?) {
        if node == nil { return }
        var leftQueue: [TreeNode?] = []
        var rightQueue: [TreeNode?] = []
        
        leftQueue.append(node?.left)
        rightQueue.append(node?.right)
        
        while !leftQueue.isEmpty {
            
            var count = leftQueue.count - 1
            while count >= 0 {
                if let root = leftQueue.removeFirst() {
                    print(root.val)
                    if let left = root.left { leftQueue.append(left)}
                    if let right = root.right { leftQueue.append(right)}
                }
                
                
                if let root = rightQueue.removeFirst() {
                    print(root.val)
                    if let right = root.right { rightQueue.append(right)}
                    if let left = root.left { rightQueue.append(left)}
                }
                count -= 1
            }
        }
    }
}
