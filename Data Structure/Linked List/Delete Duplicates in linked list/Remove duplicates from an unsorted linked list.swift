//
// Remove duplicates from an unsorted linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/30/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************
 Write a removeDuplicates() function which takes a list and deletes any duplicate nodes from the list. The list is not sorted.
 
 For example if the linked list is 12->11->12->21->41->43->21 then removeDuplicates() should convert the list to 12->11->21->41->43.
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

    func removeDuplicates(_ head: ListNode?) -> ListNode? {
        var prevPointer: ListNode? = nil
        var currentPointer: ListNode? = head
        var hashTable: [Int: Int] = [:]
       
        while currentPointer != nil {
            
            if hashTable[currentPointer!.value] != nil {
                prevPointer?.next = currentPointer?.next
            } else {
                prevPointer = currentPointer
                hashTable[currentPointer!.value] = 0
            }
            
            currentPointer = currentPointer?.next
        }
        
        return head
    }
}
