//
// Convert Sorted List to Binary Search Tree
// DataStructures
//
// Created by: FuzzyBuckBeak on 1/26/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted linked list: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5
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
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil  { return nil }
        var nums : [Int] = []
        
        var node = head
        while node != nil {
            nums.append(node!.val)
            node = node?.next
        }
        
        return arrayToBST(nums: nums, left: 0, right: nums.count - 1)
        
    }
    
    private func arrayToBST(nums: [Int], left: Int, right: Int) -> TreeNode? {
        if left > right { return nil }
        
        if left == right { return TreeNode(val: nums[left]) }
        else {
            let mid = (left + right) / 2
            let node = TreeNode(val: nums[mid])
            node.left = arrayToBST(nums: nums, left: left, right: mid - 1)
            node.right = arrayToBST(nums: nums, left: mid + 1, right: right)
            return node
        }
    }
    
    //Linked List way
    func sortedListToBSTLinked(_ head: ListNode?) -> TreeNode? {
        if head == nil  { return nil }
        if head?.next == nil { return TreeNode(val: head!.val)}
        
        var root: TreeNode? = nil
        
        var middleNode: ListNode? = nil
        if let node = findMiddle(head: head) {
            middleNode = node
            root = TreeNode(val: node.val)
        }
        
        var p = head
        while (p?.next !== middleNode) {
            p = p?.next
        }
        
        p?.next = nil
        let q = middleNode?.next
        root?.left = sortedListToBST(head)
        root?.right = sortedListToBST(q)
        
        return root
    }
    
    private func findMiddle(head: ListNode?) -> ListNode? {
        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head
        
        while slowPointer?.next != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        return slowPointer
    }
}
