//
//  ApplicationTests.swift
//  CalculatorTests
//
//  Created by Wesley Brown on 12/10/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import XCTest
@testable import Calculator

class ApplicationTests: XCTestCase {
    
    private var application: Application?
    
    override func setUp() {
        super.setUp()
        application = Application()
    }

    override func tearDown() {
        application = nil
        super.tearDown()
    }

    func test_initialApplicationHasOutputOfZero() {
        if let application = application {
            XCTAssertEqual(application.output, "0")
        }
    }
    
    func test_receiveFirstInputResultsInOutputEqualingIt() {
        if let application = application {
            let inputs = [1, Int.max, Int.min, 0, -123456]
            let expected = ["1", String(Int.max), String(Int.min), "0",
                            "-123456"]
            
            for i in 0..<inputs.count {
                application.receiveFirstInput(inputs[i])
                XCTAssertEqual(application.output, expected[i])
            }
        }
    }
    
    func test_receiveSecondInputResultsInOutputEqualingIt() {
        if let application = application {
            let inputs = [1, Int.max, Int.min, 0, -123456]
            let expected = ["1", String(Int.max), String(Int.min), "0",
                            "-123456"]
            
            for i in 0..<inputs.count {
                application.receiveSecondInput(inputs[i])
                XCTAssertEqual(application.output, expected[i])
            }
        }
    }
    
    func test_calculateSumWithoutReceivingEitherInputResultsInOutputEqualingZero() {
        if let application = application {
            application.calculateSum()
            XCTAssertEqual(application.output, "0")
        }
    }
    
    func test_calculateSumResultsInOutputEqualingTheSumOfBothInputs() {
        if let application = application {
            let inputs = [(2, 2), (-5, 543), (-99999, 10000), (-5, -25), (0, 0)]
            let expected = ["4", "538", "-89999", "-30", "0"]
            
            for i in 0..<inputs.count {
                application.receiveFirstInput(inputs[i].0)
                application.receiveSecondInput(inputs[i].1)
                application.calculateSum()
                XCTAssertEqual(application.output, expected[i])
            }
        }
    }
}
