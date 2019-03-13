//
// Print the right view of binary tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/17/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
Print the left view of Binary tree.swift
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
    func printRightViewOfBinaryTree(node: TreeNode?) {
        guard let node = node else { return }
        var queue:[TreeNode?] = []
        
        
        queue.append(node)
        while !queue.isEmpty {
            
            var count = queue.count - 1
            print(queue[count]!.val)
            while count >= 0 {
                if let node = queue.removeFirst() {
                    if let leftChild = node.left { queue.append(leftChild) }
                    if let rightChild = node.right  { queue.append(rightChild) }
                }
                count -= 1
            }
        }
    }
}

class Queue<T: CustomStringConvertible>: CustomStringConvertible {
    fileprivate var array: [T] = []
    
    var description: String {
        return self.array.map{ $0.description}.joined(separator: " ")
    }
    
    func enqueElements(_ element: T) {
        self.array.append(element)
    }
    
    func dequeueElement() -> T? {
        return self.array.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return self.array.count == 0
    }
    
    func size() -> Int {
        return self.array.count - 1
    }
}
