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

    private var model: ContentViewModel?
    
    override func setUp() {
        super.setUp()
        model = ContentViewModel(for: Application())
    }

    override func tearDown() {
        model = nil
        super.tearDown()
    }
    
    func test_aNewContentViewModelIsInAcceptingFirstInputState() {
        XCTAssertEqual(model!.state, .acceptingFirstInput)
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
        model!.specifyOperation(.addition)
        XCTAssertEqual(model!.state, .operationSpecified)
    }
    
    func test_applicationIsInAcceptingSecondInputStateAfterOperationIsSpecified() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.specifyOperation(.addition)
        XCTAssertEqual(app.state, .acceptingSecondInput)
    }
    
    func test_digitInputInOperationSpecifiedStateIsDisplayed() {
        acceptSecondInput()
        model!.receiveDigitString("6")
        XCTAssertEqual(model!.display, "6")
    }
    
    func test_isInDisplayingSecondInputStateAfterFirstDigitIsEnteredInOperationSpecifiedState() {
        acceptSecondInput()
        model!.receiveDigitString("0")
        XCTAssertEqual(model!.state, .displayingSecondInput)
    }
    
    func test_digitInputAgainstSecondInputOfZeroDisplaysThatDigit() {
        receiveFirstInput("0", for: .addition)
        model!.receiveDigitString("4")
        XCTAssertEqual(model!.display, "4")
    }
    
    func test_isInDisplayingResultStateAfterPerformingOperation() {
        model!.specifyOperation(.addition)
        model!.performOperation()
        XCTAssertEqual(model!.state, .displayingResult)
    }
    
    func test_isDisplayingSumOfBothApplicationInputsAfterPerformingAddition() {
        receiveFirstInput("2", for: .addition)
        model!.receiveDigitString("2")
        model!.performOperation()
        XCTAssertEqual(model!.display, "4")
    }
    
    func test_digitInputAgainstSecondInputOfNonZeroAppendsThatDigitToDisplay() {
        receiveFirstInput("0", for: .addition)
        model!.receiveDigitString("9")
        model!.receiveDigitString("0")
        XCTAssertEqual(model!.display, "90")
    }
    
    func test_isInAcceptingFirstInputStateAfterResetting() {
        receiveFirstInput("02")
        model!.reset()
        XCTAssertEqual(model!.state, .acceptingFirstInput)
    }
    
    func test_displayingZeroAfterResetting() {
        receiveFirstInput("7")
        model!.reset()
        XCTAssertEqual(model!.display, "0")
    }
    
    func test_displaysDifference() {
        receiveFirstInput("62", for: .subtraction)
        model!.receiveDigitString("3")
        model!.receiveDigitString("0")
        model!.receiveDigitString("0")
        model!.performOperation()
        XCTAssertEqual(model!.display, "-238")
    }
    
    func test_isInAcceptingFirstInputStateAfterDigitInputInDisplayingResultsState() {
        receiveFirstInput("0", for: .subtraction)
        model!.performOperation()
        model!.receiveDigitString("2")
        XCTAssertEqual(model!.state, .acceptingFirstInput)
    }
    
    func test_displaysProduct() {
        receiveFirstInput("9", for: .multiplication)
        model!.receiveDigitString("1")
        model!.receiveDigitString("1")
        model!.performOperation()
        XCTAssertEqual(model!.display, "99")
    }
    
    func test_displaysQuotientIfSecondInputForDivisionIsNotZero() {
        receiveFirstInput("30", for: .division)
        model!.receiveDigitString("5")
        model!.performOperation()
        XCTAssertEqual(model!.display, "6")
    }
    
    func test_isInDisplayingErrorStateIfSecondInputForDivisionIsZero() {
        receiveFirstInput("2", for: .division)
        model!.receiveDigitString("0")
        model!.performOperation()
        XCTAssertEqual(model!.state, .displayingError)
    }
    
    func test_displaysErrorIfSecondInputForDivisionIsZero() {
        receiveFirstInput("93", for: .division)
        model!.receiveDigitString("0")
        model!.performOperation()
        XCTAssertEqual(model!.display, "Error")
    }
    
    private func receiveFirstInput(_ digitSequence: String) {
        for digitCharacter in digitSequence {
            model!.receiveDigitString(String(digitCharacter))
        }
    }
    
    private func receiveFirstInput(_ digitSequence: String,
                                   for operation: ContentViewModel.Operation) {
        receiveFirstInput(digitSequence)
        model!.specifyOperation(operation)
    }
    
    private func acceptSecondInput() {
        model!.specifyOperation(.addition)
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
