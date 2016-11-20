//
//  BankAccount.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 14/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

enum AccountType {
    case currentAccount
    case savingsAccount
}

class BankAccount: NSObject {

    var accountName:String
    var accountNumber:String
    var sortingCode:String
    var accountType:AccountType
    var transactions:[Transaction]
    var owners:[AccountOwner]

    
    init?(accountName:String,
          accountNumber:String,
          sortingCode:String,
          accountType:AccountType,
          owners:[AccountOwner],
          accountNameValidator:AccountNameValidator? = nil,
          accountNumberValidator:AccountNumberValidator? = nil,
          sortingCodeValidator:SortingCodeValidator? = nil) {
        
        let validator1 = accountNameValidator ?? AccountNameValidator()
        if validator1.validate(accountName) == false {
            return nil
        }
 
        let validator2 = accountNumberValidator ?? AccountNumberValidator()
        if validator2.validate(accountNumber) == false {
            return nil
        }

        let validator3 = sortingCodeValidator ?? SortingCodeValidator()
        if validator3.validate(sortingCode) == false {
            return nil
        }

        if (owners.count == 0 || owners.count > 2) {
            return nil
        }
        
        self.accountName = accountName
        self.accountNumber = accountNumber
        self.sortingCode = sortingCode
        self.accountType = accountType
        self.owners = owners
        self.transactions = [Transaction]()
    }

}
