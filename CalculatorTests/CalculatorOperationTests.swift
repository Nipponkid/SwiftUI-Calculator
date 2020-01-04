//
//  OperationTests.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 1/3/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

@testable import Calculator
import XCTest

final class CalculatorOperationTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_aNewOperationGivenNoInputsHasAFirstAndSecondInputOfZero() {
        let operation = CalculatorOperation()
        XCTAssertEqual(operation.firstInput, 0)
        XCTAssertEqual(operation.secondInput, 0)
    }
    
    func test_aNewOperationGivenAFirstInputHasASecondInputOfZero() {
        let operation = CalculatorOperation(withFirstInput: 10)
        XCTAssertEqual(operation.firstInput, 10)
        XCTAssertEqual(operation.secondInput, 0)
    }
}
