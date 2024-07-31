//
//  AbstractTextFieldViewModel.swift
//  Medfast
//
//  Created by Vladislav on 28.11.2023.
//

import SwiftUI


class AbstractTextFieldViewModel: ObservableObject {
    @Published var text = ""
    @Published var isSecureTextEntry: Bool
    @Published var validationError: ValidationError? = nil
    
    var title: String
    var placeholder: String
    var style: TextFieldStyleProtocol
    var validator: ValidatorProtocol
    
    init(title: String, placeholder: String, style: TextFieldStyleProtocol, validator: ValidatorProtocol) {
        self.title = title
        self.placeholder = placeholder
        self.style = style
        self.validator = validator
        isSecureTextEntry = style.isSecured
    }
    
    func toggleSecureEntry() {
        isSecureTextEntry.toggle()
    }
    
    func validate() {
        let validationResult = validator.validate(text)
        switch validationResult {
        case .success:
            validationError = nil
        case .failure(let error):
            validationError = error
            print("Validation failed: \(error)")
        }
    }
}
