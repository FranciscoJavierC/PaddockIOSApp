//
//  HomeView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/2/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ScheduleViewModel()
        
    // This logic is correct and finds the next race weekend
    var upcomingRaces: [RaceSchedule] {
        viewModel.races
            .filter { $0.Session5Date >= Date() }
            .sorted { $0.Session5Date < $1.Session5Date }
    }
    
    var body: some View {
        HStack {
            Text("Home")
                .font(.custom("SFPro-ExpandedBold", size: 35))
                .foregroundColor(Color.white)
                .padding(.leading)
            Spacer()
        }
        .padding(.vertical, 10)
        ScrollView {
            LazyVStack(spacing: 40) { // Increased spacing for the new text
                if let race = upcomingRaces.first {
                    // --- CHANGE 1: Pass the whole race object ---
                    // This is cleaner and gives the card all the data it needs.
                    HomeCard(race: race)
                } else {
                    Text("No upcoming races.")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding(.vertical) // Add some padding
        }
    }
}

struct HomeCard: View {
    // --- It now takes the entire race object ---
        let race: RaceSchedule
        
        @State private var now = Date()

        private var nextSessionString: String {
                // Use the new, smarter logic
                if let session = race.currentOrNextSession {
                    let formatter = DateFormatter()
                    // Check if the session is live
                    if session.date <= now {
                        return "\(session.name.uppercased()) IS LIVE"
                    }
                    // Otherwise, show countdown info
                    formatter.dateFormat = "E, h:mm a"
                    let formattedDate = formatter.string(from: session.date).uppercased()
                    return "NEXT: \(session.name.uppercased()) - \(formattedDate)"
                }
                return "RACE COMPLETE"
            }
    
    var body: some View {
        ZStack {
            // MARK: - Card background + content
            VStack(spacing: 0) {
                // Flag Section
                ZStack(alignment: .topTrailing) {
                    Image("\(race.Country)Flag")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 190)
                        .cornerRadius(20)
                        .padding(15)
                        .clipped()
                        .shadow(radius: 3, y: 2)
                    
                    HStack {
                        if #available(iOS 26.0, *) {
                            Text("☀️ 84°F")
                                .font(.custom("SFPro-ExpandedBold", size: 15))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .glassEffect()
                                .padding(.leading, 25)
                                .padding(.top, 20)
                        } else {
                            Text("R\(race.RoundNumber)")
                                .font(.custom("SFPro-ExpandedBold", size: 13))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(Capsule().fill(Color.red.opacity(0.9)))
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white.opacity(0.9), lineWidth: 1)
                                )
                                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
                                .padding(.trailing, 25)
                                .padding(.top, 20)
                        }
                        
                        // Round badge
                        if #available(iOS 26.0, *) {
                            Text("R\(race.RoundNumber)")
                                .font(.custom("SFPro-ExpandedBold", size: 15))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .glassEffect()
                                .padding(.trailing, 25)
                                .padding(.top, 20)
                        } else {
                            Text("R\(race.RoundNumber)")
                                .font(.custom("SFPro-ExpandedBold", size: 13))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(Capsule().fill(Color.red.opacity(0.9)))
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white.opacity(0.9), lineWidth: 1)
                                )
                                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
                                .padding(.trailing, 25)
                                .padding(.top, 20)
                        }
                    }
                }

                // Info Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(race.displayCountry.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                        Spacer()
                        Text(race.Location)
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                            .foregroundColor(.white.opacity(0.9))
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "mappin")
                            .foregroundColor(.white.opacity(0.9))
                            .imageScale(.small)
                        Text(race.circuitName ?? "TBC")
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                            .foregroundColor(.white.opacity(0.95))
                            .lineLimit(2)
                        Spacer()
                        Text(race.dayRangeWithMonth.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 15))
                            .foregroundColor(.red)
                            .padding(.top, 2)
                    }

                    HStack {
                        SessionCountdownView(session: race.currentOrNextSession)
                        .onReceive(Timer.publish(every: 60, on: .main, in: .common)
                            .autoconnect())
                        {
                            _ in now = Date()
                        }
                        
                        Image("\(race.Location)Circuit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 90)
                            .colorInvert()
                    }
                    
                    // --- CHANGE 3: Add the "Next Session" text below ---
                    Text(nextSessionString)
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    // Add some space for button overlay
                    Spacer().frame(height: 40)
                }
                .padding()
            }
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial.opacity(0.05))
                    )
            )
            .padding(.horizontal)
            .allowsHitTesting(false) // disable tap on entire card, only button will receive taps

            // MARK: - Force tappable button overlay
            VStack {
                Spacer()
                if #available(iOS 26.0, *) {
                    Button("Weekend Info") {
                    }
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .buttonStyle(.glassProminent)
                    .tint(.red)
                    .contentShape(Rectangle())
                } else {
                    Button("Weekend Info") {
                    }
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(RoundedRectangle(cornerRadius: 18).fill(Color.red))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.9), lineWidth: 1)
                    )
                    .contentShape(Rectangle())
                }
            }
            .padding(.bottom, 20) // adjust button position
        }
    }
}

#Preview {
    HomeView()
}

struct SessionCountdownView: View {
    let session: (name: String, date: Date)?
    
    private var timeRemaining: TimeInterval {
        guard let session = session else { return 0 }
        return session.date.timeIntervalSince(Date())
    }
    
    private var timeComponents: (days: Int, hours: Int, minutes: Int) {
        let remaining = max(0, timeRemaining)
        let days = Int(remaining) / 86400
        let hours = (Int(remaining) % 86400) / 3600
        let minutes = (Int(remaining) % 3600) / 60
        return (days, hours, minutes)
    }

    private var lightColor: Color {
        guard session != nil else { return .gray }
        // If session has started, turn lights green
        if timeRemaining <= 0 { return .green }
        // Otherwise, all lights are red
        return .red
    }
    
    private var activeLights: Int {
        guard let session = session else { return 0 }
        
        switch session.name.uppercased() {
        case "RACE":
            if timeRemaining <= 0 { return 0 } // Race starts, lights out!
            let daysRemaining = ceil(timeRemaining / 86400)
            if daysRemaining > 5 { return 0 }
            return 6 - Int(daysRemaining)
            
        default:
            // For Practice, Qualifying, and Sprint, all 5 lights are active
            return 5
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                ForEach(0..<5) { index in
                    Circle()
                        .fill(index < activeLights ? lightColor : Color.gray.opacity(0.25))
                        .frame(width: 20, height: 20)
                        .shadow(color: index < activeLights ? lightColor : .clear, radius: 4)
                        .animation(.easeInOut, value: activeLights)
                        .animation(.easeInOut, value: lightColor)
                }
            }
            
            HStack(spacing: 15) {
                if timeComponents.days > 0 {
                    CountdownUnit(value: timeComponents.days, label: "DAYS")
                    CountdownDivider()
                }
                CountdownUnit(value: timeComponents.hours, label: "HRS")
                CountdownDivider()
                CountdownUnit(value: timeComponents.minutes, label: "MIN")
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
    }
}

struct CountdownUnit: View {
    let value: Int; let label: String
    var body: some View {
        VStack(spacing: 2) {
            Text("\(value)").font(.custom("SFPro-ExpandedBold", size: 22))
            Text(label).font(.custom("SFPro-ExpandedRegular", size: 10)).opacity(0.8)
        }.foregroundColor(.white)
    }
}

struct CountdownDivider: View {
    var body: some View {
        Rectangle().fill(Color.white.opacity(0.3)).frame(width: 1, height: 22)
    }
}
