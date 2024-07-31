//
//  AbstractTextFieldStyles.swift
//  Medfast
//
//  Created by Vladislav on 23.11.2023.
//

import SwiftUI

protocol TextFieldStyleProtocol {
    var borderColor: Color {get}
    var bgColor: Color {get}
    var colorError: Color {get}
    var keyBoardStyle: UIKeyboardType {get}
    var isSecured: Bool {get}
    var imagesModel: AbstractTextFieldImagesModel? {get}
    //TO DO: addded formater in furute
}



enum TextFieldStyles {
    case PasswordTextStyle(PasswordDefaultTextViewStyle)
}

struct EmailDefaultTextViewStyle: TextFieldStyleProtocol {
    var imagesModel: AbstractTextFieldImagesModel? = nil
    var borderColor: Color = .gray
    var bgColor: Color = .clear
    var colorError: Color = .red
    var keyBoardStyle: UIKeyboardType = .default
    var isSecured: Bool = false
}


struct PasswordDefaultTextViewStyle: TextFieldStyleProtocol {
    var imagesModel: AbstractTextFieldImagesModel? = AbstractTextFieldImagesModel(showPasswordImageName: Images.Icon.eyeOff, hidePasswordImageName: Images.Icon.eyeOn)
    var borderColor: Color = .gray
    var bgColor: Color = .clear
    var colorError: Color = .red
    var keyBoardStyle: UIKeyboardType = .default
    var isSecured: Bool = true
}



