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
    }
    
    private(set) var state: State
        
    // MARK: - Entering Digit Strings
    
    func receiveDigitString(_ digitString: String) {
        let digit = Digit(rawValue: digitString)!
        app.receiveDigit(digit)
        
        if state == .operationSpecified {
            state = .displayingSecondInput
        }
        
        display = determineWhatToDisplay()
    }
    
    // MARK: - Performing Operations
    
    enum Operation {
        case none
        case addition
        case subtraction
    }
    
    private var operation: Operation
    
    func specifyOperation(_ operation: Operation) {
        state = .operationSpecified
        self.operation = operation
        app.acceptSecondInput()
        
        display = determineWhatToDisplay()
    }
    
    func performOperation() {
        if state == .operationSpecified {
            let digits = app.firstInput.digits
            for digit in digits {
                app.receiveDigit(digit)
            }
        }
        state = .displayingResult
        
        display = determineWhatToDisplay()
    }
    
    func reset() {
        app = Application()
        state = .acceptingFirstInput
        display = determineWhatToDisplay()
    }
    
    private func determineWhatToDisplay() -> String {
        if state == .acceptingFirstInput || state == .operationSpecified {
            return String(app.firstInput)
        } else if state == .displayingSecondInput {
            return String(app.secondInput)
        } else if operation == .addition {
            return String(app.sum)
        } else {
            return String(app.difference)
        }
    }
}
