//
//  ValidationMock.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 13/05/2022.
//

import Foundation


class ValidationMock {
    class func isValidMobileNumber(_ text: String) -> Bool {
        return text.count == 10
    }
    
    class func isValidLandlineNumber(_ text: String) -> Bool {
        return text.count == 6 && text.first == "4"
    }
    
    class func isValidAlShamilNumber(_ text: String) -> Bool {
        return text.count == 4 && text.first == "8"
    }
}
