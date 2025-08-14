//
//  CoutdownCardExpandable.swift
//  Paddock
//
//  Created by Francisco  Cortez on 8/13/25.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

// The data structure for a single session
struct ScheduleStage: Identifiable {
    let id = UUID()
    let day: String
    let shortDate: String
    let session: String
    let time: String
}

// The complete schedule data
let scheduleStages = [
    ScheduleStage(day: "FRI", shortDate: "MAR 13", session: "Practice 1", time: "12:30 - 1:30"),
    ScheduleStage(day: "FRI", shortDate: "MAR 13", session: "Practice 2", time: "16:00 - 17:00"),
    ScheduleStage(day: "SAT", shortDate: "MAR 14", session: "Practice 3", time: "11:30 - 12:30"),
    ScheduleStage(day: "SAT", shortDate: "MAR 14", session: "Qualifying", time: "15:00 - 16:00"),
    ScheduleStage(day: "SUN", shortDate: "MAR 15", session: "Race", time: "12:30 - 1:30")
]
