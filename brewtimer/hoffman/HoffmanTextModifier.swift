//
//  HoffmanTextModifier.swift
//  brewtimer
//
//  Created by Andrei Khegai on 25/8/21.
//

import SwiftUI

struct HoffmanTextModifier: ViewModifier {
    let isActive: Bool
    
    func body(content: Content) -> some View {
        
        content
            .font(self.isActive ? .largeTitle : .title2)
        
            

    }
}
