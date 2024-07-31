//
//  LoginView.swift
//  Medfast
//
//  Created by Vladislav on 16.11.2023.
//

import SwiftUI

struct LoginView: View {
    
    enum Action {
        case login
        case register
        case forgorYourPaswword
    }
    
    @ObservedObject var viewModel = LoginViewModel()
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            header
            textFieldsSection
            forgorYourPassword
            AbstractButton(title: Texts.Login.login, buttonType: .gradient) {
                viewModel.login()
            }
            .disabled(!viewModel.isLoginButtonEnabled)
            footer
        }
        .padding(.leading, Styles.Paddings.leading)
        .padding(.trailing, Styles.Paddings.trailing)
    }
}

private extension LoginView {
    
    enum Constants {
        static let logoWidth = CGFloat(72)
        static let logoHeight = CGFloat(72)
        static let logoTopPadding = CGFloat(56)
        static let logoBottomPadding = CGFloat(56)
        
        static let footterTopPadding = CGFloat(12)
        static let footterBottomPadding = CGFloat(123)
    }
    
    var header: some View {
        VStack {
            Image(Images.logo)
                .resizable()
                .frame(width: Constants.logoWidth, height: Constants.logoHeight)
                .padding(.top, Constants.logoTopPadding)
            Text(Texts.Login.header)
                .font(Font.heading1)
                .padding(.bottom, Styles.Paddings.mediumVertical)
            
            Text(Texts.Login.title)
                .font(Font.body)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, Styles.Paddings.extaLargeVertical)
        }
    }
    
    var textFieldsSection: some View {
        VStack(spacing: Styles.Paddings.mediumVertical) {
            AbstractTextField(viewModel: viewModel.emailTextFieldViewModel)
            AbstractTextField(viewModel: viewModel.passwordTextFieldViewModel)
        }
    }
    
    var forgorYourPassword: some View {
        HStack {
            Spacer()
            Button( Texts.Login.forgotPassword) {
                viewModel.forgotYourPassword()
            }
        }
        .padding(.bottom, Styles.Paddings.mediumVertical)
        .font(Font.smallSemiboldBodyText)
        .foregroundColor(Color.mainPurple)
    }
    
    var footer: some View {
        HStack {
            Text(Texts.Login.dontHaveAnAccount)
                .foregroundColor(Color.primaryBlack)
                .font(Font.heading4)
            
            Button(Texts.Login.register) {
                viewModel.register()
            }
            .foregroundColor(Color.mainPurple)
            .font(.heading4)
            
        }
        .padding(.top, Constants.footterTopPadding)
        .padding(.bottom, Constants.footterBottomPadding)
     
    }
}
