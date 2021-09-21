//
//  HoffmanPhaseRow.swift
//  brewtimer
//
//  Created by Andrei Khegai on 27/8/21.
//

import SwiftUI



struct FourToSixPhaseRow: View {
    let fontSize: CGFloat = 36
    
    let model: PhaseModel
    let currentSeconds: Double
    let status: HoffmanPhaseStatus
    let textFont: Font
    let secondsFont: Font
    
    init(phase model: PhaseModel, currentSeconds: Double, status: HoffmanPhaseStatus) {
        self.model = model
        self.currentSeconds = currentSeconds
        self.status = status
        self.textFont = Font.system(size: fontSize, weight: .light)
        self.secondsFont = Font.system(size: fontSize, weight: .light)
    }
    
    var body: some View {
        let deltaSeconds = abs(self.model.toSeconds - self.model.fromSeconds)
        
        switch status {
        case .prev:
            return HStack(alignment: .center, content: {
                Text(self.model.name)
                    .font(textFont)
                    .strikethrough()
                    .foregroundColor(Color("gray4"))
                Spacer()
                Text("0s").font(secondsFont).foregroundColor(Color("gray4")).strikethrough()
            })
        case .current:
            return HStack(alignment: .center, content: {
                Text(self.model.name).font(textFont)
                Spacer()
                Text("\(String(format: "%.0f", self.model.toSeconds - self.currentSeconds))s").font(secondsFont).foregroundColor(Color("brand"))
            })
        case .next:
            return HStack(alignment: .center, content: {
                Text(self.model.name).font(textFont).foregroundColor(Color("gray2"))
                Spacer()
                Text("\(String(format: "%.0f", deltaSeconds))s").font(secondsFont).foregroundColor(Color("gray2"))
            })
        case .far:
            return HStack(alignment: .center, content: {
                Text(self.model.name).font(textFont).foregroundColor(Color("gray4"))
                Spacer()
                Text("\(String(format: "%.0f", deltaSeconds))s").font(secondsFont).foregroundColor(Color("gray4"))
            })
        }

    }
}

struct FourToSixPhaseRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HoffmanPhaseRow(
                phase: PhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 0),
                currentSeconds: 3.0,
                status: .prev
            )
            HoffmanPhaseRow(
                phase: PhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 1),
                currentSeconds: 3.0,
                status: .current
            )
            HoffmanPhaseRow(
                phase: PhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 2),
                currentSeconds: 3.0,
                status: .next
            )
            HoffmanPhaseRow(
                phase: PhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 3),
                currentSeconds: 3.0,
                status: .far
            )
        }
    }
}
