//
//  PasswordValidator.swift
//  Medfast
//
//  Created by Vladislav on 06.12.2023.
//

import Foundation


struct PasswordValidator: ValidatorProtocol {
    let passwordRegex = RegEx.password.expression
    
    func validate(_ value: String) -> Result<Bool, ValidationError> {
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValid = passwordPredicate.evaluate(with: value)
        if isValid {
            return .success(true)
        } else {
            return .failure(.invalidPassword)
        }
    }
}
