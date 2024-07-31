//
//  OnboardingView.swift
//  Medfast
//
//  Created by Vladislav on 11.12.2023.
//

//

import SwiftUI

enum OnboardingStep {
    case firstStep
    case secondStep
    case thirdStep

    var doctorImage: String {
        switch self {
        case .firstStep:
            Images.firstOnboardingScreenImage
        case .secondStep:
            Images.secondOnboardingScreenImage
        case .thirdStep:
            Images.thirdOnboardingScreenImage
        }
    }
    var textBackgroundImage: String {
        switch self {
        case .firstStep:
            Images.firstOnboardingBackgroundImage
        case .secondStep:
            Images.secondOnboardingBackgroundImage
        case .thirdStep:
            Images.thirdOnboardingBackgroundImage
        }
    }
    var text: String {
        switch self {
        case .firstStep:
            Texts.Onboarding.firstViewText
        case .secondStep:
            Texts.Onboarding.secondViewText
        case .thirdStep:
            Texts.Onboarding.thirdViewText
        }
    }

    static var allValues: [OnboardingStep] {
        return [.firstStep, .secondStep, .thirdStep]
    }
}

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            logoView
            onboardingContentView
                .edgesIgnoringSafeArea(.all)
                .overlayPreferenceValue(TextAnchorKey.self) { anchor in
                    GeometryReader { geo in
                        if let anchor = anchor {
                            PageIndicatorView(currentPage: viewModel.currentPage, stepsCount: viewModel.onboardingSteps.count)
                                .frame(maxWidth: .infinity, alignment: .bottom)
                                .position(x: geo.size.width / 2, y: geo[anchor].minY - 16)
                        }
                    }
                }
            buttonSection
        }
    }
    
    private var buttonSection: some View {
        VStack {
            Spacer()
            HStack(spacing: 25) {
                buttonView(context: viewModel.leftButtonContext)
                    .opacity(viewModel.leftButtonHidden ? 0.0 : 1.0)
                buttonView(context: viewModel.rightButtonContext)
            }
            .padding(.horizontal, 25)
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 8)
    }
    
    private var onboardingContentView: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(viewModel.onboardingSteps.indices, id: \.self) { index in
                OnboardingContentView(step: viewModel.onboardingSteps[index], currentPage: $viewModel.currentPage, stepsCount: viewModel.onboardingSteps.count)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .gesture(dragGesture)
    }
    
    private var logoView: some View {
        ZStack(alignment: .center) {
            Image(Images.onboardingLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 219, height: 219)
                .alignmentGuide(.top) { $0[.top] + 8 }
                .foregroundColor(.red)
            
            Image(Images.header)
                .resizable()
                .frame(width: 76, height: 13)
        }
    }
    
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onEnded { value in
                let translation = value.translation.width
                if translation < 0 && viewModel.currentPage < viewModel.onboardingSteps.count - 1 {
                    viewModel.currentPage += 1
                } else if translation > 0 && viewModel.currentPage > 0 {
                    viewModel.currentPage -= 1
                }
            }
    }
    
    private func buttonView(context: ButtonContext) -> some View {
        AbstractButton(title: context.title, buttonType: context.type) {
            withAnimation {
                context.action()
            }
        }
    }
}

struct OnboardingContentView: View {
    let step: OnboardingStep
    @Binding var currentPage: Int
    let stepsCount: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(step.doctorImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 5)
            
            ZStack {
                Image(step.textBackgroundImage)
                    .resizable()
                    .frame(height: 323)
                    .aspectRatio(contentMode: .fill)
                
                Text(step.text)
                    .frame(maxWidth: 350)
                    .font(.heading2)
                    .foregroundColor(.white)
                    .anchorPreference(key: TextAnchorKey.self, value: .bounds) { $0 }
                    .padding(.top, 50)
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

struct TextAnchorKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue() ?? value
    }
}
