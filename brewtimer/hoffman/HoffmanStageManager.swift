//
//  HoffmanStageManager.swift
//  brewtimer
//
//  Created by Andrei Khegai on 7/9/21.
//

import Foundation
import Combine

class HoffmanStageManager: ObservableObject {
    let phases: [HoffmanPhaseModel]
    var stopwatch = StopwatchManager(-5)
    var bag = Set<AnyCancellable>()
    @Published var isRunning = false
    @Published var stage = 0
    
    init(_ phases: [HoffmanPhaseModel]) {
        self.phases = phases
        self.stopwatch.$secondsElapsed.sink(receiveValue: updateStage).store(in: &self.bag)
    }
    
    func start() {
        stopwatch.start()
        isRunning = true
    }
    
    func reset() {
        stopwatch.reset()
        stage = 0;
        isRunning = false
    }
    
    func stop() {
        stopwatch.stop()
        isRunning = false
    }

    
    func updateStage(_ curSeconds: Double) {
   
        if let phase = self.phases.first(where: { phase in
            return phase.endless || phase.fromSeconds <= curSeconds && phase.toSeconds > curSeconds
        }) {
            self.stage = phase.stage
        }
    }
}
