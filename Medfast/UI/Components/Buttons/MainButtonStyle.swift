//
//  MainButtonStyle.swift
//  Medfast
//
//  Created by Vladislav on 16.11.2023.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle { 
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: Constants.maxWidth, maxHeight: Constants.maxHeight, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.mainPurple.opacity(1), Color.mainPurple.opacity(0.8)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            )
            .foregroundColor(.white)
            .opacity(configuration.isPressed ? Constants.isPressedButtonOpacity : Constants.unpressedButtonPressedOpacity)
            .font(Font.body)
    }
}


private extension MainButtonStyle {
    enum Constants {
        static let maxWidth = CGFloat(345)
        static let maxHeight = CGFloat(56)
        static let cornerRadius = CGFloat(24)
        static let isPressedButtonOpacity = 0.5
        static let unpressedButtonPressedOpacity = CGFloat(1)
    }
}
