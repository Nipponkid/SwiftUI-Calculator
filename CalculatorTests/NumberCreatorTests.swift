//
//  InputProcessor.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 11/25/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import XCTest
@testable import Calculator

class NumberCreatorTests: XCTestCase {
    var numberCreator: NumberCreator?

    override func setUp() {
        super.setUp()
        numberCreator = NumberCreator()
    }

    override func tearDown() {
        numberCreator = nil
        super.tearDown()
    }

    func test_theFirstDigitAppendedResultsInANumberMadeUpOfOnlyThatDigit() {
        let inputs = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        if let numberCreator = numberCreator {
            for i in 0..<inputs.count {
                numberCreator.append(digit: inputs[i])
                XCTAssertEqual(numberCreator.number, expected[i])
            }
        }
    }

}
