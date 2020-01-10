//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    private var app: Application
    
    // MARK: - Initialization
    
    init(for application: Application) {
        app = application
        state = .acceptingFirstInput
        display = "0"
        operation = .none
    }

    // MARK: - Querying Display
    
    // display is a stored instead of computed property because the Published
    // property wrapper can only be used on stored properties
    @Published private(set) var display: String
    
    // MARK: - Querying State
    
    enum State {
        case acceptingFirstInput
        case operationSpecified
        case displayingSecondInput
        case displayingResult
        case displayingError
    }
    
    private(set) var state: State
        
    // MARK: - Entering Digit Strings
    
    func receiveDigitString(_ digitString: String) {
        let digit = Digit(rawValue: digitString)!
        app.receiveDigit(digit)
        
        if state == .operationSpecified {
            state = .displayingSecondInput
        } else if state == .displayingResult {
            state = .acceptingFirstInput
        }
        
        display = determineWhatToDisplay()
    }
    
    // MARK: - Performing Operations
    
    enum Operation {
        case none
        case addition
        case subtraction
        case multiplication
        case division
    }
    
    private(set) var operation: Operation
    private var hasBeenCleared = true
    
    func specifyOperation(_ operation: Operation) {
        state = .operationSpecified
        self.operation = operation
        app.acceptSecondInput()
        
        display = determineWhatToDisplay()
    }
    
    func performOperation() {
        if hasBeenCleared {
            specifySecondInputIfNecessary()
            displayOperationResult()
            hasBeenCleared = false
        } else {
            let secondInput = app.secondInput
            
            app = Application()
            
            // Use current display as first input
            for digitCharacter in display {
                app.receiveDigit(Digit(rawValue: String(digitCharacter))!)
            }
            app.acceptSecondInput()
            
            // Use previous second input as new second input
            for digit in secondInput.digits {
                app.receiveDigit(digit)
            }
            
            displayOperationResult()
        }
    }
    
    func reset() {
        app = Application()
        state = .acceptingFirstInput
        display = determineWhatToDisplay()
        hasBeenCleared = true
    }
    
    private func determineWhatToDisplay() -> String {
        if state == .acceptingFirstInput || state == .operationSpecified {
            return String(app.firstInput)
        } else if state == .displayingSecondInput {
            return String(app.secondInput)
        } else {
            return "Error"
        }
    }
    
    private func specifySecondInputIfNecessary() {
        if state == .operationSpecified {
            let digits = app.firstInput.digits
            for digit in digits {
                app.receiveDigit(digit)
            }
        }
    }
    
    private func displayOperationResult() {
        if isDividingByZero {
            state = .displayingError
            display = "Error"
        } else {
            state = .displayingResult
            
            switch operation {
            case .none:
                display = "Error"
            case .addition:
                display = String(app.sum)
            case .subtraction:
                display = String(app.difference)
            case .multiplication:
                display = String(app.product)
            case .division:
                display = String(app.quotient)
            }
        }
    }
    
    private var isDividingByZero: Bool {
        app.secondInput == 0 && operation == .division
    }
}
