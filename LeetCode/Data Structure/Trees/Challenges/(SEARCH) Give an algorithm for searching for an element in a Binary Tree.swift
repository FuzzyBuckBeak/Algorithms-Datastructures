//
// Give an algorithm for searching for an element in a Binary Tree.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/29/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Give an algorithm for searching for an element in a Binary Tree

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
    func searchElement(root: TreeNode?, element: Int) -> Bool {
        if root == nil { return false }
        if root!.val == element { return true }
        return searchElement(root: root?.left, element: element) ||
        searchElement(root: root?.right, element: element)
    }
}
