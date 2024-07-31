//
//  Font+extension.swift
//  Medfast
//
//  Created by Vladislav on 16.11.2023.
//

import SwiftUI

extension Font {
    static func customFont(_ name: String, size: CGFloat, weight: Font.Weight) -> Font {
        return Font.custom(name, size: size).weight(weight)
    }
}

extension Font {
    static let heading1 = Font.customFont("Montserrat ExtraBold", size: 30, weight: .heavy)
    static let heading2 = Font.customFont("Montserrat", size: 24, weight: .heavy)
    static let heading3 = Font.custom("Montserrat semibold", size: 18)
    static let heading4 = Font.customFont("Montserrat semibold", size: 16, weight: .semibold)
    static let body = Font.custom("Montserrat Bold", size: 16)
    static let bodyMedium = Font.custom("Montserrat Medium", size: 16)
    static let smallMediumBodyText = Font.custom("Montserrat Medium", size: 14)
    static let smallBodyText = Font.custom("Montserrat Regular", size: 14)
    static let smallSemiboldBodyText = Font.customFont("Montserrat semibold", size: 14, weight: .semibold)
    static let button = Font.custom("Montserrat Regular", size: 16)
}
