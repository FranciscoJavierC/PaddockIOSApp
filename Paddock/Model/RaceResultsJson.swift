//
//  RaceResults.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/29/25.
//

import Foundation
import SwiftUI

struct RaceData: Codable, Identifiable {
    
    // We can use 'round' as the unique ID for Identifiable
    var id: Int { round }
    
    let round: Int
    let country: String
    let location: String
    let full_race_results: [DriverResult]
}

// This struct represents a SINGLE driver's result within that race
struct DriverResult: Codable, Identifiable, Hashable {
    
    // We can use 'driver' as a unique ID *within* a single race
    var id: String { driver }
    
    let position: Int?
    let driver: String
    let time_or_gap: String
    let points: Int
    let status: String
}

class RaceResultsModel: ObservableObject {
    @Published var allRaceData: [RaceData] = []

    func loadRaceResults() {
        guard let url = Bundle.main.url(forResource: "full_race_results_2025", withExtension: "json") else {
            print("JSON file not found!")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            // Decode it as an array of [RaceData]
            let decoder = JSONDecoder()
            //decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.allRaceData = try decoder.decode([RaceData].self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

extension RaceResultsModel {
    func podium(for round: Int) -> [DriverResult] {
        guard let race = allRaceData.first(where: { $0.round == round }) else { return [] }
        return Array(race.full_race_results.prefix(3))
    }
}
