//
// Construct Binary tree given inorder and postorder traversal.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/31/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 
 Construct Binary tree given inorder and postorder traversal

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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0,
            inorder.count == postorder.count else {
                return nil
        }
        
        return buildTree(postorder: postorder, inorder: inorder, pstart: 0, pEnd: postorder.count - 1, iStart: 0, iEnd: inorder.count - 1)
        
    }
    
    private func buildTree(postorder: [Int], inorder: [Int], pstart: Int, pEnd: Int, iStart: Int, iEnd: Int) -> TreeNode? {
        if iStart > iEnd || pstart > pEnd { return nil }
        
        let mid = searchInInorder(inorder: inorder, value: postorder[pEnd], iStart: iStart, iEnd: iEnd)
        
        let root = TreeNode(val: postorder[pEnd])
        root.left = buildTree(postorder: postorder, inorder: inorder, pstart: pstart, pEnd: pstart + mid - iStart - 1, iStart: iStart, iEnd: mid - 1)
        root.right = buildTree(postorder: postorder, inorder: inorder, pstart: pstart + mid - iStart, pEnd: pEnd - 1, iStart: mid + 1, iEnd: iEnd)
        return root
    }
    
    
    private func searchInInorder(inorder: [Int], value: Int, iStart: Int, iEnd: Int) -> Int {
        var mid = 0
        for i in iStart...iEnd {
            if inorder[i] ==  value {
                mid = i
                break
            }
        }
        return mid
    }
}
