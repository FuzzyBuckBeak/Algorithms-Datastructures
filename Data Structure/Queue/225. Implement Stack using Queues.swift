//
//  225. Implement Stack using Queues.swift
//  Learning
//
//  Created by Apo on 6/18/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//
/*****************************************************************************************
 Implement the following operations of a stack using queues.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 empty() -- Return whether the stack is empty.
 Example:
 
 MyStack stack = new MyStack();
 
 stack.push(1);
 stack.push(2);
 stack.top();   // returns 2
 stack.pop();   // returns 2
 stack.empty(); // returns false
 
 
 ****************************************************************************************/
import Foundation

class MyStack {
    
    /** Initialize your data structure here. */
    var arr: [Int]!
    init() {
        arr = []
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        arr.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return arr.isEmpty ? -1 : arr.removeLast()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return arr.isEmpty ? -1 : arr.last!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return arr.isEmpty
    }
}


