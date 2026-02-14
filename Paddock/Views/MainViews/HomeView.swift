//
//  HomeView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/2/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    @StateObject private var driverModel = DriverStandingsModel()
    @StateObject private var constructorModel = ConstructorStandingsModel()
    @State private var selectedRace: RaceSchedule? = nil
    @State private var showDetail = false
    @Binding var activeTab: TabItem // ← Add this


    var upcomingRaces: [RaceSchedule] {
        // Add a 3-hour (10,800 seconds) buffer after the last race start
        let bufferTime: TimeInterval = 3 * 60 * 60
        let now = Date()
        
        return viewModel.races
            .filter { race in
                // Only show if the race's main event (Session5) starts in the future
                // OR within the last 3 hours
                race.Session5Date.addingTimeInterval(bufferTime) >= now
            }
            .sorted { $0.Session5Date < $1.Session5Date }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("Home")
                        .font(.custom("SFPro-ExpandedBold", size: 35))
                        .foregroundColor(Color.white)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.vertical, 10)

                ScrollView {
                    LazyVStack(spacing: 20) {
                        if let race = upcomingRaces.first {
                            HomeCard(race: race)
                            {
                                selectedRace = race
                                showDetail = true
                            }
                        } else {
                            Text("No upcoming races.")
                                .foregroundColor(.white)
                                .padding()
                        }
                        DriverStandingsTop3View(viewModel: driverModel, activeTab: $activeTab)
                        
                        ConstructorStandingsTop3View(viewModel: constructorModel, activeTab: $activeTab)
                    }
                    .padding(.vertical)
                }
            }
            .navigationDestination(isPresented: $showDetail) {
                if let race = selectedRace {
                    RaceDetailView(race: race)
                }
            }
        }
    }
}

struct HomeCard: View {
    let race: RaceSchedule
    let onRaceInfoTap: () -> Void
    @State private var now = Date()

    private var nextSessionString: String {
        if let session = race.currentOrNextSession {
            let formatter = DateFormatter()

            if session.date <= now {
                return "\(session.name.uppercased()) IS LIVE"
            }

            formatter.dateFormat = "E, h:mm a"
            let formattedDate = formatter.string(from: session.date).uppercased()
            return "NEXT: \(session.name.uppercased()) - \(formattedDate)"
        }
        return "RACE COMPLETE"
    }

    var body: some View {
        VStack(spacing: 0) {

            heroSection

            infoSection
        }
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Color.white.opacity(0.4), lineWidth: 0.5)
        )
        .padding(.horizontal)
    }

    // MARK: - Hero Section
    private var heroSection: some View {
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .bottomLeading) {
                
                // Flag Image with padding + corner radius
                Image("\(race.Country)Flag")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .clipped()
                    .cornerRadius(25)
                    .padding()
                
                // Clean bottom gradient (no material background)
                LinearGradient(
                    colors: [.clear, .black.opacity(0.75)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .cornerRadius(24)
                .padding()
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(race.dayRangeWithMonth.uppercased())
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text(race.displayCountry.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                        
                        Text(race.Location)
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    Spacer()
                    
                    Button("Weekend Info") {
                        onRaceInfoTap()
                    }
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .background(
                        Capsule().fill(Color.black.opacity(0.45))
                    )
                    .overlay(
                        Capsule().stroke(Color.white.opacity(0.6))
                    )
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 35)
                .padding(.bottom, 30)
            }
            
            // ✅ Your iOS 26 Round Badge Preserved
            if #available(iOS 26.0, *) {
                Text("R\(race.RoundNumber)")
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .glassEffect()
                    .padding(.trailing, 35)
                    .padding(.top, 30)
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
                    .padding(.trailing, 35)
                    .padding(.top, 30)
            }
        }
    }

    // MARK: - Info Section
    private var infoSection: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 18) {
                SessionCountdownView(session: race.currentOrNextSession)
                    .onReceive(
                        Timer.publish(every: 60, on: .main, in: .common)
                            .autoconnect()
                    ) { _ in
                        now = Date()
                    }

                /*Text(nextSessionString)
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .foregroundColor(.white)*/
            }

            Spacer()

            ZStack {
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.white.opacity(0.08))

                Image("\(race.Location)Circuit")
                    .resizable()
                    .scaledToFit()
                    .padding(18)
                    .colorInvert()
            }
            .frame(width: 150, height: 110)
        }
        .padding()
    }

    private func infoBlock(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.custom("SFPro-ExpandedRegular", size: 11))
                .foregroundColor(.white.opacity(0.6))

            Text(value)
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(.white)
        }
    }
}

// MARK: - Main Standings Card
struct DriverStandingsTop3View: View {
    // Takes the whole view model to access the drivers list
    @ObservedObject var viewModel: DriverStandingsModel
    @Binding var activeTab: TabItem  // ← Add this
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                // Card Title
                Text("Driver's Standings")
                    .font(.custom("SFPro-ExpandedBold", size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.leading)
                
                Spacer()
                
                Button {
                    activeTab = .standings
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        .padding(.trailing)
                        .padding(.top, 10)
                }
            }
            
            // Loop through the top three drivers
            VStack(spacing: 0) {
                ForEach(viewModel.drivers.topThree()) { driver in
                    DriverRowView(driver: driver)
                    
                    // Add a divider, but not for the last driver
                    if driver.Position < 3 {
                        Divider().background(Color.white.opacity(0.2)).padding(.horizontal)
                    }
                }
            }
            .padding(.bottom)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
        )
        .padding(.horizontal)
    }
}

// MARK: - Single Driver Row
struct DriverRowView: View {
    let driver: DriverStandings
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(driver.TeamColor)
                .frame(height: 60)
                .cornerRadius(20)
                .padding(15)
                .overlay {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .black.opacity(0.6),
                            .black.opacity(0)
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .cornerRadius(20)
                    .padding(15)
                }
                .shadow(radius: 3, y: 2)
            
            HStack {
                // Position
                Text("\(driver.Position)")
                    .font(.custom("SFPro-ExpandedBold", size: 22))
                    .frame(width: 40)

                // Driver Image
                Image(driver.FullName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60, alignment: .top)
                    .clipped()

                // Name + Team
                VStack(alignment: .leading, spacing: 2) {
                    Text(driver.FullName)
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)

                    HStack(spacing: 5) {
                        Image(driver.ConstructorNames.first ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)

                        Text(driver.ConstructorNames.first ?? "")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)
                    }
                }
                .layoutPriority(0.8)

                Spacer()

                // Points (right-aligned, fixed width)
                Text("\(driver.Points) pts")
                    .font(.custom("SFPro-ExpandedBold", size: 17))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .frame(width: 80, alignment: .trailing)
                    .padding(.trailing, 25)
                    .layoutPriority(1)
            }
            .foregroundColor(.white)
            .padding(.vertical, 8)
            .padding(.leading, 15)
        }
    }
}

struct ConstructorStandingsTop3View: View {
    // Takes the whole view model to access the drivers list
    @ObservedObject var viewModel: ConstructorStandingsModel
    @Binding var activeTab: TabItem  // ← Add this
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                // Card Title
                Text("Constructor's Standings")
                    .font(.custom("SFPro-ExpandedBold", size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.leading)
                
                Spacer()
                
                Button {
                    activeTab = .standings
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        .padding(.trailing)
                        .padding(.top, 10)
                }
            }
            
            // Loop through the top three drivers
            VStack(spacing: 0) {
                ForEach(viewModel.constructors.topThree()) { constructor in
                    ConstructorRowView(constructor: constructor)
                    
                    // Add a divider, but not for the last driver
                    if constructor.Position < 3 {
                        Divider().background(Color.white.opacity(0.2)).padding(.horizontal)
                    }
                }
            }
            .padding(.bottom)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
        )
        .padding(.horizontal)
    }
}

// MARK: - Single Driver Row
struct ConstructorRowView: View {
    let constructor: ConstructorStandings
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(constructor.TeamColor)
                .frame(height: 60)
                .cornerRadius(20)
                .padding(15)
                .overlay {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .black.opacity(0.6),
                            .black.opacity(0)
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .cornerRadius(20)
                    .padding(15)
                }
                .shadow(radius: 3, y: 2)
            
            HStack {
                // Position
                Text("\(constructor.Position)")
                    .font(.custom("SFPro-ExpandedBold", size: 22))
                    .frame(width: 40)

                // Constructor Logo
                Image(constructor.ConstructorName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 40)

                // Constructor Name
                Text(constructor.ConstructorName)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
                    .layoutPriority(0.8)

                Spacer()

                // Points (right aligned)
                Text("\(constructor.Points) pts")
                    .font(.custom("SFPro-ExpandedBold", size: 17))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .frame(width: 80, alignment: .trailing)
                    .padding(.trailing, 25)
                    .layoutPriority(1)
            }
            .foregroundColor(.white)
            .padding(.vertical, 8)
            .padding(.leading, 15)
        }
    }
}

#Preview {
    HomeView(activeTab: .constant(.schedule))
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
        case "RACE", "SPRINT":
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

