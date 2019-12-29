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

}
