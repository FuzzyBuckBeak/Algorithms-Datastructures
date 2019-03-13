//
// Sum of Left Leaves.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/17/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Sum of Left Leaves.swift
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
       return sumOfLeaves(root: root, isLeft: false)
    }
    
    func sumOfLeaves(root: TreeNode?, isLeft: Bool) -> Int {
        if root == nil { return 0 }
        if root?.leftChild == nil, root?.rightChild == nil, isLeft { return root?.value ?? 0 }
        return sumOfLeaves(root: root?.leftChild, isLeft: true) + sumOfLeaves(root: root?.rightChild, isLeft: false)
    }
}
