//
//  AbstractTextFieldProtocol.swift
//  Medfast
//
//  Created by Vladislav on 23.11.2023.
//

import Foundation

protocol ViewModelProtocol {
    var title: String {get}
    var placeholder: String {get}
    var style: TextFieldStyleProtocol {get}
    var validator: ValidatorProtocol {get}
    func toggleSecureEntry()
}
