//
// Trim a Binary Search Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given a binary search tree and the lowest and highest boundaries as L and R, trim the tree so that all its elements lies in [L, R] (R >= L). You might need to change the root of the tree, so the result should return the new root of the trimmed binary search tree.

Example 1:

Input:
    1
   / \
  0   2

  L = 1
  R = 2

Output:
    1
      \
       2
*****************************************************************************************************************************/

import Foundation

public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        if root == nil { return nil }
        var left: TreeNode? = nil
        var right: TreeNode? = nil
        
        if root!.val >= L {
            left = trimBST(root?.left, L, R)
            root?.left = left
        }
        
        if root!.val <= R {
            right = trimBST(root?.right, L, R)
            root?.right = right
        }
        
        //if root is violating the condition return the resultant of the root
        if root!.val < L || root!.val > R { return left != nil ? left : right }
        
        //if root is not voilating the condtion return the root
        return root
    }
}
