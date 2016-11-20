//
//  AccountNumberValidatorTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 14/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class AccountNumberValidatorTests: XCTestCase {
    
    fileprivate let emptyString = ""
    
    fileprivate let validAccountNumber1 = "87548390"
    fileprivate let validAccountNumber2 = "00000000"
    
    fileprivate let invalidAccountNumber1 = "1"
    fileprivate let invalidAccountNumber2 = "A98-582"
    fileprivate let invalidAccountNumber3 = "£400.58"
    fileprivate let invalidAccountNumber4 = "$!@£%^&*()"
    fileprivate let invalidAccountNumber5 = "876546783920"
    fileprivate let invalidAccountNumber6 = "1234 67"
    
    fileprivate let invalidAccountNumber7 = "ABCDEFGH"
    fileprivate let invalidAccountNumber8 = "IJKLMNOP"
    fileprivate let invalidAccountNumber9 = "QRSTUVWX"
    fileprivate let invalidAccountNumber10 = "YYYYZZZZ"
    fileprivate let invalidAccountNumber11 = "abcdefgh"
    fileprivate let invalidAccountNumber12 = "ijklmnop"
    fileprivate let invalidAccountNumber13 = "qrstuvwx"
    fileprivate let invalidAccountNumber14 = "yyyyzzzz"

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
extension AccountNumberValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: String length validation
extension AccountNumberValidatorTests {
    
    func testValidate_InputLessThanEightCharachtersInLength_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber1), "string can not have less than 8 characters.")
    }
    
    func testValidate_InputGreaterThanEightCharachtersInLength_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber5), "string can not have more than 11 characters.")
    }
    
    func testValidate_InputEightCharachtersInLength_ReturnsTrue() {
        let validator = AccountNumberValidator()
        XCTAssertTrue(validator.validate(validAccountNumber1), "string with 8 charachters should have been valid.")
    }

}

// MARK: white space validation
extension AccountNumberValidatorTests {
    
    func testValidate_InputWithWhitespace_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber6), "string can not have white space.")
    }
    
}

// MARK: special charachter validation
extension AccountNumberValidatorTests {
    
    
    func testValidate_InputWithHyphen_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber2), "string can not have special characters.")
    }
    
    func testValidate_InputWithCurrencySymbol_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber3), "string can not have special characters.")
    }
    
    func testValidate_InputWithSpecialCharacters_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber4), "string can not have special characters.")
    }
    
}

// MARK: Alphanumeric validation
extension AccountNumberValidatorTests {
    
    func testValidate_InputWithAlphanumericCharactersFromSet1_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber7), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet2_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber8), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet3_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber9), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet4_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber10), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet5_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber11), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet6_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber12), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet7_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber13), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet8_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidAccountNumber14), "string can not have alphanumeric characters in it.")
    }

    
}
