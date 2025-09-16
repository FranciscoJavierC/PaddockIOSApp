//
//  DriverDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/18/25.
//

import SwiftUI

struct DriverDetailView: View {
    @State private var activeTab: DriverDetailTab = .profile
    @Environment(\.dismiss) var dismiss

    private let minHeight: CGFloat = 150
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
            GeometryReader { geo in
                let height = geo.size.height
                let fadeOutProgress = (height - minHeight) / collapseDistance
                
                // Keep your original header design
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(.orange)
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        .cornerRadius(20)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.8)
                        ]), startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: height)
                    .ignoresSafeArea(edges: .top)
                    
                    Image("McLaren")
                        .resizable()
                        .scaledToFill()
                        .frame(height: height)
                        .clipped()
                        .cornerRadius(20)
                        .opacity(fadeOutProgress)
                    
                    Image("Piastri")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400, alignment: .top)
                        .clipped()
                        .opacity(fadeOutProgress)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.8)
                        ]), startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: height)
                    .ignoresSafeArea(edges: .top)
                    
                    VStack(alignment: .leading) {
                        Image("McLaren")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .opacity(fadeOutProgress)

                        Text("Oscar Piastri")
                            .font(.custom("SFPro-ExpandedBold", size: 28))
                            .foregroundColor(.white)
                            .opacity(fadeOutProgress)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 60 * fadeOutProgress)

                    VStack {
                        Spacer()
                        tabBar
                    }
                }
                .frame(height: height)
                .overlay(
                    HStack(spacing: 10) {
                        Image("Piastri")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .background(Circle().fill(Color.orange))
                        
                        Text("Oscar Piastri")
                            .font(.custom("SFPro-ExpandedBold", size: 15))
                    }
                    .padding(.horizontal, 16)
                    .opacity(1 - fadeOutProgress)
                )
            }
        } content: {
            VStack(spacing: 0) {
                tabContent
                    .background(HeightReader(height: $contentHeight))
                
                if contentHeight < thresholdContentHeight {
                    Color.clear
                        .frame(height: thresholdContentHeight - contentHeight)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { // 2. Adds a custom button to the left
                Button(action: {
                    dismiss() // 3. The action to go back
                }) {
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial) // The ultraThinMaterial background
                            .frame(width: 40, height: 40) // Adjust size as needed

                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.custom("SFPro-ExpandedBold", size: 16))

                    }
                }
            }
        }
    }

    // MARK: - Tab Bar
    private var tabBar: some View {
        HStack {
            ForEach(DriverDetailTab.allCases, id: \.self) { tab in
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
        .padding()
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
    DriverDetailView()
}
