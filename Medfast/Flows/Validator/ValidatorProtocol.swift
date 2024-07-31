//
//  ValidatorProtocol.swift
//  Medfast
//
//  Created by Vladislav on 06.12.2023.
//

import Foundation

protocol ValidatorProtocol {
    func validate(_ value: String) -> Result<Bool, ValidationError>
}

enum ValidationError: Error {
    case invalidEmail
    case invalidPassword
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return Texts.Error.invalidEmailFormat
        case .invalidPassword:
            return Texts.Error.invalidPasswordFormat
        }
    }
}

enum RegEx {
    case email
    case password
}

extension RegEx {
    var expression: String {
        switch self {
        case .email:
            return #"^(?=.{10,50}$)([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$"#
        case .password:
            return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,50}$"
        }
    }
}
