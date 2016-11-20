//
//  AccountOwnerTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 12/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class AccountOwnerTests: XCTestCase {
    
    private let validFirstName = "Andrew"
    private let validLastName = "Hill"
    private let validEmailAddress = "a.hill@abcfinancial.com"
    
    private let invalidFirstName = "A"
    private let invalidLastName = "h"
    private let invalidEmailAddress = "abcfinancial.com"
    
    private let emptyString = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmail_CanBeInstantiated() {
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: validLastName,
                                        emailAddress: validEmailAddress)
        XCTAssertNotNil(accountOwner)
    }
    
    func testAccountOwner_InvalidFirstName_ValidLastName_ValidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: invalidFirstName,
                                        lastName: validLastName,
                                        emailAddress: validEmailAddress)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_InvalidFirstName_InvalidLastName_ValidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: invalidFirstName,
                                        lastName: invalidLastName,
                                        emailAddress: validEmailAddress)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_InvalidFirstName_InvalidLastName_InvalidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: invalidFirstName,
                                        lastName: invalidLastName,
                                        emailAddress: invalidEmailAddress)
        XCTAssertNil(accountOwner)
    }
    

    func testAccountOwner_ValidFirstName_InvalidLastName_ValidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: invalidLastName,
                                        emailAddress: validEmailAddress)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_ValidFirstName_ValidLastName_InvalidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: validLastName,
                                        emailAddress: invalidEmailAddress)
        XCTAssertNil(accountOwner)
    }
  
    func testAccountOwner_ValidFirstName_InvalidLastName_InvalidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: invalidLastName,
                                        emailAddress: invalidEmailAddress)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_EmptyFirstName_ValidLastName_ValidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: emptyString,
                                        lastName: validLastName,
                                        emailAddress: validEmailAddress)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_ValidFirstName_EmptyLastName_ValidEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: emptyString,
                                        emailAddress: validEmailAddress)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_ValidFirstName_ValidLastName_EmptyEmail_CanNotBeInstantiated() {
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: validLastName,
                                        emailAddress: emptyString)
        XCTAssertNil(accountOwner)
    }
    
    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmailAddress_ValidFirstNameValidator_CallsValidateOnValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockFirstNameValidator = MockFirstNameValidator(expectation, expectedValue:validFirstName)
        
        let _ = AccountOwner(firstName: validFirstName,
                             lastName: validLastName,
                             emailAddress: validEmailAddress,
                             firstNameValidator:mockFirstNameValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmailAddress_ValidLastNameValidator_CallsValidateOnValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockLastNameValidator = MockLastNameValidator(expectation, expectedValue:validLastName)
        
        let _ = AccountOwner(firstName: validFirstName,
                             lastName: validLastName,
                             emailAddress: validEmailAddress,
                             firstNameValidator:nil,
                             lastNameValidator:mockLastNameValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmailAddress_ValidEmailAddressValidator_CallsValidateOnValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockEmailAddressValidator = MockEmailAddressValidator(expectation, expectedValue:validEmailAddress)
        
        let _ = AccountOwner(firstName: validFirstName,
                             lastName: validLastName,
                             emailAddress: validEmailAddress,
                             firstNameValidator:nil,
                             lastNameValidator:nil,
                             emailAddressValidator:mockEmailAddressValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmailAddress_CopiesFirstNameToIVAR() {
   
        let accountOwner = AccountOwner(firstName: validFirstName,
                             lastName: validLastName,
                             emailAddress: validEmailAddress)
        
        let isEqual = accountOwner!.firstName.compare(validFirstName) == .orderedSame
        XCTAssertTrue(isEqual)
    }

    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmailAddress_CopiesLastNameToIVAR() {
        
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: validLastName,
                                        emailAddress: validEmailAddress)
        
        let isEqual = accountOwner!.lastName.compare(validLastName) == .orderedSame
        XCTAssertTrue(isEqual)
    }

    func testAccountOwner_ValidFirstName_ValidLastName_ValidEmailAddress_CopiesEmailAddressToIVAR() {
        
        let accountOwner = AccountOwner(firstName: validFirstName,
                                        lastName: validLastName,
                                        emailAddress: validEmailAddress)
        
        let isEqual = accountOwner!.emailAddress.compare(validEmailAddress) == .orderedSame
        XCTAssertTrue(isEqual)
    }
    
}
