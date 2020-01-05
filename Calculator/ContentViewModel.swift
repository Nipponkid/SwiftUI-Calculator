//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    private let app: Application
    
    private enum State {
        case acceptingInputs
        case displayingResult
    }

    private var operation: Operation
    
    // MARK: - Initialization
    
    init(for application: Application) {
        app = application
        operation = .acceptInput
    }

    // MARK: - Querying Display
    
    var display: String {
        if operation == .acceptInput {
            return determineCorrectInputToDisplay()
        } else {
            return String(app.sum)
        }
    }
        
    // MARK: - Entering Digit Strings
    
    func receiveDigitString(_ digitString: String) {
        let digit = Digit(rawValue: digitString)!
        app.receiveDigit(digit)
    }
    
    // MARK: - Performing Operations
    
    enum Operation {
        case acceptInput
        case addition
    }
    
    func performOperation(_ operation: Operation) {
        self.operation = operation
    }
    
    private func determineCorrectInputToDisplay() -> String {
        if app.state == .acceptingFirstInput {
            return String(app.firstInput)
        } else {
            return String(app.secondInput)
        }
    }
}
