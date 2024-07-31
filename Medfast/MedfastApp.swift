//
//  MedfastApp.swift
//  Medfast
//
//  Created by Vladislav on 14.11.2023.
//

import SwiftUI

@main
struct MedfastApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
//            LoginView()
        }
    }
}
