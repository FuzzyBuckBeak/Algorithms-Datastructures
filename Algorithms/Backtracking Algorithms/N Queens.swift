//
//  N Queens.swift
//  Learning
//
//  Created by Apo on 8/9/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation


class NQueens {
    
    var q: [[Bool]] = [[]]
    func solution(n: Int) {
        q = Array(repeating: Array(repeating: false, count: n), count: n)
        solution(col: 0, n: n)
    }
    
    @discardableResult
    private func solution(col: Int, n: Int) -> Bool {
        if col == n { print(q)}
        else {
            for row in 0 ..< n {
                if canPlace(row: row, col: col, n: n) {
                    q[row][col] = true
                    
                    if solution(col: col + 1, n: n) { return true }
                    q[row][col] = false
                    
                }
            }
        }
        
        return false
    }
    
    private func canPlace(row: Int, col: Int, n: Int) -> Bool {
        
        //Check for row
        for i in 0 ..< n {
            if (q[row][i]) { return false }
        }
        
        //Check for daigonal
        var i = row
        var j = col
        
        while j >= 0 && i >= 0 {
            if q[i][j] { return false }
            j -= 1
            i -= 1
        }
        
        //Check for anti daigonal
        i = row
        j = col
        while j >= 0 && i < n {
            if q[i][j]  { return false }
            i += 1
            j -= 1
        }
        
        return true
    }
}
