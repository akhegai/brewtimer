//
//  HoffmanPhaseModel.swift
//  brewtimer
//
//  Created by Andrei Khegai on 27/8/21.
//

import Foundation


enum HoffmanPhaseStatus {
    case prev
    case current
    case next
    case far
}

struct HoffmanPhaseModel: Identifiable {
    var id: String
    let name: String
    let fromSeconds: Double
    let toSeconds: Double
    let stage: Int
    let endless: Bool
    
    init(name: String, fromSeconds: Double, toSeconds: Double, stage: Int, endless: Bool = false) {
        self.id = name
        self.name = name
        self.fromSeconds = fromSeconds
        self.toSeconds = toSeconds
        self.stage = stage
        self.endless = endless
    }
    
    func status(currentStage: Int) -> HoffmanPhaseStatus {
        if currentStage > stage {
            return .prev
        }
        if currentStage == stage {
            return .current
        }
        if (currentStage + 1) == stage {
            return .next
        }
        return .far
    }
}
