//
//  NumberReceiver.swift
//  Calculator
//
//  Created by Wesley Brown on 11/25/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

class NumberCreator {
    private var rawInput = "0"
    
    var number: Int {
        if let integer = Int(rawInput) {
            return integer
        } else {
            return 0
        }
    }
    
    func append(digit: String) {
        rawInput = digit
    }
}
