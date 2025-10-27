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
    
    func loadConstructorStandings() {
        // 🔗 Replace this with your actual GitHub raw URL
        guard let url = URL(string: "https://raw.githubusercontent.com/FranciscoJavierC/PaddockIOSApp/main/constructor_standings_2025.json") else {
            print("Invalid GitHub URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        self.constructors = try decoder.decode([ConstructorStandings].self, from: data)
                        print("✅ Constructor standings loaded from GitHub")
                    } catch {
                        print("❌ Decoding error:", error)
                    }
                }
            } else if let error = error {
                print("❌ Network error:", error)
            }
        }.resume()
    }
    
    init() {
        loadConstructorStandings()
    }
}

extension Array where Element == ConstructorStandings {
    /// Returns the top three drivers from the standings.
    func topThree() -> [ConstructorStandings] {
        return Array(self.prefix(3))
    }
}

