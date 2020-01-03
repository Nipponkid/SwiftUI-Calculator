//
//  Int+DigitInput.swift
//  Calculator
//
//  Created by Wesley Brown on 1/3/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import Foundation

extension Int {
    func appendDigit(_ digit: Digit) -> Int {
        return Int(String(self) + digit.rawValue)!
    }
}
