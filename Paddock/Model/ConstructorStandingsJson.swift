//
//  ConstructorStandingsJson.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/1/25.
//

import Foundation
import SwiftUI

struct ConstructorStandings: Codable, Identifiable {
    let ConstructorName: String
    let Points: Int
    let Position: Int
    let Drivers: [String]
    let DriverPoints: [Int]
    let TeamColorHex: String
    let constructorId: String?
    
    var TeamColor: Color { Color(hex: TeamColorHex) }
    
    var id: String { constructorId ?? UUID().uuidString }
    
    enum CodingKeys: String, CodingKey {
        case ConstructorName = "constructorName"
        case Points = "points"
        case Position = "position"
        case Drivers = "drivers"
        case DriverPoints = "driverPoints"
        case TeamColorHex = "teamColor"
        case constructorId = "constructorId"
    }
}

class ConstructorStandingsModel: ObservableObject {
    @Published var constructors: [ConstructorStandings] = []
    
    init () {
        loadConstructorStandings()
    }
    
    func loadConstructorStandings() {
        if let url = Bundle.main.url(forResource: "constructor_standings_2025", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                constructors = try decoder.decode ([ConstructorStandings].self, from: data)
            } catch {
                print("Failed to load JSON: ", error)
            }
        } else {
            print("constructor_standings_2025.json not found in bundle")
        }
    }
}

extension Array where Element == ConstructorStandings {
    /// Returns the top three drivers from the standings.
    func topThree() -> [ConstructorStandings] {
        return Array(self.prefix(3))
    }
}

