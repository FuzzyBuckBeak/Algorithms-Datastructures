//
// Program for n’th node from the end of a Linked List.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/28/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************

 Program for n’th node from the end of a Linked List
 
 Given a Linked List and a number n, write a function that returns the value at the n’th node from end of the Linked List.
 
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


class LinkedList {
    func printNthFromLast(head: Node, index: Int) -> Int? {
        var firstPointer: Node? = head
        var secondPointer: Node? = head
        var count = 0
        
        while (count < index) {
            firstPointer = firstPointer?.next
            count += 1
        }
        
        while(firstPointer != nil) {
            secondPointer = secondPointer?.next
            firstPointer = firstPointer?.next
        }
        
        return secondPointer?.value
    }
}
