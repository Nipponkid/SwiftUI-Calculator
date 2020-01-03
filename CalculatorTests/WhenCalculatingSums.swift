//
//  WhenCalculatingSums.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 1/3/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

@testable import Calculator
import XCTest

final class WhenCalculatingSums: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_theResultOfAddingTwoNumbersIsTheirSum() {
        let application = Application()
        let sum = application.add(2, to: 2)
        XCTAssertEqual(sum, 4)
    }
}
