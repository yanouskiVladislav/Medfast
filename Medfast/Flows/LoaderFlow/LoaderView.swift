//
//  LoaderView.swift
//  Medfast
//
//  Created by Vladislav on 01.12.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack() {
            Image(Images.logoTopImage)
                .resizable()
                .frame(height: 503)
                .padding(.top, 0)
            AnimatedLogo()
            Image(Images.logoBottomImage)
                .resizable()
                .frame(height: 472)
                .padding(.bottom, 0)
        }
    }
}
