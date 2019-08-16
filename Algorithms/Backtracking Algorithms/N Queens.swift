//
//  N Queens.swift
//  Learning
//
//  Created by Apo on 8/9/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation


class NQueens {
    
    var q: [[String]] = [[]]
    func solution(n: Int) {
        var result: [[String]] = []
        q = Array(repeating: Array(repeating: ".", count: n), count: n)
        solution(col: 0, n: n, result: &result)
        print(result)
    }
    
    @discardableResult
    private func solution(col: Int, n: Int, result: inout [[String]]) -> Bool {
        if col == n {
            print(result.append(q.map { $0.joined() }))
        }
        else {
            for row in 0 ..< n {
                if canPlace(row: row, col: col, n: n) {
                    q[row][col] = "Q"
                    
                    if solution(col: col + 1, n: n, result: &result) { return true }
                    q[row][col] = "."
                    
                }
            }
        }
        
        return false
    }
    
    private func canPlace(row: Int, col: Int, n: Int) -> Bool {
        
        //Check for row
        for i in 0 ..< n {
            if (q[row][i] == "Q") { return false }
        }
        
        //Check for daigonal
        var i = row
        var j = col
        
        while j >= 0 && i >= 0 {
            if q[i][j] == "Q" { return false }
            j -= 1
            i -= 1
        }
        
        //Check for anti daigonal
        i = row
        j = col
        while j >= 0 && i < n {
            if q[i][j] == "Q"  { return false }
            i += 1
            j -= 1
        }
        
        return true
    }
}
