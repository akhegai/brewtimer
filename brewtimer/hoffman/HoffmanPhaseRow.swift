//
//  HoffmanPhaseRow.swift
//  brewtimer
//
//  Created by Andrei Khegai on 27/8/21.
//

import SwiftUI


let fontSize: CGFloat = 48

struct HoffmanPhaseRow: View {
    let model: HoffmanPhaseModel
    let currentSeconds: Double
    let status: HoffmanPhaseStatus
    let textFont = Font.system(size: fontSize, weight: .light)
    let secondsFont = Font.system(size: fontSize, weight: .light)
    
    init(phase model: HoffmanPhaseModel, currentSeconds: Double, status: HoffmanPhaseStatus) {
        self.model = model
        self.currentSeconds = currentSeconds
        self.status = status
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
                Text("0s").font(secondsFont).foregroundColor(Color("gray4"))
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

struct HoffmanPhaseRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HoffmanPhaseRow(
                phase: HoffmanPhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 0),
                currentSeconds: 3.0,
                status: .prev
            )
            HoffmanPhaseRow(
                phase: HoffmanPhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 1),
                currentSeconds: 3.0,
                status: .current
            )
            HoffmanPhaseRow(
                phase: HoffmanPhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 2),
                currentSeconds: 3.0,
                status: .next
            )
            HoffmanPhaseRow(
                phase: HoffmanPhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 3),
                currentSeconds: 3.0,
                status: .far
            )
        }
    }
}
