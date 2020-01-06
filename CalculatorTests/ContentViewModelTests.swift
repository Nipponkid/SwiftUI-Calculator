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
        XCTAssertEqual(model.display, String(app.firstInput))
    }
    
    func test_digitInputAgainstFirstInputOfNonZeroAppendsThatDigitToDisplay() {
        let app = ContentViewModelTests.createApplicationWithFirstInputOfNonZero()
        let previousFirstInput = app.firstInput
        
        let model = ContentViewModel(for: app)
        model.receiveDigitString("5")
        XCTAssertEqual(model.display, String(previousFirstInput) + "5")
    }
    
    func test_digitInputAgainstSecondInputOfZeroDisplaysThatDigit() {
        let app = ContentViewModelTests.createApplicationWithSecondInputOfZero()
        let model = ContentViewModel(for: app)
        model.receiveDigitString("4")
        XCTAssertEqual(model.display, String(app.secondInput))
    }
    
    func test_digitInputAgainstSecondInputOfNonZeroAppendsThatDigitToDisplay() {
        let app = Application()
        app.acceptSecondInput()
        app.receiveDigit(Digit.nine)
        let previousSecondInput = app.secondInput
        
        let model = ContentViewModel(for: app)
        model.receiveDigitString("0")
        XCTAssertEqual(model.display, String(previousSecondInput) + "0")
    }
    
    func test_performingAdditionDisplaysAnApplicationsSum() {
        let app = Application()
        app.receiveDigit(Digit.two)
        app.acceptSecondInput()
        app.receiveDigit(Digit.two)
        
        let model = ContentViewModel(for: app)
        model.performOperation(.addition)
        XCTAssertEqual(model.display, "4")
    }
    
    func test_contentViewModelIsInDisplayingResultStateAfterAddition() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.performOperation(.addition)
        XCTAssertEqual(model.state, .displayingResult)
    }
    
    private static func createApplicationWithFirstInputOfZero() -> Application {
        return Application()
    }
    
    private static func createApplicationWithFirstInputOfNonZero() -> Application {
        let app = Application()
        app.receiveDigit(Digit.eight)
        return app
    }
    
    private static func createApplicationWithSecondInputOfZero() -> Application {
        let app = Application()
        app.acceptSecondInput()
        return app
    }
}
