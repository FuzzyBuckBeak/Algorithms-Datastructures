//
// Binary Search Tree (BST).swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/6/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
Implement a binary search tree as a data structure.
 - insertion
 - deletion
 - searching
 
 - Depth First traversal
    - Inorder traversal
    - preorder traversal
    - postorder traversal
 
 - Breadth First traversal
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
    //DFS
    func inorderTraversal(head: TreeNode?) {
        if head == nil { return }
        inorderTraversal(head: head?.leftChild)
        print(head?.value ?? "Empty tree")
        inorderTraversal(head: head?.rightChild)
    }

    func preOrderTraversal(head: TreeNode?) {
        if head == nil { return }
        print(head?.value ?? "Empty tree")
        preOrderTraversal(head: head?.leftChild)
        preOrderTraversal(head: head?.rightChild)
    }

    func postOrderTraversal(head: TreeNode?) {
        if head == nil { return }
        postOrderTraversal(head: head?.leftChild)
        postOrderTraversal(head: head?.rightChild)
        print(head?.value ?? "Empty tree")
    }

    //Breadth first traversal - BFT (BFS) - level order traversal
    func levelOrder(head:  TreeNode?) {
        guard let node = head else { return }
        
        let queue = Queue<TreeNode>() //Implement Queue Datastructure
        queue.enqueue(item: node)
        while !queue.isEmpty {
            guard let dequeueNode = queue.dequeue() else { break }
            
            if let leftNode = dequeueNode.leftChild {
                queue.enqueue(item: leftNode)
            }
            
            if let rightNode = dequeueNode.rightChild {
                queue.enqueue(item: rightNode)
            }
        }
    }

    
    func insertNode(head: TreeNode?, value: Int) -> TreeNode? {
        guard let node = head else { return TreeNode(value: value) }

        if value < node.value {
            node.leftChild = insertNode(head: node.leftChild, value: value)
        } else {
             node.rightChild  = insertNode(head: node.rightChild, value: value)
        }

        return head
    }

    func deleteNode(head: TreeNode, value: Int) {

    }

    func search(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else { return nil }
        if val == node.value { return node }
        if val < node.value {
            return search(node.leftChild, val)
        } else {
            return search(node.rightChild, val)
        }
    }
}

class Queue<T: CustomStringConvertible>: CustomStringConvertible {
    
    fileprivate var array: [T] = []
    
    func dequeue() -> T? {
        let dequeueItem = self.array.removeFirst()
        return dequeueItem
    }
    
    func enqueue(item: T) {
        array.append(item)
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    var count: Int {
        return self.array.count
    }
    
    var description: String {
        let elements = self.array.map { $0.description }.joined(separator: " ")
        return elements
    }
}
