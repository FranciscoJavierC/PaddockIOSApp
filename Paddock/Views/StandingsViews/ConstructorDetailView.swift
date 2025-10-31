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
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .fill(constructor.TeamColor)
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
                            
                            Image(constructor.ConstructorName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 215, height: 180)
                                .padding(.horizontal, 110)
                                .padding(.vertical)
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
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(constructor.ConstructorName)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
            }
        }
    }
    
    // MARK: - Tab Bar
    private var tabBar: some View {
        Picker("Select tab", selection: $activeTab) {
            ForEach(ConstructorDetailTab.allCases, id: \.self) { tab in
                Text(tab.rawValue)
                    .tag(tab)
            }
        }
        // Apply the segmented control style
        .pickerStyle(.segmented)
        .padding(.horizontal)
        .padding(.vertical, 8)
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
