//
// 83. Remove Duplicates from Sorted List.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/30/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************

 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 
 Input: 1->1->2
 Output: 1->2
 Example 2:
 
 Input: 1->1->2->3->3
 Output: 1->2->3

*****************************************************************************************************************************/

import Foundation
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

//Linked List Class
class LinkedList {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var currentPointer = head?.next
        var previousPointer: ListNode? = head
        var value: Int? = head?.val
        
        while currentPointer != nil {
            let nextPointer = currentPointer?.next
            if currentPointer?.val == value {
                previousPointer?.next = nextPointer
                currentPointer?.next = nil
            } else {
                value = currentPointer?.val
                previousPointer = currentPointer
            }
            currentPointer = nextPointer
        }
        
        return head
    }
}
