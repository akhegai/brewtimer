//
//  HoffmanTimerView.swift
//  brewtimer
//
//  Created by Andrei Khegai on 25/8/21.
//

import SwiftUI
import Combine

let allPhases = [
    HoffmanPhaseModel(name: "ready?", fromSeconds: -5, toSeconds: 0, stage: 0),
    HoffmanPhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 1),
    HoffmanPhaseModel(name: "strength", fromSeconds: 30, toSeconds: 75, stage: 2),
    HoffmanPhaseModel(name: "end", fromSeconds: 75, toSeconds: 180, stage: 3, endless: true)
]

struct HoffmanTimerView: View {
    @ObservedObject var stageManager = HoffmanStageManager(allPhases)
    let phases: [HoffmanPhaseModel]
    
    init() {
        self.phases = allPhases
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                ForEach(self.phases) { phase in
                    HoffmanPhaseRow(
                        phase: phase,
                        currentSeconds: self.stageManager.stopwatch.secondsElapsed,
                        status: phase.status(currentStage: self.stageManager.stage)
                    )
                }
            }
            Spacer()
            if !self.stageManager.isRunning {
                Button(action: self.stageManager.start) {
                    Text("Brew").font(.title)
                }.frame(width: 180, height: 180)
                .foregroundColor(Color("brand"))
                .background(Color("darkgray"))
                .clipShape(Circle())
            }
            
            Spacer()
        }
    }
}

struct HoffmanTimerView_Previews: PreviewProvider {
    static var previews: some View {
        HoffmanTimerView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
