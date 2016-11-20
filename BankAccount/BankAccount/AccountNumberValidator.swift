//
//  AccountNumberValidator.swift
//  BankAccount
//
//  Created by Abhishek Mishra on 14/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class AccountNumberValidator: NSObject {

    func validate(_ value:String) -> Bool {
        
        if value.characters.count != 8 {
            return false
        }
        
        let whitespace = Set(" ".characters)
        if (value.characters.filter {whitespace.contains($0)}).count > 0 {
            return false
        }
        
        let uppercaseAlphabets = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
        if (value.characters.filter {uppercaseAlphabets.contains($0)}).count > 0 {
            return false
        }
        
        let lowercaseAlphabets = Set("abcdefghijklmnopqrstuvwxyz".characters)
        if (value.characters.filter {lowercaseAlphabets.contains($0)}).count > 0 {
            return false
        }
        
        let specialCharacters = Set("_+-.,!@#$%^&*();\\/|<>\"".characters)
        if (value.characters.filter {specialCharacters.contains($0)}).count > 0 {
            return false
        }
        
        guard let regexValidator = try? NSRegularExpression(pattern: "([0-9])", options: .caseInsensitive) else {
            return false
        }
        
        if regexValidator.numberOfMatches(in: value,
                                          options: NSRegularExpression.MatchingOptions.reportCompletion,
                                          range: NSMakeRange(0, value.characters.count)) > 0 {
            return true
        }

        
        return false
    }
    
}
