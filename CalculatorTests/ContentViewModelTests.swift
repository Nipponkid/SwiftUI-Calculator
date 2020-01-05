//
//  ContentViewModelTests.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 1/5/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

@testable import Calculator
import XCTest

class ContentViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_digitInputAgainstFirstInputOfZeroDisplaysThatDigit() {
        let app = ContentViewModelTests.createApplicationWithFirstInputOfZero()
        let model = ContentViewModel(for: app)
        model.receiveDigitString("2")
        XCTAssertEqual(model.display, "2")
    }
    
    func test_digitInputAgainstFirstInputOfNonZeroAppendsThatDigitToDisplay() {
        let app = ContentViewModelTests.createApplicationWithFirstInputOfNonZero()
        let previousFirstInput = app.firstInput
        
        let model = ContentViewModel(for: app)
        model.receiveDigitString("5")
        XCTAssertEqual(model.display, String(previousFirstInput) + "5")
    }
    
    private static func createApplicationWithFirstInputOfZero() -> Application {
        return Application()
    }
    
    private static func createApplicationWithFirstInputOfNonZero() -> Application {
        let app = Application()
        app.receiveDigit(Digit.eight)
        return app
    }
}
