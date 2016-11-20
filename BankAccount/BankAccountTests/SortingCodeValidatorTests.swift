//
//  SortingCodeValidatorTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 14/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class SortingCodeValidatorTests: XCTestCase {
    
    fileprivate let emptyString = ""
    
    fileprivate let validSortcodeNumber1 = "490938"
    fileprivate let validSortcodeNumber2 = "400932"
    
    fileprivate let invalidSortcodeNumber1 = "40"
    fileprivate let invalidSortcodeNumber2 = "4000000000"
    fileprivate let invalidSortcodeNumber3 = "40$!@£"
    fileprivate let invalidSortcodeNumber4 = "40 099"
    fileprivate let invalidSortcodeNumber5 = "987766"
    fileprivate let invalidSortcodeNumber6 = "4966"
    fileprivate let invalidSortcodeNumber7 = "49$!@£"
    fileprivate let invalidSortcodeNumber8 = "49 099"
    fileprivate let invalidSortcodeNumber9 = "4900000000"
    
    fileprivate let invalidSortcodeNumber10 = "ABCDEFGH"
    fileprivate let invalidSortcodeNumber11 = "IJKLMNOP"
    fileprivate let invalidSortcodeNumber12 = "QRSTUVWX"
    fileprivate let invalidSortcodeNumber13 = "YYYYZZZZ"
    fileprivate let invalidSortcodeNumber14 = "abcdefgh"
    fileprivate let invalidSortcodeNumber15 = "ijklmnop"
    fileprivate let invalidSortcodeNumber16 = "qrstuvwx"
    fileprivate let invalidSortcodeNumber17 = "yyyyzzzz"
    
    
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
extension SortingCodeValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: String length validation
extension SortingCodeValidatorTests {
    
    func testValidate_InputLessThanSixCharachtersInLength_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber1), "string can not have less than 6 characters.")
    }
    
    func testValidate_InputGreaterThanSixCharachtersInLength_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber2), "string can not have more than 6 characters.")
    }
    
    func testValidate_InputSixCharachtersInLength_ReturnsTrue() {
        let validator = SortingCodeValidator()
        XCTAssertTrue(validator.validate(validSortcodeNumber1), "string with 6 charachters should have been valid.")
    }
    
}

// MARK: white space validation
extension SortingCodeValidatorTests {
    
    func testValidate_InputWithWhitespace_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber4), "string can not have white space.")
    }
    
}

// MARK: special charachter validation
extension SortingCodeValidatorTests {
    
    func testValidate_InputWithHyphen_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber3), "string can not have special characters.")
    }
}


// MARK: validate first two start digits
extension SortingCodeValidatorTests {
    
    func testValidate_SixCharInput_BeginsWith40_ReturnsTrue() {
        let validator = SortingCodeValidator()
        XCTAssertTrue(validator.validate(validSortcodeNumber1), "/(validSortcodeNumber1) should be valid.")
    }
    
    func testValidate_SixCharInput_BeginsWith49_ReturnsTrue() {
        let validator = SortingCodeValidator()
        XCTAssertTrue(validator.validate(validSortcodeNumber2), "/(validSortcodeNumber2) should be valid.")
    }
    
    func testValidate_SixCharInput_DoesNotBeginsWith40or49_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber5), "/(invalidSortcodeNumber5) should be invalid.")
    }
    
    func testValidate_LessThanSixCharInput_BeginsWith49_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber6), "/(invalidSortcodeNumber6) should be invalid.")
    }
    
    func testValidate_LessThanSixCharInput_BeginsWith40_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber1), "/(invalidSortcodeNumber1) should be invalid.")
    }
    
    func testValidate_MoreThanSixCharInput_BeginsWith49_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber9), "/(invalidSortcodeNumber9) should be invalid.")
    }
    
    func testValidate_MoreThanSixCharInput_BeginsWith40_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber2), "/(invalidSortcodeNumber2) should be invalid.")
    }
    
    func testValidate_SixCharInputWithWhiteSpace_BeginsWith40_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber4), "/(invalidSortcodeNumber4) should be invalid.")
    }
    
    func testValidate_SixCharInputWithWhiteSpace_BeginsWith49_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber8), "/(invalidSortcodeNumber8) should be invalid.")
    }
    
    func testValidate_SixCharInputWithSpecialCharacters_BeginsWith40_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber3), "/(invalidSortcodeNumber8) should be invalid.")
    }
    
    func testValidate_SixCharInputWithSpecialCharacters_BeginsWith49_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber7), "/(invalidSortcodeNumber8) should be invalid.")
    }

    
}


// MARK: Alphanumeric validation
extension SortingCodeValidatorTests {
    
    func testValidate_InputWithAlphanumericCharactersFromSet1_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber10), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet2_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber11), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet3_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber12), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet4_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber13), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet5_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber14), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet6_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber15), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet7_ReturnsFalse() {
        let validator = SortingCodeValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber16), "string can not have alphanumeric characters in it.")
    }
    
    func testValidate_InputWithAlphanumericCharactersFromSet8_ReturnsFalse() {
        let validator = AccountNumberValidator()
        XCTAssertFalse(validator.validate(invalidSortcodeNumber17), "string can not have alphanumeric characters in it.")
    }
    
    
}

