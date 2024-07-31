//
//  LoginValidator.swift
//  Medfast
//
//  Created by Vladislav on 22.11.2023.
//

import Foundation

struct EmailValidator: ValidatorProtocol {
    let emailRegex = RegEx.email.expression
    
    func validate(_ value: String) -> Result<Bool, ValidationError> {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValid = emailPredicate.evaluate(with: value)
        
        if isValid {
            return .success(true)
        } else {
            return .failure(.invalidEmail)
        }
    }
}
