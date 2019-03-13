//   LSD - radix Sort
//
//  Created by FuzzyBuckBeak on 8/3/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*******************************************************************************************
 Implement the least significant radix sort
 
 Time Complexity: O(kn).
 
 k - number of digits in the given number
 *******************************************************************************************/

import Foundation

class LSDRadixSort {
    func sort(arr: [Int]) -> [Int] {
        let base = 10
        var result: [Int] = arr
        var done = false
        var digits  = 1
        
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            result.forEach { (number) in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                
                if remainingPart > 0 && done {
                    done = false
                }
            }
            
            digits *= base
            result = buckets.flatMap { $0 }
        }
        
        return result
    }
}

