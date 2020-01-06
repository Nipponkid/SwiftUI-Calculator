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
    
    // MARK: - Initialization
    
    init(for application: Application) {
        app = application
        state = .acceptingFirstInput
        display = "0"
    }

    // MARK: - Querying Display
    
    // display is a stored instead of computed property because the Published
    // property wrapper can only be used on stored properties
    @Published private(set) var display: String
    
    // MARK: - Querying State
    
    enum State {
        case acceptingFirstInput
        case displayingResult
    }
    
    private(set) var state: State
        
    // MARK: - Entering Digit Strings
    
    func receiveDigitString(_ digitString: String) {
        let digit = Digit(rawValue: digitString)!
        app.receiveDigit(digit)
        
        updateDisplay()
    }
    
    // MARK: - Performing Operations
    
    enum Operation {
        case addition
    }
    
    func performOperation(_ operation: Operation) {
        state = .displayingResult
        
        updateDisplay()
    }
    
    private func determineCorrectInputToDisplay() -> String {
        if app.state == .acceptingFirstInput {
            return String(app.firstInput)
        } else {
            return String(app.secondInput)
        }
    }
    
    // This method only exists because display can't be a computed property. If
    // it could be, this logic would be directly instead the display property
    private func updateDisplay() {
        if state == .acceptingFirstInput {
            display = determineCorrectInputToDisplay()
        } else {
            display = String(app.sum)
        }
    }
}
