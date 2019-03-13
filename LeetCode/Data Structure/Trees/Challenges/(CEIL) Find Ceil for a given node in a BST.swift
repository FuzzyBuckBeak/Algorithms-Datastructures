//
// Find Ceil for a given node in a BST
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Find Ceil for a given node in a BST
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

    func ceil(root: TreeNode?, data: Int) -> TreeNode? {
        var ceil: TreeNode? = nil
        findCeil(node: root, ceil: &ceil, data: data)
        return ceil
    }
    
    private func findCeil(node: TreeNode?, ceil: inout TreeNode?, data: Int) {
        if node == nil { return }
        if node!.val == data { ceil = ceil == nil ?  node : ceil}
        
        if node!.val < data {
            findCeil(node: node?.right, ceil: &ceil, data: data)
        } else {
            ceil = node
            findCeil(node: node?.left, ceil: &ceil, data: data)
        }
    }
}
