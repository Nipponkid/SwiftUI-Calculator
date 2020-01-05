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

    func test_givingFirstInputDisplaysThatFirstInput() {
        let app = Application()
        let model = ContentViewModel(for: app)
        model.receiveDigitString("2")
        XCTAssertEqual(model.display, "2")
    }
}
