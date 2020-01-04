//
//  CalculatorOperation.swift
//  Calculator
//
//  Created by Wesley Brown on 1/3/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import Foundation

struct CalculatorOperation {
    let firstInput: Int
    let secondInput: Int
    
    init() {
        self.init(withFirstInput: 0)
    }
    
    init(withFirstInput firstInput: Int) {
        self.firstInput = firstInput
        secondInput = 0
    }
}
