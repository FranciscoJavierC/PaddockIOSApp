//
//  DriverStandingsJson.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/1/25.
//

import Foundation
import SwiftUI

struct DriverStandings: Codable, Identifiable {
    let driverId: String?
    let Position: Int
    let DriverNumber: Int
    let FullName: String
    let CountryName: String
    let ConstructorNames: [String]
    let TeamColorHex: String
    let Points: Int
    
    var TeamColor: Color { Color(hex: TeamColorHex) }
    
    var id: String { driverId ?? UUID().uuidString }
    
    enum CodingKeys: String, CodingKey {
        case driverId = "driverId"
        case Position = "position"
        case DriverNumber = "driverNumber"
        case FullName = "fullName"
        case CountryName = "countryName"
        case ConstructorNames = "constructorNames"
        case TeamColorHex = "teamColor"
        case Points = "points"
    }
}

extension Color {
    init(hex: String) {
        let r, g, b, a: Double
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") { hexString.removeFirst() }

        func component(_ start: Int, _ length: Int) -> Double {
            let startIdx = hexString.index(hexString.startIndex, offsetBy: start)
            let endIdx = hexString.index(startIdx, offsetBy: length)
            let substring = String(hexString[startIdx..<endIdx])
            let value = UInt64(substring, radix: 16) ?? 0
            return Double(value) / 255.0
        }

        switch hexString.count {
        case 6: // RRGGBB
            a = 1.0
            r = component(0, 2)
            g = component(2, 2)
            b = component(4, 2)
        case 8: // AARRGGBB
            a = component(0, 2)
            r = component(2, 2)
            g = component(4, 2)
            b = component(6, 2)
        default:
            // Fallback to a neutral color if parsing fails
            r = 0.5; g = 0.5; b = 0.5; a = 1.0
        }
        self = Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

class DriverStandingsModel: ObservableObject {
    @Published var drivers: [DriverStandings] = []
    
    init () {
        loadDriverStandings()
    }
    
    func loadDriverStandings() {
        if let url = Bundle.main.url(forResource: "driver_standings_2025", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                drivers = try decoder.decode([DriverStandings].self, from: data)
            } catch {
                print("Failed to load JSON: ", error)
            }
        } else {
            print("driver_standings_2025.json not found in bundle")
        }
    }
}

extension Array where Element == DriverStandings {
    /// Returns the top three drivers from the standings.
    func topThree() -> [DriverStandings] {
        return Array(self.prefix(3))
    }
}
