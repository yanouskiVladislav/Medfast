//
//  AbstractTextField.swift
//  Medfast
//
//  Created by Vladislav on 23.11.2023.


import SwiftUI

struct AbstractTextField: View {
    @ObservedObject var viewModel: AbstractTextFieldViewModel
    @FocusState var isTextFieldFocused: Bool
    
    init(viewModel: AbstractTextFieldViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .padding(.bottom, Constants.bottomPadding)
            HStack {
                textField
                button
                    .padding(.trailing, Constants.hStackTralingPadding)
            }
            .padding(Constants.hStackPadding)
            .frame(maxWidth: .infinity, maxHeight: Constants.hStackMaxHeight, alignment: .leading)
            .background(Color.white)
            .cornerRadius(Constants.cornerRadius)
            
            .overlay(
                Group { //TO DO: Separate the textField with parameters and groups into separate variables to make the structure in the body easier to read
                    if viewModel.validationError != nil {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(Constants.errorBorderColor, lineWidth: Constants.borderLineWidth)
                    } else {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(Constants.borderColor, lineWidth: Constants.borderLineWidth)
                    }
                }
            )
            
            if let error = viewModel.validationError {
                Text(error.errorDescription ?? Texts.Error.unknownError)
                    .foregroundColor(.red)
                    .padding(.bottom, Constants.bottomPadding)
            }
        }
    }
    
    @ViewBuilder
    private var textField: some View {
        Group {
            if viewModel.isSecureTextEntry {
                SecureField(viewModel.placeholder, text: $viewModel.text)
            } else {
                TextField(viewModel.placeholder, text: $viewModel.text)
            }
        }
        .focused($isTextFieldFocused)
        
        .onChange(of: isTextFieldFocused) { focused in
            if !focused {
                viewModel.validate()
            }
        }
        .onSubmit {
            viewModel.validate()
        }
    }
    
    private var button: some View {
        Button(action: {
            viewModel.toggleSecureEntry()
        }) {
            if let imageModel = viewModel.style.imagesModel {
                Image(viewModel.isSecureTextEntry ? imageModel.showPasswordImageName: imageModel.hidePasswordImageName)
                    .resizable()
                    .frame(width: Constants.buttonIHeight, height: Constants.buttonIconWidth)
            }
        }
    }
}

private extension AbstractTextField {
    enum Constants {
        static let bottomPadding = CGFloat(8)
        
        static let buttonIconWidth = CGFloat(24)
        static let buttonIHeight = CGFloat(24)
        
        static let cornerRadius = CGFloat(12)
        
        static let hStackPadding = CGFloat(16)
        static let hStackTralingPadding = CGFloat(8)
        static let hStackMaxHeight = CGFloat(56)
        
        static let borderColor = Color(red: 0.6, green: 0.6, blue: 0.6)
        static let errorBorderColor = Color(.red)
        
        static let borderLineWidth = CGFloat(1)
    }
}
