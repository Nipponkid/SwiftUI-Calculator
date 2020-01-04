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
    
    init(withFirstInput firstInput: Int) {
        application = Application()
        displayingPreviousInput = false
        firstNumber = firstInput
        display = String(firstInput)
    }
    
    func receiveDigit(_ digit: String) -> ContentViewModel {
        let newNumber = firstNumber.appendDigit(Digit(rawValue: digit)!)
        return ContentViewModel(withFirstInput: newNumber)
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
