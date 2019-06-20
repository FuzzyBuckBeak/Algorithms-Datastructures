//
//  QueueUsingStack.swift
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


class DoubleStack<T>: QueueProtocol {
    var leftStack: [T] = []
    var rightStack: [T] = []
    var isEmpty: Bool {
        return false
    }
    
    func peek() -> T? {
        moveFromRightToLeft()
        return leftStack.last
    }
    
    func enqueue(_ data: T) {
        rightStack.append(data)
    }
    
    func dequeue() -> T? {
        moveFromRightToLeft()
        return leftStack.popLast()
    }
    
    private func moveFromRightToLeft() {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
    }
}
