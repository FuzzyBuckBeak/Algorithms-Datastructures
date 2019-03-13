//
// Delete Middle Node access given just to the node.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/31/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.



/*****************************************************************************************************************************

 EXAMPLE
 lnput:the node c from the linked list a->b->c->d->e->f
 Result: nothing is returned, but the new linked list looks like a->b->d->e->f

 you are not given access to the head of the linked list
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
    func deleteNode(node: ListNode?) -> Bool {
        if (node == nil || node?.next == nil) {
            return false
        }

        guard let value = node?.next?.value else { return false }
        node?.value = value
        node?.next = node?.next?.next
        

        return true
    }
}
