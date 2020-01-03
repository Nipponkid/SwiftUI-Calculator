//
//  WhenInputtingDigits.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 1/2/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

@testable import Calculator
import XCTest

final class WhenInputtingDigits: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_theyAppendToTheEndOfExistingNumbersToCreateNewOnes() {
        let zero = 0
        let one = zero.appendDigit(Digit.one)
        XCTAssertEqual(one, 1)
        
        let twelve = one.appendDigit(Digit.two)
        XCTAssertEqual(twelve, 12)
    }
}
