//
//  WhenCalculatingDifferences.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 1/3/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

@testable import Calculator
import XCTest

class WhenCalculatingDifferences: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_theResultOfSubtractingTwoNumbersIsTheirDifference() {
        let application = Application()
        let difference = application.subtract(10, from: 25)
        XCTAssertEqual(difference, 15)
    }
}
