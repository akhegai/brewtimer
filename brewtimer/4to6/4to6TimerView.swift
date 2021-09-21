//
//  FourToSixTimerView.swift
//  brewtimer
//
//  Created by Andrei Khegai on 25/8/21.
//

import SwiftUI
import Combine



struct FourToSixTimerView: View {
    @ObservedObject var stageManager: StageManager
    let phases: [PhaseModel]
    
    init() {
        self.phases = [
            PhaseModel(name: "ready?", fromSeconds: -5, toSeconds: 0, stage: 0),
            PhaseModel(name: "acidity", fromSeconds: 0, toSeconds: 45, stage: 1),
            PhaseModel(name: "sweetness", fromSeconds: 45, toSeconds: 90, stage: 2),
            PhaseModel(name: "strength i", fromSeconds: 90, toSeconds: 135, stage: 3),
            PhaseModel(name: "strength ii", fromSeconds: 135, toSeconds: 180, stage: 4),
            PhaseModel(name: "strength iii", fromSeconds: 180, toSeconds: 225, stage: 5, endless: true)
        ]
        self.stageManager = StageManager(self.phases)
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                ForEach(self.phases) { phase in
                    FourToSixPhaseRow(
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
                }.buttonStyle(StartButtonStyle())
                
            }
            
            Spacer()
        }
    }
}

struct FourToSixTimerView_Previews: PreviewProvider {
    static var previews: some View {
        FourToSixTimerView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
