//
// 61. Rotate List.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/29/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 Given a linked list, rotate the list to the right by k places, where k is non-negative.
 
 Example 1:
 
 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULLs
*****************************************************************************************************************************/

import Foundation

//Node Class
class ListNode {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}

//Linked List Class
class LinkedList {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        guard head?.next != nil else { return head }

        var fastPointer: ListNode? = head
        var slowPointer: ListNode? = head
        var lengthOfList = 0
        
        while fastPointer != nil {
            lengthOfList += 1
            fastPointer = fastPointer?.next
        }
        
        fastPointer = head
        let localK = k % lengthOfList
        for _ in 0 ..< localK {
            fastPointer = fastPointer?.next
        }
        
        while fastPointer?.next != nil {
            fastPointer = fastPointer?.next
            slowPointer = slowPointer?.next
        }
        
        fastPointer?.next = head
        let newHead = slowPointer?.next
        slowPointer?.next = nil
        return newHead
    }
}
