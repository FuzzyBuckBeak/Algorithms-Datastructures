//
// Linked List - Binary Search.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/28/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 Binary Search on Singly Linked List
 
 Approach :
 
 Here, start node(set to Head of list), and the last node(set to NULL initially) are given.
 Middle is calculated using two pointers approach.
 If middle’s data matches the required value of search, return it.
 Else if middle’s data < value, move to upper half(setting start to middle's next).
 Else go to lower half(setting last to middle).
 The condition to come out is, either element found or entire list is traversed. When entire list is traversed, last points to start i.e. last -> next == start.
 
 TimeComplexity: O(n)
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


class LinkedList {
    
    private func returnMiddle(start: Node?, end: Node?) -> Node? {
        var slowPointer: Node? = start
        var fastPointer: Node? = start?.next
        
        while fastPointer !== end {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        return slowPointer
    }
    
    func binarySearch(head: Node, value: Int) -> Bool {
        var start: Node? = head
        var end: Node? = nil
        repeat {
            //Find the middle
            guard let middleNode = returnMiddle(start: start, end: end)  else { return false }
            
            //if element == middle we check the left side
            if middleNode.value == value { return true }
            
            //if element < middle we check the left side
            if value < middleNode.value {
                end = middleNode
            } else {
                //if element > middle we check the right side
                start = middleNode.next
            }
        } while(end?.next !== start) //equivalent to end < start
        return false
        
    }
}
