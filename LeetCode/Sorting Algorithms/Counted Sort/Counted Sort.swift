//
//  Counted Sort
//
//  Created by FuzzyBuckBeak on 12/24/18
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*********************************************************************************
 Implement Counted Sort
 
 Time Complexity: O(n+k) where n is the number of elements in input array and k is the range of input.
 Auxiliary Space: O(n+k)
 ********************************************************************************/

import Foundation

class Sort {
    func counting(arr: [Int]) -> [Int] {
        guard arr.count > 1 else { return arr }
        let maxElement = arr.max()!
        
        var output: [Int] = []
        var temp = [Int].init(repeating: 0, count: maxElement + 1)
        for i in 0 ..< arr.count {
            temp[arr[i]] = temp[arr[i]] + 1
        }
        
        temp.enumerated().forEach { (index, value) in
            guard value > 0 else { return }
            output.append(contentsOf: [Int].init(repeating: index, count: value))
        }
        
        return output
    }
}
