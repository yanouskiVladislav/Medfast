//
//  ViewModelWrapper.swift
//  Medfast
//
//  Created by Vladislav on 23.11.2023.
//

import SwiftUI

class ViewModelWrapper: ObservableObject {
    var viewModel: ViewModelProtocol

    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }
}
