//
//  DosePicker.swift
//  brewtimer
//
//  Created by Andrei Khegai on 27/9/21.
//

import SwiftUI

struct DosePicker: View {
    @State var stacked = true
    @Binding var selected: Int
    @State var selectedIndex: Int = 0
    let grams: [Int]
    
    init(selected: Binding<Int>, grams: [Int]) {
        self._selected = selected
        self.grams = grams
        self.selectedIndex = self.grams.first(where: { selected.wrappedValue == $0}) ?? 0
    
    }
    
    func randomOffset() -> CGFloat {
        return CGFloat(Float.random(in: -3..<3))
    }
    
    
    func getXOffset(_ index: Int) -> CGFloat {
        if (stacked) {
            return CGFloat(index) * randomOffset()
        }
        return 0
    }
    
    
    func getYOffset(_ index: Int) -> CGFloat {
        if (stacked) {
            return CGFloat(index) * randomOffset()
        }
        return CGFloat(index) * 60
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<grams.count) { index in
                Button("\(grams[index])g") {
                    self.selected = grams[index]
                    self.selectedIndex = index
                    self.stacked = !self.stacked
                    
                }.buttonStyle(DoseSelectorButtonStyle())
                    .offset(x: getXOffset(index),
                            y: getYOffset(index))
            }
            Button("\(grams[self.selectedIndex])g") {
                self.stacked = !self.stacked
            }.buttonStyle(DoseSelectorButtonStyle(isActive: true))
                .offset(x: getXOffset(self.selectedIndex),
                        y: getYOffset(self.selectedIndex))
        }
    }
}

struct DosePicker_Previews: PreviewProvider {
    @State static var gram = 0
    static var previews: some View {
        DosePicker(selected: $gram, grams: [15, 18, 20])
    }
}
