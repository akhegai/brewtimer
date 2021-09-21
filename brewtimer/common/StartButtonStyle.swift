//
//  StartButtonStyles.swift
//  brewtimer
//
//  Created by Andrei Khegai on 18/9/21.
//

import Foundation
import SwiftUI

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(width: 180, height: 180)
            .foregroundColor(Color("brand"))
            .background(Color("darkgray"))
            .clipShape(Circle())
    }
}
