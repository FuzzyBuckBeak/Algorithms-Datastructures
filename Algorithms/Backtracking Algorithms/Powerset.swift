//
//  Powerset.swift
//  Learning
//
//  Created by Apo on 8/5/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class PowerSet {
    func solution(arr: [Int]) {
        var subset: [Int] = []
        solve(k: 0, subset: &subset, n: arr.count, arr: arr)
    } 
    
    private func solve(k: Int, subset: inout [Int], n: Int, arr: [Int]) {
        if k == n { print(subset)}
        else {
            solve(k: k + 1, subset: &subset, n: n, arr: arr)
            subset.append(arr[k])
            solve(k: k + 1, subset: &subset, n: n, arr: arr)
            subset.removeLast()
        }
    }
}
