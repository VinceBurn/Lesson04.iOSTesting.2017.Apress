//
//  LastNameValidatorTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 13/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class LastNameValidatorTests: XCTestCase {
    
    fileprivate let emptyString = ""
    
    fileprivate let singleCharacterName = "a"
    fileprivate let twoCharacterName = "ab"
    fileprivate let tenCharacterName = "abcdefghij"
    fileprivate let elevenCharacterName = "abcdefghijk"
    
    fileprivate let nameWithWhitespace = "abc def"
    fileprivate let nameWithSingleQuote = "abc'def"
    
    fileprivate let nameWithUnsupportedSpecialCharacters = "_+-.,!@#$%^&*();\\/|<>\""
    
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
extension LastNameValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: String length validation
extension LastNameValidatorTests {
    
    func testValidate_InputLessThanTwoCharachtersInLength_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(singleCharacterName), "string can not have less than 2 characters.")
    }
    
    func testValidate_InputGreaterThanTenCharachtersInLength_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(elevenCharacterName), "string can not have more than 11 characters.")
    }
    
    func testValidate_InputTwoCharachtersInLength_ReturnsTrue() {
        let validator = LastNameValidator()
        XCTAssertTrue(validator.validate(twoCharacterName), "string with 2 charachters should have been valid.")
    }
    
    func testValidate_InputTenCharachtersInLength_ReturnsTrue() {
        let validator = LastNameValidator()
        XCTAssertTrue(validator.validate(tenCharacterName), "string with 10 charachters should have been valid.")
    }
}

// MARK: white space validation
extension LastNameValidatorTests {
    
    func testValidate_InputWithWhitespace_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithWhitespace), "string can not have white space.")
    }
    
}

// MARK: special charachter validation
extension LastNameValidatorTests {
    
    func testValidate_InputWithSingleQuote_ReturnsTrue() {
        let validator = LastNameValidator()
        XCTAssertTrue(validator.validate(nameWithSingleQuote), "string with single quote should have been valid.")
    }
    
    func testValidate_InputWithSpecialCharacters_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithUnsupportedSpecialCharacters), "string can not have special characters.")
    }
    
}

// MARK: Numeric digit validation
extension LastNameValidatorTests {
    
    func testValidate_InputWithDigit0_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit0), "string can not have digit 0 in it.")
    }
    
    func testValidate_InputWithDigit1_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit1), "string can not have digit 1 in it.")
    }
    
    func testValidate_InputWithDigit2_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit2), "string can not have digit 2 in it.")
    }
    
    func testValidate_InputWithDigit3_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit3), "string can not have digit 3 in it.")
    }
    
    func testValidate_InputWithDigit4_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit4), "string can not have digit 4 in it.")
    }
    
    func testValidate_InputWithDigit5_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit5), "string can not have digit 5 in it.")
    }
    
    func testValidate_InputWithDigit6_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit6), "string can not have digit 6 in it.")
    }
    
    func testValidate_InputWithDigit7_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit7), "string can not have digit 7 in it.")
    }
    
    func testValidate_InputWithDigit8_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit8), "string can not have digit 8 in it.")
    }
    
    func testValidate_InputWithDigit9_ReturnsFalse() {
        let validator = LastNameValidator()
        XCTAssertFalse(validator.validate(nameWithDigit9), "string can not have digit 9 in it.")
    }
    
}
