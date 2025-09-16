//
//  ConstructorDetailView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/18/25.
//

import SwiftUI

struct ConstructorDetailView: View {
    @State private var activeTab: ConstructorDetailTab = .profile
    @Environment(\.dismiss) var dismiss

    private let minHeight: CGFloat = 170
    private let maxHeight: CGFloat = 450

    @State private var contentHeight: CGFloat = 0
    @State private var screenHeight: CGFloat = UIScreen.main.bounds.height

    var collapseDistance: CGFloat { maxHeight - minHeight }
    var thresholdContentHeight: CGFloat { screenHeight - minHeight + collapseDistance }

    var body: some View {
        ResizableHeaderScrollView(
            minimumHeight: minHeight,
            maximumHeight: maxHeight,
            ignoresSafeAreaTop: true,
            isSticky: true
        ) { progress, safeArea in
            // HEADER
            GeometryReader { geo in
                let height = geo.size.height
                let fadeOutProgress = (height - minHeight) / collapseDistance

                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(.orange)
                        .cornerRadius(20)

                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )

                    Image("McLaren")
                        .resizable()
                        .scaledToFit()
                        .frame(height: height)
                        .clipped()
                        .cornerRadius(20)
                        .opacity(fadeOutProgress)

                    VStack(alignment: .leading) {
                        Text("McLaren")
                            .font(.custom("SFPro-ExpandedBold", size: 28))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 60 * (height / maxHeight))
                    .opacity(fadeOutProgress)

                    VStack {
                        Spacer()
                        tabBar
                    }
                    .offset(y: -20)
                }
                .frame(height: height)
                .overlay(
                    HStack(spacing: 10) {
                        Text("McLaren")
                            .font(.custom("SFPro-ExpandedBold", size: 20))
                            .foregroundColor(.white)
                        Image("McLaren")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    }
                    .padding(.horizontal, 16)
                    .opacity(1 - fadeOutProgress)
                )
            }
        } content: {
            VStack(spacing: 0) {
                tabContent
                    .background(HeightReader(height: $contentHeight))

                // Add spacer if content is too short
                if contentHeight < thresholdContentHeight {
                    Color.clear
                        .frame(height: thresholdContentHeight - contentHeight)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 40, height: 40)
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                    }
                }
            }
        }
    }

    private var tabBar: some View {
        HStack {
            ForEach(ConstructorDetailTab.allCases, id: \.self) { tab in
                Button(action: { activeTab = tab }) {
                    Text(tab.rawValue)
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundColor(activeTab == tab ? .white : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if activeTab == tab {
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(height: 3)
                                        .offset(y: 20)
                                }
                            }
                        )
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }

    @ViewBuilder
    private var tabContent: some View {
        switch activeTab {
        case .profile:
            ConstructorProfileView()
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
    ConstructorDetailView()
}
