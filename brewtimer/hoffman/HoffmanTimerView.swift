//
//  HoffmanTimerView.swift
//  brewtimer
//
//  Created by Andrei Khegai on 25/8/21.
//

import SwiftUI
import Combine

let allPhases = [
    PhaseModel(name: "ready?", fromSeconds: -5, toSeconds: 0, stage: 0),
    PhaseModel(name: "blooming", fromSeconds: 0.0, toSeconds: 30.0, stage: 1),
    PhaseModel(name: "strength", fromSeconds: 30, toSeconds: 75, stage: 2),
    PhaseModel(name: "end", fromSeconds: 75, toSeconds: 180, stage: 3, endless: true)
]

struct HoffmanTimerView: View {
    @ObservedObject var stageManager = StageManager(allPhases)
    @State() var gram: Int = 15
    let phases: [PhaseModel]
    
    init() {
        self.phases = allPhases
    }
    
    
    var body: some View {
        VStack {
            Text("\(gram)g").font(.title)
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
                HStack(alignment: .top) {
                    Spacer()
                    Button(action: self.stageManager.start) {
                        Text("Brew").font(.title)
                    }.buttonStyle(StartButtonStyle())
                    Spacer()
                    DosePicker(selected: $gram, grams: [15, 18, 20])
                }
             
                
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
