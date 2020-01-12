//
//  ApplicationTests.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 12/10/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import XCTest
@testable import Calculator

final class ApplicationTests: XCTestCase {
    
    private var app: Application?
    
    override func setUp() {
        super.setUp()
        app = Application()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func test_aNewApplicationWillBeAcceptingItsFirstInput() {
        XCTAssertEqual(app!.state, .acceptingFirstInput)
    }
    
    func test_aFirstInputAcceptingApplicationWillHaveDigitsAppendedToItsFirstInput() {
        app!.receiveDigit(Digit.five)
        XCTAssertEqual(app!.firstInput, 5)
    }
    
    func test_aFirstInputAcceptingApplicationCanBeSwitchedToAcceptingASecondInput() {
        app!.acceptSecondInput()
        XCTAssertEqual(app!.state, .acceptingSecondInput)
    }
    
    func test_aSecondInputAcceptingApplicationWillHaveDigitsAppendedToItsSecondInput() {
        receiveFirstInput(0)
        app!.receiveDigit(Digit.three)
        XCTAssertEqual(app!.secondInput, 3)
    }
    
    func test_sumIsSumOfBothInputs() {
        receiveFirstInput(2, andSecondInput: 2)
        XCTAssertEqual(app!.sum, 4)
    }
    
    func test_differenceIsDifferenceOfBothInputs() {
        receiveFirstInput(100, andSecondInput: 55)
        XCTAssertEqual(app!.difference, 45)
    }
    
    func test_productIsProductOfBothInputs() {
        receiveFirstInput(2, andSecondInput: 7)
        XCTAssertEqual(app!.product, 14)
    }
    
    func test_quotientOfDivisionWithNonZeroDivisorIsQuotientOfBothInputs() {
        receiveFirstInput(10, andSecondInput: 5)
        XCTAssertEqual(app!.quotient, 2)
    }
    
    private func receiveInput(_ input: Int) {
        for digit in input.digits {
            app!.receiveDigit(digit)
        }
    }
    
    private func receiveFirstInput(_ firstInput: Int) {
        receiveInput(firstInput)
        app!.acceptSecondInput()
    }
    
    private func receiveSecondInput(_ secondInput: Int) {
        receiveInput(secondInput)
    }
    
    private func receiveFirstInput(_ firstInput: Int, andSecondInput secondInput: Int) {
        receiveFirstInput(firstInput)
        receiveSecondInput(secondInput)
    }
}
