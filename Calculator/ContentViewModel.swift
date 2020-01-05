//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    // MARK: - Initialization
    
    init(for application: Application) {
        display = ""
    }

    // MARK: - Querying Display
    
    var display: String
        
    // MARK: - Entering Digit Strings
    
    func receiveDigitString(_ digitString: String) {
        display = digitString
    }
}
