//
// Find length of loop in linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/29/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 Write a function detectAndCountLoop() that checks whether a given Linked List contains loop and if loop is present then returns count of nodes in loop. For example, loop is present in below linked list and length of loop is 4. If loop is not present, then function should return 0.
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
    func findTheLengthOfLoop(head: Node) -> Int {
        var slowPointer: Node? = head
        var fastPointer: Node? = head
        
        while(fastPointer != nil) {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
            if slowPointer === fastPointer { return countNode(slowPointer: slowPointer) }
        }
        
        
        return 0
    }
    
    private func countNode(slowPointer: Node?) -> Int {
        var count = 1
        
        var temp = slowPointer?.next
        while temp !== slowPointer  {
            temp = temp?.next
            count += 1
        }
        return count
    }
}
