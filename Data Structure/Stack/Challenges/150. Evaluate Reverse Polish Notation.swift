//
//  150. Evaluate Reverse Polish Notation.swift
//  Learning
//
//  Created by Apo on 6/18/19.
//  Copyright © 2019 FuzzyBuckbeak. All rights reserved.

/******************************************************************************************
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.

 Valid operators are +, -, *, /. Each operand may be an integer or another expression.
 Division between two integers should truncate toward zero.
 The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.

 Input: ["2", "1", "+", "3", "*"]
 Output: 9
 Explanation: ((2 + 1) * 3) = 9
*******************************************************************************************/

import Foundation

class EvaluateReversePolish {
    func evalRPN(_ tokens: [String]) -> Int {
        if tokens.count == 1 { return Int(tokens[0])! }
        var stack: [Int] = []
        let operators = ["+", "-", "*", "/"]
        var result: Int = 0
        
        for charecter in tokens {
            if !operators.contains(charecter) {
                stack.append(Int(charecter)!)
            } else {
                let e1 = stack.removeLast()
                let e2 = stack.removeLast()
                switch charecter {
                case "+": result = e1 + e2
                case "-": result = e2 - e1
                case "*": result = e1 * e2
                case "/": result = e1 == 0 ? 0 : e2 / e1
                default: break
                }
                stack.append(result)
            }
        }
        
        return result
    }
}
