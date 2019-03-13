//
// Find maximum level sum in Binary Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/17/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
Find maximum level sum in Binary Tree
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
    func maximumLevelSum(root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let queue = Queue<TreeNode>()
        queue.enqueElements(root)
        
        var result: Int = 0
        while !queue.isEmpty() {
            var count = queue.size()
           
                var sum: Int = 0
                while count >= 0 {
                    if let node = queue.dequeueElement() {
                        count -= 1
                        sum = sum + node.value
                    
                        if let leftchild = node.leftChild { queue.enqueElements(leftchild) }
                        if let rightChild = node.rightChild { queue.enqueElements(rightChild) }
                    }
                }
                result = max(result, sum)
        }
        return result
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
