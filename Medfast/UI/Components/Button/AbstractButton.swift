//
//  GenericButton.swift
//  Medfast
//
//  Created by Vladislav on 08.12.2023.
//
import SwiftUI


struct AbstractButton: View {
    var title: String
    var buttonType: AbstractButtonViewModel.ButtonType
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(buttonType.font)
                .transaction { transaction in
                       transaction.animation = nil
                   }
        }
        .frame(maxWidth: .infinity, minHeight: buttonType.height)
        .background(
            RoundedRectangle(cornerRadius: buttonType.cornerRadius)
                .fill(LinearGradient(gradient: Gradient(colors: buttonType.gradientColors),
                                     startPoint: .top, endPoint: .bottom))
        )
        .foregroundColor(buttonType.foregroundColor)
        .cornerRadius(buttonType.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: buttonType.cornerRadius)
                .stroke(buttonType.borderColor ?? .clear, lineWidth: buttonType.borderWidth ?? 0)
        )
    }
}
