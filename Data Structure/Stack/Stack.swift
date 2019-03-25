//
// Implementation of generic Stack
//
//
//	Created by FuzzyBuckBeak on 8/4/18.
//  Copyright © 2018 FuzzyBuckBeak. All rights reserved.
//

/*************************************************************************************************************************************************************
 Implement a Stack data structure.
 - insertion
 - deletion
 - top Most element
 - IsEmpty
 
*************************************************************************************************************************************************************/

import Foundation

class Stack<Element> {
    private var array: [Element] = []
    
    func push(_ element: Element) {
        array.append(element)
    }
    
    func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}
