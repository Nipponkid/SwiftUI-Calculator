//
//  ContentViewModelTests.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 1/5/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

@testable import Calculator
import XCTest

final class ContentViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_aNewContentViewModelIsInAcceptingFirstInputState() {
        let app = Application()
        let model = ContentViewModel(for: app)
        XCTAssertEqual(model.state, .acceptingFirstInput)
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
    
    func test_isInOperationSpecifiedStateAfterAnOperationIsSpecified() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        XCTAssertEqual(model.state, .operationSpecified)
    }
    
    func test_applicationIsInAcceptingSecondInputStateAfterOperationIsSpecified() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        XCTAssertEqual(app.state, .acceptingSecondInput)
    }
    
    func test_digitInputInOperationSpecifiedStateIsDisplayed() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        
        model.receiveDigitString("6")
        XCTAssertEqual(model.display, "6")
    }
    
    func test_isInDisplayingSecondInputStateAfterFirstDigitIsEnteredInOperationSpecifiedState() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        model.receiveDigitString("0")
        XCTAssertEqual(model.state, .displayingSecondInput)
    }
    
    func test_digitInputAgainstSecondInputOfZeroDisplaysThatDigit() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        model.receiveDigitString("4")
        XCTAssertEqual(model.display, "4")
    }
    
    func test_isInDisplayingResultStateAfterPerformingOperation() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        model.performOperation()
        XCTAssertEqual(model.state, .displayingResult)
    }
    
    func test_isDisplayingSumOfBothApplicationInputsAfterPerformingAddition() {
        let app = Application()
        let model = ContentViewModel(for: app)
        
        model.receiveDigitString("2")
        model.specifyOperation(.addition)
        model.receiveDigitString("2")
        model.performOperation()
        XCTAssertEqual(model.display, "4")
    }
    
    func test_digitInputAgainstSecondInputOfNonZeroAppendsThatDigitToDisplay() {
        let app = Application()
        let model = ContentViewModel(for: app)
        
        model.specifyOperation(.addition)
        model.receiveDigitString("9")
        model.receiveDigitString("0")
        XCTAssertEqual(model.display, "90")
    }
    
    func test_isInAcceptingFirstInputStateAfterResettingWhileInOperationSpecifiedState() {
        let app = Application()
        let model = ContentViewModel(for: app)
        
        model.receiveDigitString("0")
        model.receiveDigitString("2")
        
        model.reset()
        XCTAssertEqual(model.state, .acceptingFirstInput)
    }
    
    func test_displayingZeroAfterResettingAfterFirstInputGiven() {
        let app = Application()
        let model = ContentViewModel(for: app)
        
        model.receiveDigitString("7")
        model.reset()
        XCTAssertEqual(model.display, "0")
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
