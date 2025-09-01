//
//  StandingsDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 8/27/25.
//

import SwiftUI

struct StandingsDetailView: View {
    @State private var activeTab: PreviewStandingsTab = .drivers
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                standingsTabBar
                tabContent
            }
        }
    }
    // MARK: - Tab Bar
    private var standingsTabBar: some View {
        HStack(spacing: 10) { // Spacing between the tabs
            ForEach(PreviewStandingsTab.allCases, id: \.self) { tab in
                Button(action: { activeTab = tab }) {
                    Text(tab.rawValue)
                        .font(.custom("SFPro-ExpandedBold", size: 12))
                        .foregroundColor(activeTab == tab ? .white : .gray)
                        .padding(.vertical, 8) // Vertical padding for the capsule
                        .padding(.horizontal, 15) // Horizontal padding for the capsule
                        .background(
                            Capsule()
                                .fill(activeTab == tab ? Color.red : Color.gray.opacity(0.3))
                        )
                }
            }
            Spacer() // Pushes the tabs to the left
        }
        .padding(.horizontal) // Padding around the entire HStack
    }

    // MARK: - Tab Content
    @ViewBuilder
    private var tabContent: some View {
        switch activeTab {
        case .drivers:
            PreviewDriverStandingsView()
        case .constructors:
            PreviewConstructorStandingsView()
        }
    }

}

// MARK: - Tabs enum
enum PreviewStandingsTab: String, CaseIterable {
case drivers = "Drivers"
case constructors = "Constructors"
}

#Preview {
    StandingsDetailView()
}
