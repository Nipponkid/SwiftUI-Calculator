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
    
    init(for application: Application) {
        display = application.output
    }
    
    func inputDigit(_ digit: String) {
        if display == "0" {
            display = digit
        } else {
            display += digit
        }
    }
}
