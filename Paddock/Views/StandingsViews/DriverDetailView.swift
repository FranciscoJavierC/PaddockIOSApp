//
//  DriverDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/18/25.
//

import SwiftUI

struct DriverDetailView: View {
    let driver: DriverStandings  // Add this
    @State private var activeTab: DriverDetailTab = .profile
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                ScrollView {
                    VStack(spacing: 0) {
                        // Keep your original header design
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .fill(driver.TeamColor)
                                .frame(height: 190)
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
                            
                            Image(driver.FullName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 215, alignment: .top)
                                .cornerRadius(20)
                                .padding(.horizontal, 25)
                                .clipped()
                                .padding(.vertical)
                        }
                        .padding(.top, 80)
                        
                        // MARK: - Tab Section
                        VStack(spacing: 20) {
                            tabBar
                            tabContent
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
            } else {
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // Round badge
                Text("#\(driver.DriverNumber)")
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
            }
            ToolbarItem(placement: .principal) {
                Text(driver.FullName)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
            }
        }
    }

    // MARK: - Tab Bar
    private var tabBar: some View {
        Picker("Select tab", selection: $activeTab) {
            ForEach(DriverDetailTab.allCases, id: \.self) { tab in
                Text(tab.rawValue)
                    .tag(tab)
            }
        }
        // Apply the segmented control style
        .pickerStyle(.segmented)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }

    // MARK: - Tab Content
    @ViewBuilder
    private var tabContent: some View {
        switch activeTab {
        case .profile:
            ProfileCardView()
        case .races:
            RacesCardView()
        case .stats:
            StatsCardView()
        case .career:
            CareerCardView()
        }
    }
}

// MARK: - Tabs enum
enum DriverDetailTab: String, CaseIterable {
    case profile = "Profile"
    case races = "Races"
    case stats = "Stats"
    case career = "Career"
}

#Preview {
    DriverDetailView(driver: DriverStandings(
            driverId: "piastri",
            Position: 3,
            DriverNumber: 1,
            FullName: "Oscar Piastri",
            CountryName: "Australia",
            ConstructorNames: ["McLaren"],
            TeamColorHex: "#FF9800",
            Points: 95
        ))
}
