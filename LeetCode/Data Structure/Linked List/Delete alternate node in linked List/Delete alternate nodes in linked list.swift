//
// Delete alternate nodes in linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/30/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 Delete alternate nodes of a Linked List
 
 Given a Singly Linked List, starting from the second node delete all alternate nodes of it. For example, if the given linked list is 1->2->3->4->5 then your function should convert it to 1->3->5, and if the given linked list is 1->2->3->4 then convert it to 1->3.
*****************************************************************************************************************************/

import Foundation

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
    
    func deleteAlternate(head: ListNode?) -> ListNode? {
       var currentNode = head
        
        while currentNode != nil {
            let nextPointer = currentNode?.next?.next
            currentNode?.next = nextPointer
            currentNode = nextPointer
        }
        
        return head
    }


}
