//
//  ScheduleJson.swift
//  Paddock
//
//  Created by Francisco  Cortez on 9/28/25.
//

import Foundation
import SwiftUI

struct RaceSchedule: Codable, Identifiable {
    let RoundNumber: Int
    let Country: String
    let Location: String
    let Session1: String
    let Session1Date: Date
    let Session2: String
    let Session2Date: Date
    let Session3: String
    let Session3Date: Date
    let Session4: String
    let Session4Date: Date
    let Session5: String
    let Session5Date: Date
    let circuitId: String?
    let circuitName: String?
    
    var id: Int { RoundNumber }
    
    enum CodingKeys: String, CodingKey {
            case RoundNumber
            case Country
            case Location = "Location"
            case Session1
            case Session1Date
            case Session2
            case Session2Date
            case Session3
            case Session3Date
            case Session4
            case Session4Date
            case Session5
            case Session5Date
            case circuitId
            case circuitName
        }
}

class ScheduleViewModel: ObservableObject {
    @Published var races: [RaceSchedule] = []
    
    init() {
        loadSchedule()
    }
    
    func loadSchedule() {
        // Make sure your JSON file is in the app bundle
        if let url = Bundle.main.url(forResource: "schedule_2026", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZZZ"
                formatter.locale = Locale(identifier: "en_US_POSIX") // Important for consistency
                
                // Tell the decoder to use this specific format
                decoder.dateDecodingStrategy = .formatted(formatter)
                races = try decoder.decode([RaceSchedule].self, from: data)
            } catch {
                print("Failed to load JSON:", error)
            }
        } else {
            print("schedule_2026.json not found in bundle")
        }
    }
}

extension RaceSchedule {
    // Replace the existing `currentOrNextSession` with this one

    var currentOrNextSession: (name: String, date: Date)? {
        let now = Date()
        let sessions: [(name: String, date: Date)] = [
            (Session1, Session1Date), (Session2, Session2Date),
            (Session3, Session3Date), (Session4, Session4Date), (Session5, Session5Date)
        ]
        
        // Find the most recent session that is still considered "live"
        if let currentSession = sessions.last(where: { session in
            // First, check if the session has started
            guard session.date <= now else { return false }
            
            // --- THIS IS THE NEW DYNAMIC LOGIC ---
            var liveDuration: TimeInterval = 0 // Duration in seconds
            
            // Use a switch to set the duration based on the session name
            switch session.name.uppercased() {
            case "PRACTICE 1", "PRACTICE 2", "PRACTICE 3, QUALIFYING", "SPRINT QUALIFYING", "SPRINT":
                liveDuration = 1.5 * 3600 // 1 hour 30 minutes
            case "RACE":
                liveDuration = 2.5 * 3600 // 2 hours 30 minutes
            default:
                liveDuration = 1.5 * 3600 // A safe default
            }
            
            // Return true only if the session started within its specific live window
            return now.timeIntervalSince(session.date) < liveDuration
        }) {
            return currentSession
        }
        
        // If no session is live, find the next one in the future
        return sessions.first { $0.date > now }
    }
    
    var dayRange: String {
        let calendar = Calendar.current
        let startDay = calendar.component(.day, from: Session1Date)
        let endDay = calendar.component(.day, from: Session5Date)
        return "\(startDay)-\(endDay)"
    }
    
    var dayRangeWithMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        let start = formatter.string(from: Session1Date)
        let endDay = Calendar.current.component(.day, from: Session5Date)
        return "\(start)-\(endDay)"
    }
    
    var displayCountry: String {
            switch Country {
            case "United Arab Emirates":
                return "Abu Dhabi"
            default:
                return Country
            }
        }
}

