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

    func printCornerNodes(node: TreeNode?) -> [Int] {
        if node == nil { return [] }
        var queue: [TreeNode?] = []
        var result: [Int] = []
        queue.append(node)
        
        while !queue.isEmpty {
            
            var count = queue.count - 1
            if count == 0 { result.append(queue[0]!.val) } else {
                result.append(queue[0]!.val)
                result.append(queue[count]!.val)
            }
            while count >= 0 {
                if let root = queue.removeFirst() {
                    if let left = root.left { queue.append(left)}
                    if let right = root.right { queue.append(right)}
                }
                count -= 1
            }
        }
        
        return result
    }
}
