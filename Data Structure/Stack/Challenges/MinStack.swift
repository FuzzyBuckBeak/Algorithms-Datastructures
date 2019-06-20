//
//  MinStack.swift
//  Learning
//
//  Created by Apo on 6/18/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class MinStack {
    
    var arr: [Int]!
    var minStack: [Int]!
    /** initialize your data structure here. */
    init() {
        arr = []
        minStack = []
    }
    
    func push(_ x: Int) {
        arr.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else if minStack.last! > x {
            minStack.append(x)
        }
    }
    
    func pop() {
        if !arr.isEmpty {
            let element = arr.removeLast()
            if element == minStack.last { minStack.removeLast() }
        }
    }
    
    func top() -> Int {
        return arr.isEmpty ? -1 : arr.last!
    }
    
    func getMin() -> Int {
        return minStack.isEmpty ? -1 : minStack.last!
    }
}
