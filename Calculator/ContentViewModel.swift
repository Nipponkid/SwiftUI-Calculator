//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    private let app: Application
    
    // MARK: - Initialization
    
    init(for application: Application) {
        app = application
    }

    // MARK: - Querying Display
    
    var display: String {
        if app.state == .acceptingFirstInput {
            return String(app.firstInput)
        } else {
            return String(app.secondInput)
        }
    }
        
    // MARK: - Entering Digit Strings
    
    func receiveDigitString(_ digitString: String) {
        let digit = Digit(rawValue: digitString)!
        app.receiveDigit(digit)
    }
}
