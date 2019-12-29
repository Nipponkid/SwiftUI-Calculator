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
    
    init(for application: Application) {
        self.application = application
        display = application.output
    }
    
    func inputDigit(_ digit: String) {
        if display == "0" {
            display = digit
        } else {
            display += digit
        }
    }
    
    func sendFirstInput() {
        if let firstNumber = Int(display) {
            application.receiveFirstInput(firstNumber)
        }
        display = "0"
    }
    
    func calculateSum() {
        if let secondNumber = Int(display) {
            application.receiveSecondInput(secondNumber)
        }
        application.calculateSum()
        display = application.output
    }
}
