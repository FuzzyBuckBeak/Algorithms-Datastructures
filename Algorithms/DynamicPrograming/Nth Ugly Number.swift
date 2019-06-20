//
//  Nth Ugly Number - Using dynamic Programming.swift
//  Learning
//
//  Created by Apo on 6/14/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation
class NthUglyNumber {
    
    func nthUglyNumber(_ n: Int) -> Int {
        var uglyNumber: [Int] = Array(repeating: 0, count: n)
        uglyNumber[0] = 1
        var counter = 1
        
        var index2 = 0
        var index3 = 0
        var index5 = 0
        
        while counter < n {
            let next2 = uglyNumber[index2] * 2
            let next3 = uglyNumber[index3] * 3
            let next5 = uglyNumber[index5] * 4
            
            let next = min(next2, min(next3, next5))
            
            if next == next2 { index2 += 1 }
            if next == next3 { index3 += 1 }
            if next == next5 { index5 += 1 }
            
            uglyNumber[counter] = next
            counter += 1
        }
        
        return uglyNumber[n - 1]
    }
}
