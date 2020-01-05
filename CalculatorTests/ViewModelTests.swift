//
//  ViewModelTests.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 12/29/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import XCTest
@testable import Calculator

class ViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_aNewContentViewModelDisplaysAnApplicationsFirstInput() {
        let app = Application()
        let viewModel = ContentViewModel(for: app)
        XCTAssertEqual(viewModel.display, String(app.firstInput))
    }
    
    func test_digitInputAgainstADisplayOfZeroReplacesDisplayWithThatDigit() {
        let model = ContentViewModel(for: Application())
        model.receiveDigitString("5")
        XCTAssertEqual(model.display, "5")
    }
    
    func test_sendingInputToApplicationAcceptingFirstInputDisplaysThatFirstInput() {
        let app = Application()
        app.receiveDigit(Digit.two)
        
        let model = ContentViewModel(for: app)
        model.sendInput()
        XCTAssertEqual(model.display, String(app.firstInput))
    }
    
    func test_sendingInputToApplicationAcceptingSecondInputDisplaysThatSecondInput() {
        let app = Application()
        app.acceptSecondInput()
        app.receiveDigit(Digit.eight)
        
        let model = ContentViewModel(for: app)
        model.sendInput()
        XCTAssertEqual(model.display, String(app.secondInput))
    }
    
    func test_sendingInputToApplicationAcceptingFirstInputChangesToAcceptingSecondInput() {
        let app = Application()
        
        let model = ContentViewModel(for: app)
        model.sendInput()
        XCTAssertEqual(app.state, .acceptingSecondInput)
    }

    func test_inputtingDigitsForSecondInputDisplaysThatNumber() {
        let app = Application()
        app.receiveDigit(Digit.two)
        app.acceptSecondInput()
        
        let viewModel = ContentViewModel(for: app)
        viewModel.inputDigit("2")
        XCTAssertEqual(viewModel.display, "2")
    }

    func test_pressingAdditionButtonDisplaysSumOfBothInputs() {
        let fourDisplay = ContentViewModel(for: Application())
        fourDisplay.inputDigit("2")
        fourDisplay.sendFirstInput()
        fourDisplay.inputDigit("2")
        fourDisplay.calculateSum()
        XCTAssertEqual(fourDisplay.display, "4")

        let twentyDisplay = ContentViewModel(for: Application())
        twentyDisplay.inputDigit("1")
        twentyDisplay.inputDigit("5")
        twentyDisplay.sendFirstInput()
        twentyDisplay.inputDigit("5")
        twentyDisplay.calculateSum()
        XCTAssertEqual(twentyDisplay.display, "20")
    }

    func test_inputtingAMultiDigitSecondInputDisplaysThatNumber() {
        let model = ContentViewModel(for: Application())
        model.sendFirstInput()
        model.inputDigit("1")
        model.inputDigit("0")
        XCTAssertEqual(model.display, "10")
    }

    func test_resettingBeforeAnyInputsDisplaysZero() {
        let model = ContentViewModel(for: Application())
        model.reset()
        XCTAssertEqual(model.display, "0")
    }

    func test_resettingAfterEitherInputDisplaysZero() {
        let model = ContentViewModel(for: Application())
        model.inputDigit("2")
        model.sendFirstInput()
        model.reset()
        XCTAssertEqual(model.display, "0")

        model.inputDigit("2")
        model.sendFirstInput()
        model.inputDigit("500")
        model.reset()
        XCTAssertEqual(model.display, "0")
    }
}
