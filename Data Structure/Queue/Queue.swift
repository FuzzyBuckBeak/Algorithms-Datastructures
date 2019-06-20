//
//  Queue.swift
//  CodingChallenge
//
//  Created by Apo on 5/3/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

protocol QueueProtocol {
    associatedtype T
    func peek() -> T?
    mutating func enqueue(_ data: T)
    mutating func dequeue() -> T?
    var isEmpty: Bool { get }
}

struct Queue<T>: QueueProtocol {
    var array: [T]
    
    func peek() -> T? {
       return array.first
    }
    
    mutating func enqueue(_ data: T) {
        array.append(data)
    }
    
    mutating func dequeue() -> T? {
        return array.popLast()
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
}
