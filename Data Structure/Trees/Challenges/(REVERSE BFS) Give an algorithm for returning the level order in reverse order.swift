//
// Give an algorithm for returning the level order data in reverse order
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Give an algorithm for printing the level order data in reverse order

 Note: This is Binary Tree not a BST

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
    func reverseLevelOrder(root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var queue: [TreeNode?] = []
        queue.append(root)
        
        let resultStack: Stack<Int> = Stack()
        
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                resultStack.push(node.val)
                if let right = node.right { queue.append(right) }
                if let left = node.left { queue.append(left) }
            }
        }

        var result: [Int] = []
        while !resultStack.isEmpty() { result.append(resultStack.pop()) }

        return result
    }
}


class Stack<T> {
    var array: [T] = []
    func peek() -> T? { return array.last }
    func pop() -> T { return array.removeLast() }
    func push(_ value: T) { array.append(value) }
    func isEmpty() -> Bool { return array.isEmpty  }
}
