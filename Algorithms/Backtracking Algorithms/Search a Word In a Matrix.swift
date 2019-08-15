//
//  Backtracking – Search a Word In a Matrix.swift
//  Learning
//
//  Created by Apo on 8/9/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class WordSearch {
    var path: Int = 0
    func solution(word: String, matrix: [[Character]]) {
        print(solve(word: word, matrix: matrix))
    }
    
    func solve(word: String, matrix: [[Character]]) -> Bool {
        var result: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix.count)
        let word = Array(word)
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix.count {
                if search(matrix: matrix, i: i, j: j, word: word, index: 0, n: word.count, solution: &result) { return true }
            }
        }
        
        return false
    }
    
    func search(matrix: [[Character]], i: Int, j: Int, word: [Character], index: Int, n: Int, solution: inout [[Int]]) -> Bool {
        if matrix[i][j] != word[index] {
            return false
        }
        
        //Base
        if index == word.count - 1 {
            path = path + 1
            solution[i][j] = path
            print(solution)
            return true
        }
        
        path = path + 1
        solution[i][j] = path
        
        if i + 1 < n && search(matrix: matrix, i: i + 1, j: j, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        if j + 1 < n && search(matrix: matrix, i: i, j: j + 1, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        if j - 1 >= 0 && search(matrix: matrix, i: i, j: j - 1, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        if i - 1 >= 0 && search(matrix: matrix, i: i - 1, j: j, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        if i + 1 < n && j + 1 < n && search(matrix: matrix, i: i + 1, j: j + 1, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        if i - 1 >= 0 && j - 1 >= 0 && search(matrix: matrix, i: i - 1, j: j - 1, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        if i - 1 >= 0 && j + 1 < n && search(matrix: matrix, i: i - 1, j: j + 1, word: word, index: index + 1, n: n, solution: &solution) {
            return true
        }
        
        solution[i][j] = 0
        path -= 1
        return false
    }
}
