//
//  Application.swift
//  Calculator
//
//  Created by Wesley Brown on 12/10/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

class Application {
    private(set) var output = "0"
    
    private var firstInput: Int
    private var secondInput: Int
    
    init() {
        firstInput = 0
        secondInput = firstInput
    }
    
    func receiveFirstInput(_ firstInput: Int) {
        self.firstInput = firstInput
        secondInput = self.firstInput
        output = String(firstInput)
    }
    
    func receiveSecondInput(_ secondInput: Int) {
        self.secondInput = secondInput
        output = String(secondInput)
    }
    
    func calculateSum() {
        let sum = firstInput + secondInput
        output = String(sum)
    }
}
