//
// Find the boundary order traversal of a binary tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Find the boundary order traversal of a binary tree
 
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
    func boundaryOrderTraversal(node: TreeNode?) -> [Int] {
        var result: [Int] = []
        leftNodeNoLeaf(root: node, result: &result)
        leafNodes(root: node, result: &result)
        rightNodesNoLeaf(root: node?.right, result: &result)
        return result
    }

    func leafNodes(root: TreeNode?, result: inout [Int] ) {
        if root == nil { return }
        if root?.left == nil, root?.right == nil { result.append(root!.val); return }
        leafNodes(root: root?.left, result: &result)
        leafNodes(root: root?.right, result: &result)
    }

    func leftNodeNoLeaf(root: TreeNode?, result: inout [Int] ) {
         if root == nil || root?.left == nil, root?.right == nil { return }
         result.append(root!.val)
        leftNodeNoLeaf(root: root?.left, result: &result)
    }

    func rightNodesNoLeaf(root: TreeNode?, result: inout [Int]) {
        if root == nil || root?.left == nil, root?.right == nil { return }
        rightNodesNoLeaf(root: root?.right, result: &result)
        result.append(root!.val)
    }
}
