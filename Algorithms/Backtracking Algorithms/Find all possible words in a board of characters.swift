//
//  Find all possible words in a board of characters.swift
//  Learning
//
//  Created by Apo on 8/14/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation
class FindAllWords {
    func solution(words: [String], board: [[String]]) -> [String]{
        var solution: [[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
        var resultArr: [String] = []
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                let someString = resultString(i: i, j: j, matrix: board)
                solve(i: i, j: j, matrix: board, solution: &solution, dictionary: words,
                      testString: someString, resultArr: &resultArr)
            }
        }
        
        return resultArr
    }
    
    @discardableResult
    func solve(i: Int, j: Int, matrix: [[String]], solution: inout [[Int]],
               dictionary: [String], testString: String, resultArr: inout [String]) -> Bool {
        
        if solution[i][j] != 0 { return false }
        
        solution[i][j] = 1
        
        if dictionary.contains(where: { $0.hasPrefix(testString) }) {
            
            //Base conditions
            if dictionary.contains(testString) {
                if !resultArr.contains(testString) { resultArr.append(testString)}
            }
            
            if canMove(i: i, j: j + 1, matrix: matrix) {
                solve(i: i, j: j + 1, matrix: matrix, solution: &solution,
                  dictionary: dictionary,
                  testString: testString + resultString(i: i, j: j + 1, matrix: matrix),
                  resultArr: &resultArr)
            }
            
            if canMove(i: i - 1, j: j + 1, matrix: matrix) {
                solve(i: i - 1, j: j + 1, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i - 1, j: j + 1, matrix: matrix),
                      resultArr: &resultArr)
            }
            
            if canMove(i: i - 1, j: j, matrix: matrix) {
                solve(i: i - 1, j: j, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i - 1, j: j, matrix: matrix),
                      resultArr: &resultArr)
            }
            
            if canMove(i: i - 1, j: j - 1, matrix: matrix) {
                solve(i: i - 1, j: j - 1, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i - 1, j: j - 1, matrix: matrix),
                      resultArr: &resultArr)
            }
            
            if canMove(i: i, j: j - 1, matrix: matrix) {
                solve(i: i, j: j - 1, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i, j: j - 1, matrix: matrix),
                      resultArr: &resultArr)
            }
            
            if canMove(i: i + 1, j: j - 1,matrix: matrix) {
                solve(i: i + 1, j: j - 1, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i + 1, j: j - 1, matrix: matrix),
                      resultArr: &resultArr)
            }
            
            if canMove(i: i + 1, j: j, matrix: matrix) {
                solve(i: i + 1, j: j, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i + 1, j: j, matrix: matrix),
                      resultArr: &resultArr)
            }
            
            if canMove(i: i + 1, j: j + 1, matrix: matrix) {
                solve(i: i + 1, j: j + 1, matrix: matrix, solution: &solution,
                      dictionary: dictionary,
                      testString: testString + resultString(i: i + 1, j: j + 1, matrix: matrix),
                      resultArr: &resultArr)
            }
            
        }
        
        solution[i][j] = 0
        return false
    }
    
    
    private func canMove(i: Int, j: Int, matrix: [[String]]) -> Bool {
        return i >= 0 && j >= 0 && i < matrix.count && j < matrix[0].count
    }
    
    private func resultString(i: Int, j: Int, matrix: [[String]]) -> String {
        return String(matrix[i][j])
    }
}
