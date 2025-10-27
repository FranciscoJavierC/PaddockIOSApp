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
    
    func loadDriverStandings() {
        // 🔗 Replace this with your actual GitHub raw URL
        guard let url = URL(string: "https://raw.githubusercontent.com/FranciscoJavierC/PaddockIOSApp/main/driver_standings_2025.json") else {
            print("Invalid GitHub URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        self.drivers = try decoder.decode([DriverStandings].self, from: data)
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
        loadDriverStandings()
    }
}

extension Array where Element == DriverStandings {
    /// Returns the top three drivers from the standings.
    func topThree() -> [DriverStandings] {
        return Array(self.prefix(3))
    }
}
