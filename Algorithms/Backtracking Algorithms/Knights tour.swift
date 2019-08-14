//
//  Knights tour.swift
//  Learning
//
//  Created by Apo on 8/13/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class KnightsTour {
    var path: Int = 0
    func solution(n: Int) {
        var solution: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        if solve(solution: &solution, i: 0, j: 0, n: n, index: 1) {
            print(solution)
            return
        }
        print("No Solution")
    }
    
    func solve(solution: inout [[Int]], i: Int, j: Int, n: Int, index: Int) -> Bool {
        if solution[i][j] != 0 {
            return false
        }
        
        
        solution[i][j] = path
        path += 1
        
        //Base Case, when are the columns are done we are complete
        if index == n * n {
            return true
        }
        
        //Please avoid changing sequence of above arrays.
        //The order in which the Knight will move is circular and will be optimum.
        //Using above order, we will get to a vacant position in few moves.
        //Also, it is always better to start backtracking from any corner of chessboard.
        //If we start from somewhere middle, the Knight can go to 8 different directions.
        //If we start from corner, the knight can go to only two points from there.
        //Since the algorithm is exponential, optimized input to it can make huge difference.
        
        //down right
        if canPlace(i: i + 2, j: j + 1, n: n) &&
            solve(solution: &solution, i: i + 2, j: j + 1, n: n, index: index + 1) {
            return true
        }
        
        //right down
        if  canPlace(i: i + 1, j: j + 2, n: n) &&
            solve(solution: &solution, i: i + 1, j: j + 2, n: n, index: index + 1) {
            return true
        }
        
        //right up
        if canPlace(i: i - 1, j: j + 2, n: n) &&
            solve(solution: &solution, i: i - 1, j: j + 2, n: n, index: index + 1) {
            return true
        }
        
        //Top right
        if canPlace(i: i - 2, j: j + 1, n: n) &&
            solve(solution: &solution, i: i - 2, j: j + 1, n: n, index: index + 1) {
            return true
        }
        
        
        //Top left
        if canPlace(i: i - 2, j: j - 1, n: n) &&
            solve(solution: &solution, i: i - 2, j: j - 1, n: n, index: index + 1) {
            return true
        }
        
        //Left up
        if canPlace(i: i - 1, j: j - 2, n: n) &&
            solve(solution: &solution, i: i - 1, j: j - 2, n: n, index: index + 1) {
            return true
        }
       
        //Left down
        if canPlace(i: i + 1, j: j - 2, n: n)
            && solve(solution: &solution, i: i + 1, j: j - 2, n: n, index: index + 1) {
            return true
        }
        
        //down left
        if canPlace(i: i + 2, j: j - 1, n: n) &&
            solve(solution: &solution, i: i + 2, j: j - 1, n: n, index: index + 1) {
            return true
        }
        

        solution[i][j] = 0
        path -= 1
        return false
    }
    
    private func canPlace(i: Int, j: Int, n: Int) -> Bool {
        if (i >= 0 && j >= 0 && i < n && j < n) {
            return true
        }
        
        return false
    }
}
