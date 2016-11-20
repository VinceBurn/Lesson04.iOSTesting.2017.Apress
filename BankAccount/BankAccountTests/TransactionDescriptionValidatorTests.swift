//
//  TransactionDescriptionValidatorTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 13/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class TransactionDescriptionValidatorTests: XCTestCase {
    
    fileprivate let validDescription1 = "Internet Trasnfer"
    fileprivate let validDescription2 = "NETBANX 989-9382"
    fileprivate let validDescription3 = "GBRMIDL98143"
    
    fileprivate let invalidDescription1 = "84729949392GBRMIDL98143"
    
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
extension TransactionDescriptionValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = TransactionDescriptionValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}


// MARK: valid descriptions
extension TransactionDescriptionValidatorTests {
    
    func testValidate_validDescription1_ReturnsTrue() {
        let validator = TransactionDescriptionValidator()
        XCTAssertTrue(validator.validate(validDescription1), "/(validDescription1) should be valid.")
    }

    func testValidate_validDescription2_ReturnsTrue() {
        let validator = TransactionDescriptionValidator()
        XCTAssertTrue(validator.validate(validDescription2), "/(validDescription2) should be valid.")
    }

    func testValidate_validDescription3_ReturnsTrue() {
        let validator = TransactionDescriptionValidator()
        XCTAssertTrue(validator.validate(validDescription3), "/(validDescription3) should be valid.")
    }
}

// MARK: invalid descriptions
extension TransactionDescriptionValidatorTests {
    
    func testValidate_invalidDescription1_ReturnsFalse() {
        let validator = TransactionDescriptionValidator()
        XCTAssertFalse(validator.validate(invalidDescription1), "/(invalidDescription1) should not be valid.")
    }
    
}

