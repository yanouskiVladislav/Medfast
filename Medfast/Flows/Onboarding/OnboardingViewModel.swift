//
//  OnboardingViewModel.swift
//  Medfast
//
//  Created by Vladislav on 11.12.2023.
//

import SwiftUI

struct ButtonContext {
    let title: String
    let type: AbstractButtonViewModel.ButtonType
    let action: () -> Void
}

class OnboardingViewModel: ObservableObject {
    @Published var currentPage = 0
    let firstPageIndex = 0
    
    lazy var onboardingSteps = OnboardingStep.allValues

    var leftButtonContext: ButtonContext {
        return currentPage == firstPageIndex
        ? ButtonContext(title: Texts.Onboarding.skip, type: .transparent, action: skipButtonAction)
        : ButtonContext(title: Texts.Onboarding.getStarted, type: .transparent, action: nextButtonAction)
    }

    var leftButtonHidden: Bool {
        return currentPage == 2
    }

    var rightButtonContext: ButtonContext {
        return currentPage == firstPageIndex
        ? ButtonContext(title: Texts.Onboarding.next, type: .white, action: nextButtonAction)
        : ButtonContext(title: Texts.Onboarding.getStarted, type: .white, action: getStartedButtonAction)
    }
    
    func buttonView(context: ButtonContext) -> some View {
        AbstractButton(title: context.title, buttonType: context.type) {
            withAnimation {
                context.action()
            }
        }
    }
    
    func skipButtonAction() {
        print("skipButtonAction() ")
    }
    
    func signInButtonAction() {
        print("singInButtonAction()")
    }
    
    var shouldShowSkipButton: Bool {
        return currentPage == 0
    }
    
    func getStartedButtonAction() {
        print("getStartedButtonAction()")
    }
    
    func nextButtonAction() {
        if currentPage == 0 {
            if currentPage < onboardingSteps.count - 1 {
                withAnimation {
                    currentPage += 1
                }
            } else {
                getStartedButtonAction()
            }
            
        }
    }
}

