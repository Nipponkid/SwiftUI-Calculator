//
//  Application.swift
//  Calculator
//
//  Created by Wesley Brown on 12/10/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

class Application {
    enum State {
        case acceptingFirstInput
    }
    
    var state: State
    
    private(set) var output = "0"
    
    private(set) var firstInput: Int
    private var secondInput: Int
    
    init() {
        firstInput = 0
        secondInput = firstInput
        state = .acceptingFirstInput
    }
    
    func receiveDigit(_ digit: Digit) {
        firstInput = firstInput.appendDigit(digit)
    }
    
    func receiveFirstInput(_ firstInput: Int) {
        self.firstInput = firstInput
        secondInput = self.firstInput
        output = String(firstInput)
    }
    
    func receiveSecondInput(_ secondInput: Int) {
        self.secondInput = secondInput
        output = String(secondInput)
    }
    
    func calculateSum() {
        let sum = firstInput + secondInput
        output = String(sum)
    }
    
    func reset() {
        output = "0"
    }
    
    func calculateDifference() {
        let difference = firstInput - secondInput
        output = String(difference)
    }
    
    func add(_ augend: Int, to addend: Int) -> Int {
        return addend + augend
    }
    
    func subtract(_ minuend: Int, from subtrahend: Int) -> Int {
        return subtrahend - minuend
    }
}
