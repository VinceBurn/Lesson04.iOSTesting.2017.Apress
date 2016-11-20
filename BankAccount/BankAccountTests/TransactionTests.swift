//
//  TransactionTests.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 13/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class TransactionTests: XCTestCase {
    
    private let validDescription = "Funds transfer 1"
    
    private let emptyString = ""
    private let validDate = NSDate()
    
    private let validIncomingTransaction = true
    private let validOutgoingTransaction = false
    
    private let validAmount = "22.98"
    private let invalidAmount = "-22.98"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTransaction_ValidDescription_ValidDate_IncomingIsTrue_ValidAmount_CanBeInstantiated() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount)
        
        XCTAssertNotNil(transaction)
    }

    func testTransaction_ValidDescription_ValidDate_IncomingIsFalse_ValidAmount_CanBeInstantiated() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validOutgoingTransaction,
                                      amount: validAmount)
        
        XCTAssertNotNil(transaction)
    }
    
    func testTransaction_EmptyDescription_ValidDate_IncomingIsTrue_ValidAmount_CanNotBeInstantiated() {
        
        let transaction = Transaction(txDescription: emptyString,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount)
        
        XCTAssertNil(transaction)
    }
    
    func testTransaction_EmptyDescription_ValidDate_IncomingIsFalse_ValidAmount_CanNotBeInstantiated() {
        
        let transaction = Transaction(txDescription: emptyString,
                                      date: validDate,
                                      isIncoming: validOutgoingTransaction,
                                      amount: validAmount)
        
        XCTAssertNil(transaction)
    }
    
    func testTransaction_ValidDescription_ValidDate_IncomingIsTrue_InvalidAmount_CanNotBeInstantiated() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: invalidAmount)
        
        XCTAssertNil(transaction)
    }
    
    func testTransaction_ValidDescription_ValidDate_IncomingIsFalse_InvalidAmount_CanNotBeInstantiated() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validOutgoingTransaction,
                                      amount: invalidAmount)
        
        XCTAssertNil(transaction)
    }
    
    func testTransaction_ValidDescription_ValidDate_IncomingIsTrue_EmptyAmount_CanNotBeInstantiated() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: emptyString)
        
        XCTAssertNil(transaction)
    }
    
    func testTransaction_ValidDescription_ValidDate_IncomingIsFalse_EmptyAmount_CanNotBeInstantiated() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validOutgoingTransaction,
                                      amount: emptyString)
        
        XCTAssertNil(transaction)
    }
    
    
    func testTransaction_AllValidArguments_CallsValidateOnDescriptionValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockValidator = MockTransactionDescriptionValidator(expectation, expectedValue:validDescription)
        
        let _ = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount,
                                      descriptionValidator:mockValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testTransaction_AllValidArguments_CallsValidateOnAmountValidator() {
        
        let expectation = self.expectation(description: "Expected validate to be called on validator.")
        let mockValidator = MockAmountValidator(expectation, expectedValue:validAmount)
        
        let _ = Transaction(txDescription: validDescription,
                            date: validDate,
                            isIncoming: validIncomingTransaction,
                            amount: validAmount,
                            descriptionValidator:nil,
                            amountValidator:mockValidator)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testTransaction_AllValidArguments_CopiesDescriptionToIVAR() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount)
        
        let isEqual = transaction!.txDescription.compare(validDescription) == .orderedSame
        XCTAssertTrue(isEqual)
    }
    
    func testTransaction_AllValidArguments_CopiesDateToIVAR() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount)
        
        XCTAssertTrue(transaction!.date.isEqual(to: validDate as Date))
    }
    
    func testTransaction_AllValidArguments_CopiesIncomingStatusToIVAR() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount)
        
        let isEqual = transaction!.isIncoming == validIncomingTransaction
        XCTAssertTrue(isEqual)
    }
    
    func testTransaction_AllValidArguments_CopiesOutgoingToIVAR() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validOutgoingTransaction,
                                      amount: validAmount)
        
        let isEqual = transaction!.isIncoming == validOutgoingTransaction
        XCTAssertTrue(isEqual)
    }
    
    func testTransaction_AllValidArguments_CopiesAmountToIVAR() {
        
        let transaction = Transaction(txDescription: validDescription,
                                      date: validDate,
                                      isIncoming: validIncomingTransaction,
                                      amount: validAmount)
        
        let isEqual = transaction!.amount.compare(validAmount) == .orderedSame
        XCTAssertTrue(isEqual)
    }
    
}
