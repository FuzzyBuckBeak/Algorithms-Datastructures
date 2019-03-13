//
// Given a tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given a tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.

Example 1:
Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]

       5
      / \
    3    6
   / \    \
  2   4    8
 /        / \
1        7   9

Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
            \
             7
              \
               8
                \
                 9
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var inorder: [Int] = []
        inorderTraversal(root: root, result: &inorder)
        
        let root: TreeNode? = TreeNode(val: 0)
        var current: TreeNode? = root
       
        for element in inorder {
            current?.right = TreeNode(val: element)
            current = current?.right
        }
        
        return root?.right
    }
    
    private func inorderTraversal(root: TreeNode?, result: inout [Int]) {
        if root == nil { return }
        inorderTraversal(root: root?.left, result: &result)
        result.append(root!.val)
        inorderTraversal(root: root?.right, result: &result)
    }
}
