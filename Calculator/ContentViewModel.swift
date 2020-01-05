//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    private(set) var display: String
    private var application: Application
    
    init(for application: Application) {
        self.application = application
        display = application.output
    }
    
    func receiveDigitString(_ digitString: String) {
//        application.receiveDigit(Digit(rawValue: digitString)!)
//        display = String(application.firstInput)
    }
    
    func sendInput() {
        if application.state == .acceptingFirstInput {
            display = String(application.firstInput)
        } else if application.state == .acceptingSecondInput {
            display = String(application.secondInput)
        }
        application.acceptSecondInput()
    }
    
    func calculateSum() {
        display = String(application.calculateSum() )
    }
}
