//
//  DriverDetailView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/18/25.
//

import SwiftUI

struct DriverDetailView: View {
    let driver: DriverStandings
    @State private var activeTab: DriverDetailTab = .profile
    @Namespace private var animation // Used for the "Liquid Glow" indicator
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - THE HERO CARD
                        ZStack(alignment: .bottomLeading) {
                            // 1. Solid Color Base with Leading Gradient Fade
                            RoundedRectangle(cornerRadius: 24)
                                .fill(driver.TeamColor)
                                .overlay {
                                    LinearGradient(
                                        colors: [.clear, .black.opacity(0.4)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                }
                            
                            // 2. Content Layout (Name, Stats, and Image)
                            HStack(alignment: .bottom, spacing: 0) {
                                VStack(alignment: .leading, spacing: 4) {
                                    // Two-Line Name Lockup (Small First, Bold Last)
                                    VStack(alignment: .leading, spacing: -6) {
                                        Text(driver.FullName.split(separator: " ").dropLast().joined(separator: " "))
                                            .font(.custom("SFPro-ExpandedMedium", size: 25))
                                        
                                        Text(driver.FullName.split(separator: " ").last ?? "")
                                            .font(.custom("SFPro-ExpandedBold", size: 30))
                                    }
                                    .foregroundColor(.white)
                                    
                                    // Team & Points Info
                                    HStack() {
                                        Image(driver.ConstructorNames.joined(separator: ", "))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 30)
                                            
                                        Text(driver.ConstructorNames.joined(separator: ", "))
                                            .font(.custom("SFPro-ExpandedMedium", size: 15))
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                    .padding(.top, 5)
                                }
                                .padding(.leading, 35)
                                .padding(.bottom, 25)
                                
                                Spacer()

                                // 3. The "Bleed" Driver Image
                                Image(driver.FullName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 160, height: 180, alignment: .top) // Slightly taller than the card
                                    .clipped()
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(height: 250) // Extra height allows the image to "pop"

                        // MARK: - Tab Navigation Section
                        VStack(spacing: 20) {
                            customTabBar
                            tabContent
                        }
                        .padding(.top, 20)
                        .background(Color(.systemBackground))
                    }
                }
                .scrollEdgeEffectHidden(true)
                .ignoresSafeArea(edges: .top)
            }
        }
    }

    // MARK: - Custom Tab Bar
    private var customTabBar: some View {
        HStack(spacing: 25) {
            ForEach(DriverDetailTab.allCases, id: \.self) { tab in
                VStack(spacing: 8) {
                    Text(tab.rawValue)
                        .font(.custom("SFPro-ExpandedMedium", size: 16))
                        .foregroundColor(activeTab == tab ? .primary : .secondary)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                activeTab = tab
                            }
                        }

                    // The "Liquid Glow" indicator from your reference image
                    if activeTab == tab {
                        Capsule()
                            .fill(driver.TeamColor)
                            .frame(width: 30, height: 3)
                            .matchedGeometryEffect(id: "tab", in: animation) // smooth sliding
                            .shadow(color: driver.TeamColor.opacity(0.5), radius: 4, x: 0, y: 2)
                    } else {
                        Capsule()
                            .fill(.clear)
                            .frame(width: 30, height: 3)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 25)
    }

    @ViewBuilder
    private var tabContent: some View {
        switch activeTab {
        case .profile: ProfileCardView()
        case .races: RacesCardView()
        case .stats: StatsCardView()
        case .career: CareerCardView()
        }
    }
}

// Keep your Tabs enum and Preview code below

// MARK: - Tabs enum
enum DriverDetailTab: String, CaseIterable {
    case profile = "Overview"
    case races = "Races"
    case stats = "Stats"
    case career = "Career"
}

#Preview {
    DriverDetailView(driver: DriverStandings(
            driverId: "piastri",
            Position: 3,
            DriverNumber: 81,
            FullName: "Oscar Piastri",
            CountryName: "Australia",
            ConstructorNames: ["McLaren"],
            TeamColorHex: "#F58020",
            Points: 95
        ))
}
