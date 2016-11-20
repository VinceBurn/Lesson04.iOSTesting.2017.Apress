//
//  AmountValidatorTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 13/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class AmountValidatorTests: XCTestCase {
    
    fileprivate let validAmount1 = "22.98"
    fileprivate let validAmount2 = "22.9"
    fileprivate let validAmount3 = "2.98"
    fileprivate let validAmount4 = "2.9"
    
    fileprivate let invalidAmount1 = "-22.98"
    fileprivate let invalidAmount2 = "$22.98"
    fileprivate let invalidAmount3 = "£22.98"
    fileprivate let invalidAmount4 = "22."
    fileprivate let invalidAmount5 = ".98"
    
    fileprivate let emptyString = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}

// MARK: Empty string validation
extension AmountValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = AmountValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: valid amounts
extension AmountValidatorTests {
    
    func testValidate_validAmount1_ReturnsTrue() {
        let validator = AmountValidator()
        XCTAssertTrue(validator.validate(validAmount1), "/(validAmount1) should be valid.")
    }

    func testValidate_validAmount2_ReturnsTrue() {
        let validator = AmountValidator()
        XCTAssertTrue(validator.validate(validAmount2), "/(validAmount2) should be valid.")
    }
    
    func testValidate_validAmount3_ReturnsTrue() {
        let validator = AmountValidator()
        XCTAssertTrue(validator.validate(validAmount3), "/(validAmount3) should be valid.")
    }
    
    func testValidate_validAmount4_ReturnsTrue() {
        let validator = AmountValidator()
        XCTAssertTrue(validator.validate(validAmount4), "/(validAmount4) should be valid.")
    }
    
}

// MARK: invalid amounts
extension AmountValidatorTests {
    
    func testValidate_invalidAmount1_ReturnsFalse() {
        let validator = AmountValidator()
        XCTAssertFalse(validator.validate(invalidAmount1), "/(invalidAmount1) should not be valid.")
    }

    func testValidate_invalidAmount2_ReturnsFalse() {
        let validator = AmountValidator()
        XCTAssertFalse(validator.validate(invalidAmount2), "/(invalidAmount2) should not be valid.")
    }
    
    func testValidate_invalidAmount3_ReturnsFalse() {
        let validator = AmountValidator()
        XCTAssertFalse(validator.validate(invalidAmount3), "/(invalidAmount3) should not be valid.")
    }
    
    func testValidate_invalidAmount4_ReturnsFalse() {
        let validator = AmountValidator()
        XCTAssertFalse(validator.validate(invalidAmount4), "/(invalidAmount4) should not be valid.")
    }
    
    func testValidate_invalidAmount5_ReturnsFalse() {
        let validator = AmountValidator()
        XCTAssertFalse(validator.validate(invalidAmount5), "/(invalidAmount5) should not be valid.")
    }
    
}
