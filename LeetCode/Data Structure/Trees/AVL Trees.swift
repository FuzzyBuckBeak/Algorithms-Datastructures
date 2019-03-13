//
// AVL Trees.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 2/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************


*****************************************************************************************************************************/

import Foundation
class AVLNode <T: Equatable> {
    var value: T
    var height: Int = 0
    var leftChild: AVLNode?
    var rightChild: AVLNode?
    
    var balanceFactor: Int { return leftHeight - rightHeight }
    var leftHeight: Int { return  leftChild?.height ?? -1 }
    var rightHeight: Int { return rightChild?.height ?? -1 }
    
    init(_ val: T) {
        self.value = val
    }
}

class AVLTree<T: Comparable> {
    var root: AVLNode<T>?
    
    private func BalanceFactor(node: AVLNode<T>) -> AVLNode<T> {
        switch(node.balanceFactor) {
        case -2:  if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                    return rotateRightLeft(node: node)
                  } else {
                    return rotateLeft(node: node)
                  }
        case 2: if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                    return rotateLeftRight(node: node)
                } else {
                    return rotateRight(node: node)
                }
        default: return node
        }
    }
    
    
    private func rotateLeft(node: AVLNode<T>) -> AVLNode<T> {
        let pivot = node.rightChild!
        node.rightChild = pivot.leftChild
        pivot.leftChild = node
        
        node.height = max(node.rightHeight, node.leftHeight) + 1
        pivot.height = max(pivot.rightHeight, pivot.leftHeight) + 1
        return pivot
    }
    
    private func rotateRight(node: AVLNode<T>) -> AVLNode<T> {
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        
        node.height = max(node.rightHeight, node.leftHeight) + 1
        pivot.height = max(pivot.rightHeight, pivot.leftHeight) + 1
        return pivot
    }
    
    private func rotateLeftRight(node: AVLNode<T>) -> AVLNode<T> {
        guard let leftChild = node.leftChild else { return node }
        node.leftChild = rotateLeft(node: leftChild)
        return rotateRight(node: node)
    }
    
    private func rotateRightLeft(node: AVLNode<T>) -> AVLNode<T> {
        guard let rightChild = node.rightChild else { return node }
        node.rightChild = rotateRight(node: rightChild)
        return rotateLeft(node: node)
    }
    
    
    func insert(_ val: T) {
        root = insert(val: val, root: root)
    }
    
    private func insert(val: T, root: AVLNode<T>?) -> AVLNode<T> {
        guard let root = root else { return AVLNode(val) }
        if val < root.value {
            root.leftChild = insert(val: val, root: root.leftChild)
        } else {
            root.rightChild = insert(val: val, root: root.rightChild)
        }
        
        let balancedNode = BalanceFactor(node: root)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
}
