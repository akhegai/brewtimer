//
//  DosePickerStyle.swift
//  brewtimer
//
//  Created by Andrei Khegai on 27/9/21.
//

import Foundation
import SwiftUI

struct DoseSelectorButtonStyle: ButtonStyle {
    let isActive: Bool
    
    init(isActive: Bool = false) {
        self.isActive = isActive
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .frame(width: 56, height: 56)
            .foregroundColor(Color("brand"))
            .background(Color("darkgray"))
            .clipShape(Circle())
            .overlay(
                Capsule(style: .continuous)
                    .stroke(!isActive ? .gray : Color("brand"))
            )
            .animation(.easeIn(duration: 0.2))
    }
}
