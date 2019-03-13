//
// Delete N nodes after M nodes of a linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/30/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.
/*****************************************************************************************************************************

 Delete N nodes after M nodes of a linked list
 
 Given a linked list and two integers M and N. Traverse the linked list such that you retain M nodes then delete next N nodes, continue the same till end of the linked list.
 
 Examples:
 
 Input:
 M = 2, N = 2
 Linked List: 1->2->3->4->5->6->7->8
 Output:
 Linked List: 1->2->5->6

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


class LinkedList {
    func skipMdeleteN(head: ListNode?, M: Int, n: Int) -> ListNode? {
        var currentPointer:ListNode? = head
        var previousPointer: ListNode? = nil
        
        var index = 0
        var NodeNumber = M
        while (currentPointer != nil) {
            
            while(index < NodeNumber) {
                previousPointer = currentPointer
                currentPointer = currentPointer?.next
                index += 1
            }
            
            while index < NodeNumber + n {
                currentPointer = currentPointer?.next
                index += 1
            }
            
            previousPointer?.next = currentPointer
            NodeNumber = index + M
        }
        return head
    }
}
