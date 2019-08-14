//
//  Rat in Maze.swift
//  Learning
//
//  Created by Apo on 8/12/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

enum direction {
    case up, down, left, right
}

class RatMaze {

    var path: Int = 0
    func solution(matrix: [[Int]]) {
        var solution: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        let length = matrix[0].count
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count {
                if solve(i: i, j: j, solution: &solution, matrix: matrix, n: length, direction: .left) {
                    print(solution)
                    return
                }
            }
        }
        
        print("No Solution")
    }
    
    func solve(i: Int, j: Int, solution: inout [[Int]], matrix: [[Int]], n: Int, direction: direction) -> Bool {
        if matrix[i][j] != 1 {
            return false
        }
        
        path = path + 1
        solution[i][j] = path
        
        //Base Case
        if i == n - 1 && j == n - 1 { print(solution) ; return true }
        
        if i + 1 < n &&
           direction != .up &&
           solve(i: i + 1, j: j, solution: &solution, matrix: matrix, n: n, direction: .down) {
            return true
        }
        
        if  j + 1 < n &&
            direction != .left &&
            solve(i: i, j: j + 1, solution: &solution, matrix: matrix, n: n, direction: .right) {
            return true
        }
        
        
        if  i - 1 >= 0 &&
            direction != .down &&
            solve(i: i - 1, j: j, solution: &solution, matrix: matrix, n: n, direction: .up) {
            return true
        }
        
        if  j - 1 >= 0 &&
            direction != .right &&
            solve(i: i, j: j - 1, solution: &solution, matrix: matrix, n: n, direction: .left) {
            return true
        }
        
        path = path - 1
        solution[i][j] = 0
        
        return false
    }
}
