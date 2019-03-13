//
// Make middle node head in a linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/29/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 Make middle node head in a linked list
 Given a singly linked list, find middle of the linked list and set middle node of the linked list at beginning of the linked list.
 
 Examples:
 
 Input  : 1 2 3 4 5
 Output : 3 1 2 4 5
 
 Input  : 1 2 3 4 5 6
 Output : 4 1 2 3 5 6
*****************************************************************************************************************************/

import Foundation

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

    func setMiddleHead(head: Node) -> Node? {
        let (previousPointer, currentPointer) = returnMiddle(head: head)
        previousPointer?.next = currentPointer?.next
        currentPointer?.next = head
        return currentPointer
    }
    
    private func returnMiddle(head: Node) -> (Node?, Node?) {
        var slowPointer: Node? = head
        var fastPointer: Node? = head
        var previousSlowPointer: Node? = head
        
        while(fastPointer?.next != nil) {
            previousSlowPointer = slowPointer
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        return (previousSlowPointer, slowPointer)
    }
}
