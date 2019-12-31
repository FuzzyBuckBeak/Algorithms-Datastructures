//
// Return all ancestors of given node.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/23/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given an algorithm Return all ancestors of given node
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
    func returnAncestors(node: TreeNode?, target: Int) -> [Int] {
        var result: [Int] = []
        returnAllancestors(node: node, result: &result, target: target)
        return result
    }

    @discardableResult
    private func returnAllancestors(node: TreeNode?, result: inout [Int], target: Int) -> Bool {
        if node == nil { return false }
        if node?.val == target { return true }
        if returnAllancestors(node: node?.left, result: &result, target: target) ||
           returnAllancestors(node: node?.right, result: &result, target: target) {
                result.append(node!.val)
                return true
        }
        return false
    }
}

//Easier and better than previous version
class Tree {
    func printAncestors(root: TreeNode?, target: Int, path: String = "") {
        if root == nil { return }
        if root?.value == target { print(path)}
        printAncestors(root: root?.left, target: target, path: _path(path, String(root!.value)))
        printAncestors(root: root?.right, target: target, path: _path(path, String(root!.value)))
    }
    
    private func _path(_ originalPath: String, _ additionalPath: String) -> String {
        return originalPath.isEmpty ? additionalPath : originalPath + "->" + additionalPath
    }   
}
