//
//  AccountNameValidatorTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 14/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class AccountNameValidatorTests: XCTestCase {
    
    fileprivate let emptyString = ""
    
    fileprivate let singleCharacterName = "a"
    fileprivate let twoCharacterName = "ab"
    fileprivate let tenCharacterName = "ACME INC 9"
    fileprivate let twentyCharacterName = "BJ.Clarke & Sons Plc"
    fileprivate let twentyoneCharacterName = "B.J.Clarke & Sons Plc"
    
    fileprivate let nameWithDigit0 = "abc00"
    fileprivate let nameWithDigit1 = "abc11"
    fileprivate let nameWithDigit2 = "abc22"
    fileprivate let nameWithDigit3 = "abc33"
    fileprivate let nameWithDigit4 = "abc44"
    fileprivate let nameWithDigit5 = "abc55"
    fileprivate let nameWithDigit6 = "abc66"
    fileprivate let nameWithDigit7 = "abc77"
    fileprivate let nameWithDigit8 = "abc88"
    fileprivate let nameWithDigit9 = "abc99"
    
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
extension AccountNameValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: String length validation
extension AccountNameValidatorTests {
    
    func testValidate_InputLessThanTwoCharachtersInLength_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertFalse(validator.validate(singleCharacterName), "string can not have less than 2 characters.")
    }
    
    func testValidate_InputGreaterThanTwentyCharachtersInLength_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertFalse(validator.validate(twentyoneCharacterName), "string can not have more than 20 characters.")
    }
    
    func testValidate_InputTwoCharachtersInLength_ReturnsTrue() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(twoCharacterName), "string with 2 charachters should have been valid.")
    }
    
    func testValidate_InputTwentyCharachtersInLength_ReturnsTrue() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(twentyCharacterName), "string with 30 charachters should have been valid.")
    }
}

// MARK: Numeric digit validation
extension AccountNameValidatorTests {
    
    func testValidate_InputWithDigit0_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit0), "string with digit 0 should have been valid.")
    }
    
    func testValidate_InputWithDigit1_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit1), "string with digit 1 should have been valid.")
    }
    
    func testValidate_InputWithDigit2_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit2), "string with digit 2 should have been valid.")
    }
    
    func testValidate_InputWithDigit3_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit3), "string with digit 3 should have been valid.")
    }
    
    func testValidate_InputWithDigit4_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit4), "string with digit 4 should have been valid.")
    }
    
    func testValidate_InputWithDigit5_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit5), "string with digit 5 should have been valid.")
    }
    
    func testValidate_InputWithDigit6_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit6), "string with digit 6 should have been valid.")
    }
    
    func testValidate_InputWithDigit7_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit7), "string with digit 7 should have been valid.")
    }
    
    func testValidate_InputWithDigit8_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit8), "string with digit 8 should have been valid.")
    }
    
    func testValidate_InputWithDigit9_ReturnsFalse() {
        let validator = AccountNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit9), "string with digit 9 should have been valid.")
    }
    
}
