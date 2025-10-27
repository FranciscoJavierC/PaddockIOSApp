//
//  SessionSheetView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/26/25.
//

import SwiftUI

struct SessionSheetView: View {
    let sessionName: String
    let sessionDate: Date
    let weather: (icon: String, temp: String, condition: String)
    let results: [(position: Int, driver: String, team: String, time: String)]?

    @State private var now = Date()

    private var timeRemaining: TimeInterval {
        sessionDate.timeIntervalSince(now)
    }

    private var timeComponents: (days: Int, hours: Int, minutes: Int) {
        let remaining = max(0, timeRemaining)
        let days = Int(remaining) / 86400
        let hours = (Int(remaining) % 86400) / 3600
        let minutes = (Int(remaining) % 3600) / 60
        return (days, hours, minutes)
    }

    private var isUpcoming: Bool {
        sessionDate > now
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // MARK: - Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(sessionName.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                        Text(sessionDate, style: .date)
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                            .foregroundColor(.white.opacity(0.8))
                        Text(sessionDate, style: .time)
                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Image(systemName: weather.icon)
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        Text(weather.temp)
                            .font(.custom("SFPro-ExpandedBold", size: 14))
                            .foregroundColor(.white)
                        Text(weather.condition)
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.top, 10)

                Divider().background(Color.white.opacity(0.2))

                if isUpcoming {
                    // UPCOMING SESSION VIEW
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Session Starts In")
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white.opacity(0.8))

                        HStack(spacing: 20) {
                            CountdownUnit(value: timeComponents.days, label: "Days")
                            CountdownDivider()
                            CountdownUnit(value: timeComponents.hours, label: "Hrs")
                            CountdownDivider()
                            CountdownUnit(value: timeComponents.minutes, label: "Min")
                        }
                        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                            now = Date()
                        }

                        Divider().background(Color.white.opacity(0.2))

                        // Where to Watch
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Where to Watch")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("🇺🇸  F1 TV Pro")
                                    Spacer()
                                    Text("Live & On-Demand")
                                }
                                HStack {
                                    Text("🇬🇧  Sky Sports F1")
                                    Spacer()
                                    Text("Live Coverage")
                                }
                                HStack {
                                    Text("🇲🇽  Fox Sports MX")
                                    Spacer()
                                    Text("Live Stream")
                                }
                            }
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                            .foregroundColor(.white.opacity(0.9))
                            .padding(12)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(12)
                        }
                    }
                } else {
                    // RESULTS VIEW
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Session Results")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                            .foregroundColor(.white)

                        if let results = results {
                            VStack(spacing: 10) {
                                ForEach(results.prefix(10), id: \.position) { item in
                                    HStack {
                                        Text("\(item.position)")
                                            .font(.custom("SFPro-ExpandedBold", size: 15))
                                            .frame(width: 25)
                                        Text(item.driver)
                                            .font(.custom("SFPro-ExpandedBold", size: 15))
                                        Spacer()
                                        Text(item.team)
                                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                                            .opacity(0.8)
                                        Spacer()
                                        Text(item.time)
                                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                                            .opacity(0.8)
                                    }
                                    .foregroundColor(.white)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 10)
                                    .background(Color.white.opacity(0.05))
                                    .cornerRadius(10)
                                }
                            }
                        } else {
                            Text("Results will be available after this session ends.")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                }
            }
            .padding(20)
        }
    }
}

// MARK: - Preview
#Preview {
    SessionSheetView(
        sessionName: "Practice 1",
        sessionDate: Date().addingTimeInterval(3600 * 5),
        weather: ("cloud.sun.fill", "84°F", "Sunny"),
        results: [
            (1, "Max Verstappen", "Red Bull", "1:32.454"),
            (2, "Lando Norris", "McLaren", "+0.102"),
            (3, "Charles Leclerc", "Ferrari", "+0.250")
        ]
    )
}
