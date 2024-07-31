//
//  AnimatedLogo.swift
//  Medfast
//
//  Created by Vladislav on 01.12.2023.
//

import SwiftUI

struct AnimatedLogo: View {
    @State private var scale: CGFloat = 1.0
    @State private var isScaled = false
    
    var body: some View {
        Image(Images.logo)
            .resizable()
            .scaledToFit()
            .frame(width: Constants.width, height: Constants.height)
            .scaleEffect(scale)
            .onAppear() {
                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                    self.isScaled.toggle()
                    self.scale = self.isScaled ? 1.5 : 0.5
                }
            }
    }
}

private extension AnimatedLogo {
    enum Constants {
        static let width = CGFloat(120)
        static let height = CGFloat(120)
    }
}
