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
        case acceptingSecondInput
    }
    
    private(set) var state: State
    
    private(set) var output = "0"
    
    private(set) var firstInput: Int
    private(set) var secondInput: Int
    
    init() {
        firstInput = 0
        secondInput = firstInput
        state = .acceptingFirstInput
    }
    
    func receiveDigit(_ digit: Digit) {
        if state == .acceptingFirstInput {
            firstInput = firstInput.appendDigit(digit)
        } else if state == .acceptingSecondInput {
            secondInput = secondInput.appendDigit(digit)
        }
    }
    
    func acceptSecondInput() {
        state = .acceptingSecondInput
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
    
    func calculateSum() -> Int {
        let sum = firstInput + secondInput
        output = String(sum)
        return sum
    }
    
    func reset() {
        output = "0"
    }
    
    func calculateDifference() {
        let difference = firstInput - secondInput
        output = String(difference)
    }
    
    func subtract(_ minuend: Int, from subtrahend: Int) -> Int {
        return subtrahend - minuend
    }
}
