//
//  Ways To Reach Bottom-Right.swift
//  Learning
//
//  Created by Apo on 8/14/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class WaysToReach {
    func rSolution(n: Int) -> Int {
        return solve(i: 0, j: 0, n: n)
    }
    
    func dpSolution(n: Int) -> Int {
        var solution: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0 ..< solution.count { solution[0][i] = 1 }
        for i in 0 ..< solution.count { solution[i][0] = 1 }
        solve(row: 1, col: 1, solution: &solution, n: n)
        return solution[n-1][n-1]
    }
    
    //Recursion
    private func solve(i: Int, j: Int, n: Int) -> Int {
        if i == n - 1 || j == n - 1 { return 1 }
        return solve(i: i, j: j + 1, n: n) + solve(i: i + 1, j: j, n: n)
    }
    
    //Bottom Up - Dynamic Programming Approach
    private func solve(row: Int, col: Int, solution: inout [[Int]], n: Int) {
        if row == n && col == n { return }
        for i in 1 ..< solution.count {
            for j in 1 ..< solution.count {
                solution[i][j] = solution[i - 1][j] + solution[i][j - 1]
            }
        }
    }
}

