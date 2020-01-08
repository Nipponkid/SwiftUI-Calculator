//
//  Application.swift
//  Calculator
//
//  Created by Wesley Brown on 12/10/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

class Application {
    
    private var firstInputDigits: [Digit] = []
    private var secondInputDigits: [Digit] = []
    
    // MARK: - Initialization
    
    init() {
        state = .acceptingFirstInput
    }
    
    // MARK: - Querying Inputs
    
    var firstInput: Int {
        return Int.fromDigits(firstInputDigits)
    }
    
    var secondInput: Int {
        return Int.fromDigits(secondInputDigits)
    }
    
    // MARK: - Querying State
    
    enum State {
        case acceptingFirstInput
        case acceptingSecondInput
    }
    
    private(set) var state: State
    
    // MARK: - Calculations
    
    var sum: Int {
        return firstInput + secondInput
    }
    
    var difference: Int {
        return firstInput - secondInput
    }
    
    var product: Int {
        return firstInput * secondInput
    }
    
    var quotient: Int {
        return firstInput / secondInput
    }
    
    // MARK: - Entering Digits
    
    func receiveDigit(_ digit: Digit) {
        if state == .acceptingFirstInput {
            firstInputDigits.append(digit)
        } else if state == .acceptingSecondInput {
            secondInputDigits.append(digit)
        }
    }
    
    func acceptSecondInput() {
        state = .acceptingSecondInput
    }
}
