//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published private(set) var display: String
    private var application: Application
    private var displayingPreviousInput: Bool
    private var firstNumber: Int
    
    init(for application: Application) {
        self.application = application
        display = application.output
        displayingPreviousInput = false
        firstNumber = Int(application.output)!
    }
    
    func receiveDigitString(_ digitString: String) {
        display = digitString
    }
    
    func sendInput() {
        if application.state == .acceptingFirstInput {
            display = String(application.firstInput)
        } else if application.state == .acceptingSecondInput {
            display = String(application.secondInput)
        }
    }
    
    func inputDigit(_ digit: String) {        
        if display == "0" || displayingPreviousInput {
            display = digit
        } else {
            display += digit
        }
        displayingPreviousInput = false
    }
    
    func sendFirstInput() {
        if let firstNumber = Int(display) {
            application.receiveFirstInput(firstNumber)
            self.firstNumber = firstNumber
        }
        displayingPreviousInput = true
    }
    
    func calculateSum() {
        let secondNumber = Int(display)!
        let sum = application.add(secondNumber, to: firstNumber)
        display = String(sum)
    }
    
    func reset() {
        application.reset()
        display = application.output
    }
}
