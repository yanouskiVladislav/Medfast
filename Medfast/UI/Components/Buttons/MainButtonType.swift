//
//  MainButton.swift
//  Medfast
//
//  Created by Vladislav on 16.11.2023.
//

import Foundation

enum MainButtonType {
    case loginIn

    var MainButtonText: String {
        switch self {
        case .loginIn:
            return Texts.Login.login
        }
    }
}
