//
// Convert a given tree to its Sum Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Convert a given tree to its Sum Tree
 
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
    func convertToSumTree(root: TreeNode?) {
        convertToCheckSum(node: root)
    }
    
    @discardableResult
    private func convertToCheckSum(node: TreeNode?) -> Int {
        if node == nil { return 0 }
        let oldValue = node!.val
        node?.val =  convertToCheckSum(node: node?.left) + convertToCheckSum(node: node?.right)
        return oldValue + node!.val
    }
}
