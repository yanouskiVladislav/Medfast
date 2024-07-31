//
//  LoginViewModel.swift
//  Medfast
//
//  Created by Vladislav on 16.11.2023.
//

import Combine

final class LoginViewModel: ObservableObject {
    @Published private var isEmailEmpty = true
    @Published private var isPasswordEmpty = true
    @Published private var isEmailValid = false
    @Published private var isPasswordValid = false
    
    private var actionSubject = PassthroughSubject<LoginView.Action, Never>()
    
    var isLoginButtonEnabled: Bool {
        return !isEmailEmpty && !isPasswordEmpty
    }
    
    var actionIntent: AnyPublisher<LoginView.Action, Never> {
        actionSubject.eraseToAnyPublisher()
    }
    
    var emailTextFieldViewModel = AbstractTextFieldViewModel(
        title: Texts.Login.emailAdress,
        placeholder: Texts.Login.emailPlaceholder,
        style: EmailDefaultTextViewStyle(),
        validator: EmailValidator()
    )
    
    var passwordTextFieldViewModel = AbstractTextFieldViewModel(
        title: Texts.Login.password,
        placeholder: Texts.Login.passwordPlaceholder,
        style: PasswordDefaultTextViewStyle(),
        validator: PasswordValidator()
    )
    
    init() {
        setupPublishers()
    }
    
    func login() {
        let textFields = [emailTextFieldViewModel, passwordTextFieldViewModel]
        var allFieldsValid = true
        
        for textFieldViewModel in textFields {
            let validationResult = textFieldViewModel.validator.validate(textFieldViewModel.text)
            
            switch validationResult {
            case .success:
                textFieldViewModel.validationError = nil
                
            case .failure(let error):
                print("Validation error: \(error)")
                textFieldViewModel.validationError = error
                allFieldsValid = false
            }
        }
        
        if allFieldsValid {
            actionSubject.send(.login)
        }
    }
    
    func register() {
        actionSubject.send(.register)
        print("register function")
    }
    
    func forgotYourPassword() {
        actionSubject.send(.forgorYourPaswword)
        print("ForgotYourPassword function")
    }
}

private extension LoginViewModel {
    func setupPublishers() {
        emailTextFieldViewModel.$text.map {$0.isEmpty}.assign(to: &$isEmailEmpty)
        passwordTextFieldViewModel.$text.map {$0.isEmpty}.assign(to: &$isPasswordEmpty)
        emailTextFieldViewModel.$validationError.map {$0 == nil}.assign(to: &$isEmailValid)
        passwordTextFieldViewModel.$validationError.map {$0 == nil}.assign(to: &$isPasswordValid)
    }
}
