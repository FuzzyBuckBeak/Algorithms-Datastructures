//
//  WordBreak.swift
//  Learning
//
//  Created by Apo on 8/12/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.
//

import Foundation

class WordBreak {
    func solution(dict: [String: Bool], string: String) {
        var answer: [String] = []
        if solve(givenString: string, dict: dict, answer: &answer) {
            print(answer.joined(separator: " "))
        } else {
            print("String can't be broken")
        }
    }
    
    func solve(givenString: String, dict: [String: Bool], answer: inout [String]) -> Bool {
        if givenString.count == 0 { return true }
        let arr = Array(givenString)
        var word: String = ""
        for i in 0 ..< givenString.count {
            word = word + String(arr[i])
            if dict[word, default: false] {
                answer.append(word)
                return solve(givenString: String(arr[i+1 ..< givenString.count]), dict: dict, answer: &answer)
            }
        }
        
        return false
    }
}
