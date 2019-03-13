//
// 24. Swap Nodes in Pairs
// Problems
//
// Created by: FuzzyBuckBeak on 12/30/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
 Given a linked list, swap every two adjacent nodes and return its head.
 
 Example:
 
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 Note:
 
 Your algorithm should use only constant extra space.
 You may not modify the values in the list's nodes, only nodes itself may be changed.
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
     func swapPairs(_ head: ListNode?) -> ListNode? {
        
        //If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
        var tail = head
        for _ in 0 ..< 2 {
            tail = tail?.next
            if tail == nil { return head }
        }
        
        // reverse the nodes of a linked list k at a time and return its modified list.
        var counter = 0
        var prevPointer: ListNode? = nil
        var currentPointer: ListNode? = head
        var nextPointer: ListNode? = nil
        
        while counter < 2 &&  currentPointer != nil {
            nextPointer = currentPointer?.next
            currentPointer?.next = prevPointer
            prevPointer = currentPointer
            currentPointer = nextPointer
            counter += 1
        }
        
        if (currentPointer != nil) {
            head?.next = swapPairs(currentPointer)
        }
        
        return prevPointer
    }
}
