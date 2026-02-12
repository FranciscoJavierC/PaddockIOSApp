//
//  ConstructorDetailView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/18/25.
//

import SwiftUI

struct ConstructorDetailView: View {
    let constructor: ConstructorStandings 
    @State private var activeTab: ConstructorDetailTab = .profile
    @Namespace private var animation // Used for the "Liquid Glow" indicator
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack(alignment: .bottomLeading) {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(constructor.TeamColor)
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
                                    VStack(alignment: .leading, spacing: -6) {
                                        Text(constructor.ConstructorName)
                                            .font(.custom("SFPro-ExpandedBold", size: 30))
                                    }
                                }
                                .padding(.leading, 35)
                                .padding(.bottom, 50)
                                
                                Spacer()

                                // 3. The "Bleed" Driver Image
                                Image(constructor.ConstructorName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 90) // Perfect 2026 balance
                                    .padding(.trailing, 40)
                                    .padding(.bottom, 30)
                            }
                        }
                        .frame(height: 250)
                        
                        // MARK: - Tab Section
                        VStack(spacing: 20) {
                            customTabBar
                            tabContent
                        }
                        .padding(.top, 20)

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
            ForEach(ConstructorDetailTab.allCases, id: \.self) { tab in
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
                            .fill(constructor.TeamColor)
                            .frame(width: 30, height: 3)
                            .matchedGeometryEffect(id: "tab", in: animation) // smooth sliding
                            .shadow(color: constructor.TeamColor.opacity(0.5), radius: 4, x: 0, y: 2)
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
        case .profile:
            ConstructorProfileView(constructor: constructor)
        case .races:
            ConstructorRacesView()
        case .stats:
            ConstructorStatsView()
        case .history:
            ConstructorHistoryView()
        }
    }
}

// Helper to measure content height
struct HeightReader: View {
    @Binding var height: CGFloat

    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: HeightKey.self, value: geo.size.height)
        }
        .onPreferenceChange(HeightKey.self) { value in
            self.height = value
        }
    }
}

struct HeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Tabs enum
enum ConstructorDetailTab: String, CaseIterable {
    case profile = "Profile"
    case races = "Races"
    case stats = "Stats"
    case history = "History"
}

#Preview {
    ConstructorDetailView(constructor: ConstructorStandings(
            ConstructorName: "McLaren",
            Points: 150,
            Position: 1,
            Drivers: ["Oscar Piastri", "Lando Norris"],
            DriverPoints: [80, 70],
            TeamColorHex: "#FF9800",
            constructorId: "mclaren"
        ))
}
