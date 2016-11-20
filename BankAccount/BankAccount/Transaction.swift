//
//  Transaction.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 13/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class Transaction: NSObject {
    
    var txDescription:String
    var date:NSDate
    var isIncoming:Bool
    var amount:String
    
    init?(txDescription:String, date:NSDate, isIncoming:Bool, amount:String,
          descriptionValidator:TransactionDescriptionValidator? = nil,
          amountValidator:AmountValidator? = nil) {
        
        let validator1 = descriptionValidator ?? TransactionDescriptionValidator()
        if validator1.validate(txDescription) == false {
            return nil
        }
        
        let validator2 = amountValidator ?? AmountValidator()
        if validator2.validate(amount) == false {
            return nil
        }
    
        
        self.txDescription = txDescription
        self.date = date
        self.isIncoming = isIncoming
        self.amount = amount
    }
    
}
