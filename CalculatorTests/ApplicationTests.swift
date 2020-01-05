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
    
    func test_aNewApplicationWillBeAcceptingItsFirstInput() {
        let app = Application()
        XCTAssertEqual(app.state, .acceptingFirstInput)
    }
    
    func test_aFirstInputAcceptingApplicationWillHaveDigitsAppendedToItsFirstInput() {
        let app = Application()
        app.receiveDigit(Digit.five)
        XCTAssertEqual(app.firstInput, 5)
    }
    
    func test_aFirstInputAcceptingApplicationCanBeSwitchedToAcceptingASecondInput() {
        let app = Application()
        app.acceptSecondInput()
        XCTAssertEqual(app.state, .acceptingSecondInput)
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
    
    func test_calculateSumAfterOnlyTheFirstInputIsGivenResultsInOuputEqualingThatInputPlusItself() {
        if let application = application {
            let inputs = [10, -3, 0, 100, -742]
            let expected = ["20", "-6", "0", "200", "-1484"]
            
            for i in 0..<inputs.count {
                application.receiveFirstInput(inputs[i])
                application.calculateSum()
                XCTAssertEqual(application.output, expected[i])
            }
        }
    }
    
    func test_resettingBeforeEnteringFirstInputOutputsZero() {
        let application = Application()
        application.reset()
        XCTAssertEqual(application.output, "0")
    }
    
    func test_resettingAfterEnteringFirstInputAndBeforeEnteringSecondInputOutputsZero() {
        let application = Application()
        application.receiveFirstInput(10)
        application.reset()
        XCTAssertEqual(application.output, "0")
        
        application.receiveFirstInput(2)
        application.receiveSecondInput(2)
        application.reset()
        XCTAssertEqual(application.output, "0")
    }
    
    func test_calculatingTheDifferenceOfBothInputsOutputsTheirDifference() {
        let application = Application()
        application.receiveFirstInput(0)
        application.receiveSecondInput(1000)
        application.calculateDifference()
        XCTAssertEqual(application.output, "-1000")
    }
}
