//
// check if a given binary Tree is a SumTree or not
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Check if a given binary Tree is a SumTree or not
 
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
    func isSumTree(node: TreeNode?) -> Bool {
        if node == nil { return true }
        return isSum(node: node).0
    }
    
    
    private func isSum(node: TreeNode?) -> (Bool, Int) {
        if node == nil { return (true, 0) }
        if node?.left == nil, node?.right == nil { return (true, node!.val) }
        let left = isSum(node: node?.left)
        if left.0 == false { return (false, node!.val)}
        let right = isSum(node: node?.right)
        
        if left.0, right.0, left.1 + right.1 == node!.val { return (true, left.1 + right.1 + node!.val) }
        return (false, node!.val)
    }
}
