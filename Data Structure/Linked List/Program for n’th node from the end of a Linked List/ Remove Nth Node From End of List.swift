//
//  Remove Nth Node From End of List.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/30/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 Given a linked list, remove the n-th node from the end of list and return its head.
 
 Example:
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
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


class LinkedList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let head = head
        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head
        
        var count = 0
        while count < n {
            fastPointer = fastPointer?.next
            count += 1
        }
        
        var previousPointer: ListNode? = nil
        while fastPointer != nil {
            fastPointer = fastPointer?.next
            previousPointer = slowPointer
            slowPointer = slowPointer?.next
        }
        
        if slowPointer === head { return slowPointer?.next }
        
        previousPointer?.next = slowPointer?.next
        slowPointer?.next = nil
        return head
    }
}
