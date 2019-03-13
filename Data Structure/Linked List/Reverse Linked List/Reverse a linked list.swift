//
// Reverse a linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/29/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************

 Reverse a linked list
 
 Given pointer to the head node of a linked list, the task is to reverse the linked list. We need to reverse the list by changing links between nodes.
 
 Examples:
 
 Input : Head of following linked list
 1->2->3->4->NULL
 Output : Linked list should be changed to,
 4->3->2->1->NULL
*****************************************************************************************************************************/

import Foundation

//Node Class
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

//Linked List Class
class LinkedList {

    func reverseLinkedList(head: Node) -> Node? {
        var currentPointer: Node? = head
        var previousNode: Node? = nil
        var nextNode: Node? = nil
        
        while currentPointer != nil {
            nextNode = currentPointer?.next
            currentPointer?.next = previousNode
            previousNode = currentPointer
            currentPointer = nextNode
        }
        
        return previousNode
    }
}
