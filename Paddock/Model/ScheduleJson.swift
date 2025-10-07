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
    let Session1Date: Date
    let Session5Date: Date
    let circuitId: String?
    let circuitName: String?
    
    var id: String { circuitId ?? UUID().uuidString }
    
    enum CodingKeys: String, CodingKey {
            case RoundNumber
            case Country
            case Location = "Location"
            case Session1Date
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
        if let url = Bundle.main.url(forResource: "schedule_2025", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                races = try decoder.decode([RaceSchedule].self, from: data)
            } catch {
                print("Failed to load JSON:", error)
            }
        } else {
            print("schedule_2025.json not found in bundle")
        }
    }
}

extension RaceSchedule {
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

