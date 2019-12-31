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
    private var sentFirstInput: Bool
    
    init(for application: Application) {
        self.application = application
        display = application.output
        sentFirstInput = false
    }
    
    func inputDigit(_ digit: String) {        
        if display == "0" || sentFirstInput {
            display = digit
        } else {
            display += digit
        }
    }
    
    func sendFirstInput() {
        if let firstNumber = Int(display) {
            application.receiveFirstInput(firstNumber)
        }
        sentFirstInput = true
    }
    
    func calculateSum() {
        if let secondNumber = Int(display) {
            application.receiveSecondInput(secondNumber)
        }
        application.calculateSum()
        display = application.output
    }
}
