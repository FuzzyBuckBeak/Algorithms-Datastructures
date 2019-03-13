//
// Count rotations in sorted and rotated linked list.swift
// Problems
//
// Created by: FuzzyBuckBeak on 12/29/18
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/****************************************************************************************
 Count rotations in sorted and rotated linked list
 
 Given a linked list of n nodes which is first sorted, then rotated by k elements. Find the value of k.
*****************************************************************************************/

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
    func countRotation(head: Node?) -> Int {
        var counter = 1 
        guard head != nil else { return 0 }
        var referencePointer = head
        while (referencePointer != nil && referencePointer?.next != nil) {
            if referencePointer!.value > referencePointer!.next!.value { return counter }
            counter += 1
            referencePointer = referencePointer?.next
        }
        
        return 0
    }
}
