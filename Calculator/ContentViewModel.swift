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
}
