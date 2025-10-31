import SwiftUI

struct RaceDetailView: View {
    @State private var activeTab: RaceDetailTab = .weekend
    @Environment(\.dismiss) var dismiss
    let race: RaceSchedule
    
    init(race: RaceSchedule) {
        self.race = race
                
        let font = UIFont(name: "SFPro-ExpandedBold", size: 13)!
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font, .foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font, .foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - Header (Copied from Upcoming Card)
                        ZStack {
                            // Flag background
                            Image("\(race.Country)Flag")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(20)
                                .padding(15)
                                .clipped()
                                .shadow(radius: 3, y: 2)
                        }
                        .padding(.top, 100)
                        
                        // MARK: - Tab Section
                        VStack(spacing: 20) {
                            tabBar
                            tabContent
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
            } else {
                // Fallback on earlier versions
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // Round badge
                Text("R\(race.RoundNumber)")
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
            }
            ToolbarItem(placement: .principal) {
                Text(race.Location)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
            }
        }
    }
    
    // MARK: - Tab Bar (Segmented Control Style)
    private var tabBar: some View {
        Picker("Select Tab", selection: $activeTab) {
            ForEach(RaceDetailTab.allCases, id: \.self) { tab in
                Text(tab.rawValue)
                    .tag(tab) // Associate each text label with its corresponding tab case
            }
        }
        // Apply the segmented control style
        .pickerStyle(.segmented)
        // Add consistent padding
        .padding(.horizontal)
        // Optional: Add some vertical padding if needed
        .padding(.vertical, 8)
    }
    
    // MARK: - Tab Content
    @ViewBuilder
    private var tabContent: some View {
        switch activeTab {
        case .weekend:
            WeekendTabView(race: race)
        case .track:
            CircuitInfoView(race: race)
        case .standings:
            StandingsDetailView()
        }
    }
}

// MARK: - Tabs enum
enum RaceDetailTab: String, CaseIterable {
    case weekend = "Weekend"
    case track = "Track"
    case standings = "Standings"
}

#Preview {
    RaceDetailView(race: RaceSchedule.example)
}

extension RaceSchedule {
     static var example = RaceSchedule(
         RoundNumber: 1,
         Country: "Australia",
         Location: "Melbourne",
         Session1: "Practice 1",
         Session1Date: Date(),
         Session2: "Practice 2",
         Session2Date: Date().addingTimeInterval(60 * 60 * 24),
         Session3: "Practice 3",
         Session3Date: Date().addingTimeInterval(60 * 60 * 48),
         Session4: "Qualifying",
         Session4Date: Date().addingTimeInterval(60 * 60 * 72),
         Session5: "Race",
         Session5Date: Date().addingTimeInterval(60 * 60 * 96),
         circuitId: "albert_park",
         circuitName: "Albert Park Circuit"
     )
 }
