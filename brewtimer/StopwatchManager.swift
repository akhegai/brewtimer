//
//  StopwatchManager.swift
//  brewtimer
//
//  Created by Andrei Khegai on 25/8/21.
//

import Foundation
import Combine

class StopwatchManager: ObservableObject {
    var timer: Timer? = Timer()
    let initialValue: Double
    @Published var secondsElapsed: Double
    
    init(_ initialValue: Double = 0.0) {
        self.secondsElapsed = initialValue
        self.initialValue = initialValue
    }

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
        }
    }
    
    func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func reset() {
        self.stop()
        self.secondsElapsed = initialValue
    }
}
