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

    func test_initialDisplayIsInitialApplicationOutput() {
        let application = Application()
        let viewModel = ContentViewModel(for: application)
        XCTAssertEqual(viewModel.display, application.output)
    }

    func test_inputtingASingleDigitFirstInputDisplaysThatDigit() {
        let fiveDisplay = ContentViewModel(for: Application())
        fiveDisplay.inputDigit("5")
        XCTAssertEqual(fiveDisplay.display, "5")
        
        let nineDisplay = ContentViewModel(for: Application())
        nineDisplay.inputDigit("9")
        XCTAssertEqual(nineDisplay.display, "9")
    }
    
    func test_inputtingAMultiDigitFirstInputDisplaysThatNumber() {
        let viewModel = ContentViewModel(for: Application())
        viewModel.inputDigit("5")
        viewModel.inputDigit("9")
        XCTAssertEqual(viewModel.display, "59")
    }
    
    func test_inputtingDigitsForSecondInputDisplaysThatNumber() {
        let viewModel = ContentViewModel(for: Application())
        viewModel.inputDigit("2")
        viewModel.sendFirstInput()
        viewModel.inputDigit("0")
        viewModel.inputDigit("2")
        XCTAssertEqual(viewModel.display, "2")
    }
}
