//
//  AbstractButtonViewModel.swift
//  Medfast
//
//  Created by Vladislav on 08.12.2023.
//

import SwiftUI

// TO DO: Invistigate width with  case text
final class AbstractButtonViewModel {
    var type: AbstractButtonViewModel.ButtonType
    var state: ButtonState
    var title: String

    init(title: String, type: AbstractButtonViewModel.ButtonType, state: ButtonState = .active) {
        self.type = type
        self.state = state
        self.title = title
    }

    var height: CGFloat {
        type.height
    }

    enum ButtonState {
        case active
        case inactive
        case loading
    }

    enum ButtonType {
        case gradient
        case white
        case transparent
        case text
        
        var font: Font { return .body }
        var isPressedButtonOpacity: CGFloat { return CGFloat(0.5) }
        var unpressedButtonPressedOpacity: CGFloat { return CGFloat(1) }
        var cornerRadius: CGFloat { return CGFloat(8) }
        
        var borderWidth: CGFloat? {return (1)}
        
        var maxWidth: CGFloat? {
            switch self {
            case .gradient:
                return CGFloat(345)
            case .white:
                return CGFloat(106)
            case .transparent:
                return CGFloat(106)
            case .text:
                return .none
            }
        }
        
        var height: CGFloat {
            switch self {
            case .gradient:
                return CGFloat(56)
            case .white:
                return CGFloat(56)
            case .transparent:
                return CGFloat(52)
            case .text:
                return CGFloat(20)
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .gradient, .transparent:
                return .white
            case .white, .text:
                return . mainPurple
            }
        }
        
        var gradientColors: [Color] {
            switch self {
            case .gradient:
                return [Color.mainPurple.opacity(1), Color.mainPurple.opacity(0.8)]
            case .white:
                return [Color.white.opacity(1), Color.white.opacity(1)]
            case .transparent:
                return [Color.clear.opacity(1), Color.clear.opacity(1)]
            case .text:
                return [Color.clear.opacity(1), Color.clear.opacity(1)]
            }
        }
        
        var borderColor: Color? {
            switch self {
            case .gradient:
                return .none
            case .white:
                return .none
            case .transparent:
                return .white
            case .text:
                return .none
            }
        }
    }
}
