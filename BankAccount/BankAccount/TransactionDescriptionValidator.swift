//
//  TransactionDescriptionValidator.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 13/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class TransactionDescriptionValidator: NSObject {

    func validate(_ value:String) -> Bool {
        
        if ((value.characters.count < 1) || (value.characters.count > 20)) {
            return false
        }

        return true
    }
    
}
