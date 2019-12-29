//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel {
    
    private(set) var display: String
    private var firstInput: String
    
    init(for application: Application) {
        display = application.output
        firstInput = display
    }
    
    func inputDigit(_ digit: String) {
        if display == "0" {
            display = digit
        } else {
            display += digit
        }
    }
    
    func sendFirstInput() {
        firstInput = display
        display = "0"
    }
    
    func calculateSum() {
        if let firstInput = Int(firstInput) {
            if let secondInput = Int(display) {
                let sum = firstInput + secondInput
                display = String(sum)
            }
        }
    }
}
