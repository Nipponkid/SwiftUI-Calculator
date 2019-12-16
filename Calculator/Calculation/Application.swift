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
    
    func receiveFirstInput(_ firstInput: Int) {
        output = String(firstInput)
    }
}
