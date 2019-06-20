//
//  CircularQueue.swift
//  CodingChallenge
//
//  Created by Apo on 5/8/18.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

struct CircularQueue<T> {
    var array: [T?]
    var readHead: Int = 0
    var writeHead: Int = 0
    
    init(count: Int) {
        array = Array(repeating: nil, count: count)
    }
    
    var isFull: Bool {
        return writeHead - readHead == array.count
    }
    
    var isEmpty: Bool {
        return writeHead - readHead == 0
    }
    
    mutating func write(_ data: T) -> Bool {
        if !isFull {
            array[writeHead % array.count] = data
            writeHead += 1
            return true
        }
        return false
    }
    
    mutating func read() -> T? {
        if !isEmpty {
            defer {
                readHead += 1
            }
           return array[readHead % array.count]
        }
        return nil
    }
}
