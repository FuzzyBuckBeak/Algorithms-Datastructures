//
// CheckifGivenTwoBinaryTreesAreIdentical.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/17/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given two binary Tree. Check if identical
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
    func isIdentical(first: TreeNode?, second: TreeNode?) -> Bool {
        if first == nil, second == nil { return true }
        if first == nil || second == nil { return false }
        
        if first?.value == second?.value,
           isIdentical(first: first?.leftChild, second: second?.leftChild),
            isIdentical(first: first?.rightChild, second: second?.rightChild) {
            return true
        }
        return false
    }
}
