//
//  SerializeBinaryTreeToArray.swift
//  CodingChallenge
//
//  Created by Apo on 5/3/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

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
    func serialize(root: TreeNode) -> [Int?] {
        var arr: [Int?] = []
        preorder(node: root, result: &arr)
        return arr
    }
    
    private func preorder(node: TreeNode?, result: inout [Int?]) {
        result.append(node?.val)
        guard let node = node else { return }
        preorder(node: node.left, result: &result)
        preorder(node: node.right, result: &result)
    }
    
    func deserialize(array: [Int]) -> TreeNode? {
        var arr: [Int?] = array
        return privateDeserialize(array: &arr)
    }
    
    private func privateDeserialize(array: inout [Int?]) -> TreeNode? {
        guard let value = array.removeFirst() else { return nil }
        let root = TreeNode(val: value)
        root.left = privateDeserialize(array: &array)
        root.right = privateDeserialize(array: &array)
        return root
    }
}
