//
//  BankAccountTests.swift
//  BankAccountTests
//
//  Created by Abhishek Mishra on 12/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest
@testable import BankAccount

class BankAccountTests: XCTestCase {
    
    private let validAccountName = "John Myers"
    private let invalidAccountName = "B.J.Clarke & Sons Plc"
    
    private let validAccountNumber = "87548390"
    private let invalidAccountNumber = "$56.9s"
    
    private let validSortingCode = "490938"
    private let invalidSortingCode = "391"
    
    private let validOwner1 = AccountOwner(firstName: "John",
                                           lastName: "Myers",
                                           emailAddress: "j.myers@absc.com")
    
    private let validOwner2 = AccountOwner(firstName: "Nina",
                                           lastName: "Myers",
                                           emailAddress: "n.myers@absc.com")
    
    private let validOwner3 = AccountOwner(firstName: "Abhishek",
                                           lastName: "Mishra",
                                           emailAddress: "a.mishra@absc.com")
    
    private var validOneOwner:[AccountOwner] = [AccountOwner]()
    private var validTwoOwners:[AccountOwner] = [AccountOwner]()
    private var invalidThreeOwners:[AccountOwner] = [AccountOwner]()
    
    override func setUp() {
        super.setUp()
        
        validOneOwner = [validOwner1!]
        validTwoOwners = [validOwner1!, validOwner2!]
        invalidThreeOwners = [validOwner1!, validOwner2!, validOwner3!]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ValidAccountName_ValidAccountNumber_ValidSortCode_CurrentAccount_OneOwner_CanBeInstantiated() {
    
        let bankAccount = BankAccount(accountName: validAccountName,
                                        accountNumber: validAccountNumber,
                                        sortingCode: validSortingCode,
                                        accountType: .currentAccount,
                                        owners:validOneOwner)
        XCTAssertNotNil(bankAccount)
    }
    
    func testInit_ValidAccountName_ValidAccountNumber_ValidSortCode_CurrentAccount_TwoOwners_CanBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .currentAccount,
                                      owners:validTwoOwners)
        XCTAssertNotNil(bankAccount)
    }
    
    func testInit_ValidAccountName_ValidAccountNumber_ValidSortCode_SavingstAccount_OneOwner_CanBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validOneOwner)
        XCTAssertNotNil(bankAccount)
    }
    
    func testInit_ValidAccountName_ValidAccountNumber_ValidSortCode_SavingsAccount_TwoOwners_CanBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validTwoOwners)
        XCTAssertNotNil(bankAccount)
    }
    
    
    
    func testInit_InvalidAccountName_ValidAccountNumber_ValidSortCode_CurrentAccount_OneOwner_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: invalidAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .currentAccount,
                                      owners:validOneOwner)
        XCTAssertNil(bankAccount)
    }
    
    func testInit_InvalidAccountName_ValidAccountNumber_ValidSortCode_SavingsAccount_OneOwner_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: invalidAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validOneOwner)
        XCTAssertNil(bankAccount)
    }
    
    
    func testInit_ValidAccountName_invalidAccountNumber_ValidSortCode_SavingstAccount_OneOwner_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: invalidAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validOneOwner)
        XCTAssertNil(bankAccount)
    }
    
    func testInit_ValidAccountName_invalidAccountNumber_ValidSortCode_SavingsAccount_OneOwner_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: invalidAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validOneOwner)
        XCTAssertNil(bankAccount)
    }
    
    
    func testInit_ValidAccountName_ValidAccountNumber_invalidSortCode_SavingstAccount_OneOwner_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: invalidSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validOneOwner)
        XCTAssertNil(bankAccount)
    }
    
    func testInit_ValidAccountName_ValidAccountNumber_invalidSortCode_SavingsAccount_OneOwner_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: invalidSortingCode,
                                      accountType: .savingsAccount,
                                      owners:validOneOwner)
        XCTAssertNil(bankAccount)
    }
    
    func testInit_ValidAccountName_ValidAccountNumber_ValidSortCode_CurrentAccount_ThreeOwners_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .currentAccount,
                                      owners:invalidThreeOwners)
        XCTAssertNil(bankAccount)
    }
    
    func testInit_ValidAccountName_ValidAccountNumber_ValidSortCode_SavingsAccount_ThreeOwners_CanNotBeInstantiated() {
        
        let bankAccount = BankAccount(accountName: validAccountName,
                                      accountNumber: validAccountNumber,
                                      sortingCode: validSortingCode,
                                      accountType: .savingsAccount,
                                      owners:invalidThreeOwners)
        XCTAssertNil(bankAccount)
    }

    
    func testInit_AllValidParameters_CallsValidateOnAccountNameValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockAccountNameValidator = MockAccountNameValidator(expectation, expectedValue:validAccountName)
        
        let _ = BankAccount(accountName: validAccountName,
                            accountNumber: validAccountNumber,
                            sortingCode: validSortingCode,
                            accountType: .savingsAccount,
                            owners:validOneOwner,
                            accountNameValidator:mockAccountNameValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testInit_AllValidParameters_CallsValidateOnAccountNumberValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockAccountNumberValidator = MockAccountNumberValidator(expectation, expectedValue:validAccountNumber)
        
        let _ = BankAccount(accountName: validAccountName,
                            accountNumber: validAccountNumber,
                            sortingCode: validSortingCode,
                            accountType: .savingsAccount,
                            owners:validOneOwner,
                            accountNameValidator:nil,
                            accountNumberValidator:mockAccountNumberValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testInit_AllValidParameters_CallsValidateOnSortingCodeValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockSortingCodeValidator = MockSortingCodeValidator(expectation, expectedValue:validSortingCode)
        
        let _ = BankAccount(accountName: validAccountName,
                            accountNumber: validAccountNumber,
                            sortingCode: validSortingCode,
                            accountType: .savingsAccount,
                            owners:validOneOwner,
                            accountNameValidator:nil,
                            accountNumberValidator:nil,
                            sortingCodeValidator:mockSortingCodeValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
