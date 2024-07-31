//
//  PageIndicatorView.swift
//  Medfast
//
//  Created by Vladislav on 12.12.2023.
//

import SwiftUI

struct PageIndicatorView: View {
    let currentPage: Int
    let stepsCount: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<stepsCount, id: \.self) { page in
                if page == currentPage {
                    Rectangle()
                        .frame(width: 20, height: 8)
                        .cornerRadius(8)
                        .foregroundColor(.lightBlue)
                } else {
                    Circle()
                        .frame(width: 8, height: 8)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
