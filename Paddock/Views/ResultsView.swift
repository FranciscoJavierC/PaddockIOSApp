//
//  ResultsView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/28/25.
//

import SwiftUI

struct TimingTowerEntry: Identifiable {
    let id = UUID()
    let position: Int
    let driverImage: String
    let code: String
    let gap: String
    let laps: Int
}

struct ResultsView: View {
    let lapThreshold: Double = 120.0
    let entries: [TimingTowerEntry] = [
        .init(position: 1, driverImage: "Verstappen", code: "LEC", gap: "1:42:022", laps: 54),
        .init(position: 2, driverImage: "Verstappen", code: "VER", gap: "+2.009", laps: 54),
        .init(position: 3, driverImage: "Verstappen", code: "SAI", gap: "+0.049", laps: 54),
        .init(position: 4, driverImage: "Verstappen", code: "PER", gap: "+0.109", laps: 54),
        .init(position: 5, driverImage: "Verstappen", code: "HAM", gap: "+2.209", laps: 54),
        .init(position: 6, driverImage: "Verstappen", code: "RUS", gap: "+3.109", laps: 54),
        .init(position: 7, driverImage: "Verstappen", code: "MAG", gap: "+5.049", laps: 54),
        .init(position: 8, driverImage: "Verstappen", code: "BOT", gap: "+6.239", laps: 54),
        .init(position: 9, driverImage: "Verstappen", code: "OCO", gap: "+10.009", laps: 54),
        .init(position: 10, driverImage: "Verstappen", code: "TSU", gap: "+22.009", laps: 54),
        .init(position: 11, driverImage: "Verstappen", code: "ALO", gap: "+25.009", laps: 54),
        .init(position: 12, driverImage: "Verstappen", code: "ZHO", gap: "+29.009", laps: 54),
        .init(position: 13, driverImage: "Verstappen", code: "MSC", gap: "+29.809", laps: 54),
        .init(position: 14, driverImage: "Verstappen", code: "STR", gap: "+30.309", laps: 54),
        .init(position: 15, driverImage: "Verstappen", code: "ALB", gap: "+32.459", laps: 54),
        .init(position: 16, driverImage: "Verstappen", code: "RIC", gap: "+34.462", laps: 54),
        .init(position: 17, driverImage: "Verstappen", code: "NOR", gap: "+36.426", laps: 54),
        .init(position: 18, driverImage: "Verstappen", code: "LAT", gap: "+46.009", laps: 54),
        .init(position: 19, driverImage: "Verstappen", code: "HUL", gap: "+4:32.009", laps: 54),
        .init(position: 20, driverImage: "Verstappen", code: "GAS", gap: "OUT", laps: 40)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                Text("PRACTICE 1")
                    .font(.custom("SFPro-ExpandedBold", size: 28))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.black)

                // Rows
                ForEach(entries) { entry in
                    HStack(spacing: 12) {
                        // Position
                        Text("\(entry.position)")
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                            .frame(width: 40, alignment: .trailing)

                        // Driver Image
                        Image(entry.driverImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())

                        // Driver Code + Team Logo
                        VStack(alignment: .leading, spacing: 4) {
                            Text(entry.code)
                                .font(.custom("SFPro-ExpandedBold", size: 20))
                                .foregroundColor(.white)

                            Image("RedBull")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 18)
                                .cornerRadius(4)
                        }
                        .frame(width: 70, alignment: .leading)

                        Spacer()

                        // Gap
                        let displayGap = formatGap(entry.gap)
                        Text(displayGap)
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                            .foregroundColor(displayGap == "OUT" ? .red : .white)
                            .frame(width: 100, alignment: .leading)

                        // Laps
                        Text("\(entry.laps)")
                            .font(.custom("SFPro-ExpandedRegular", size: 18))
                            .foregroundColor(.white.opacity(0.7))
                            .frame(width: 50, alignment: .leading)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color(red: 0.10, green: 0.10, blue: 0.12))
                }
            }
            .frame(width: 420)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 5)
            .padding(.top, 20)
            .padding(.bottom, 40)
        }
        .background(Color(.systemGray6))
    }
    
    func formatGap(_ gap: String) -> String {
            if gap == "OUT" {
                return "OUT"
            }
            if let gapTime = parseGapTime(gap), gapTime > lapThreshold {
                return "+1 LAP"
            }
            return gap
        }

        func parseGapTime(_ gap: String) -> Double? {
            let cleaned = gap.replacingOccurrences(of: "+", with: "")
            let parts = cleaned.split(separator: ":")
            
            if parts.count == 2,
               let minutes = Double(parts[0]),
               let seconds = Double(parts[1]) {
                return minutes * 60 + seconds
            } else if let seconds = Double(cleaned) {
                return seconds
            }
            return nil
        }
}

#Preview {
    ResultsView()
}
