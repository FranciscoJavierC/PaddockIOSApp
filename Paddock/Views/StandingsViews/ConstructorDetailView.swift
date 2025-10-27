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
    
    // State to track if the content header is visible.
    @State private var isHeaderVisible: Bool = true

    var body: some View {
            NavigationStack {
                if #available(iOS 26.0, *) {
                    GeometryReader { geometry in
                        ScrollView {
                            VStack(spacing: 0) {
                                ZStack(alignment: .bottomLeading) {
                                    Rectangle()
                                        .fill(constructor.TeamColor)
                                        .cornerRadius(20)
                                    
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .frame(height: 400)
                                    .ignoresSafeArea(edges: .top)
                                    
                                    Image(constructor.ConstructorName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 250)
                                        .padding(.horizontal, 120)
                                        .padding(.bottom, 100)
                                    
                                    VStack(alignment: .leading) {
                                        Text(constructor.ConstructorName)
                                            .font(.custom("SFPro-ExpandedBold", size: 28))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 60)
                                    
                                    if isHeaderVisible {
                                        tabBar
                                            .padding(.bottom, 16)
                                    }
                                }
                                .frame(height: 450)
                                // Apply onScrollVisibilityChange directly to the header ZStack
                                .onScrollVisibilityChange { isVisible in
                                    withAnimation {
                                        isHeaderVisible = isVisible
                                    }
                                }
                                
                                // MARK: - Tab Bar and Tab Content
                                VStack(spacing: 16) {
                                    tabContent
                                }
                                .frame(width: geometry.size.width) // 2. Explicitly set width to screen width
                                .padding(.top, 16)
                            }
                        }
                    }
                    .ignoresSafeArea(edges: .top)
                    .scrollEdgeEffectHidden(isHeaderVisible)
                    // Conditionally apply the title within the toolbar.
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            // Show the toolbar title only when the header is NOT visible.
                            if !isHeaderVisible {
                                HStack {
                                    Image(constructor.ConstructorName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                        .clipped()
                                        .cornerRadius(20)
                                    
                                    Text(constructor.ConstructorName)
                                        .font(.custom("SFPro-ExpandedBold", size: 16))
                                }
                            }
                        }
                    }
                    .safeAreaInset(edge: .top) {
                        if !isHeaderVisible {
                            tabBar
                                .background(
                                    ZStack {
                                        Rectangle()
                                            .fill(constructor.TeamColor)
                                            .frame(height: 180)
                                            .cornerRadius(20)
                                            .ignoresSafeArea(edges: .top)

                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.black.opacity(0.0),
                                                Color.black.opacity(0.8)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                        .frame(height: 180)
                                        .ignoresSafeArea(edges: .top)
                                    }
                                )
                        }
                    }
                } else {
                    // Fallback on earlier versions
                    ScrollView {
                        VStack(spacing: 0) {
                            ZStack(alignment: .bottomLeading) {
                                Rectangle()
                                    .fill(.orange)
                                    .cornerRadius(20)
                                
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(height: 400)
                                .ignoresSafeArea(edges: .top)
                                
                                Image("McLaren")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 450)
                                    .clipped()
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading) {
                                    Text("McLaren")
                                        .font(.custom("SFPro-ExpandedBold", size: 28))
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 60)
                                
                            }
                            .frame(height: 450)
                            // Apply onScrollVisibilityChange directly to the header ZStack
                            .onScrollVisibilityChange { isVisible in
                                withAnimation {
                                    isHeaderVisible = isVisible
                                }
                            }
                            
                            VStack {
                                Spacer()
                                tabBar
                            }
                            
                            VStack(spacing: 0) {
                                tabContent
                            }
                        }
                    }
                    .ignoresSafeArea(edges: .top)
                    // Conditionally apply the title within the toolbar.
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            // Show the toolbar title only when the header is NOT visible.
                            if !isHeaderVisible {
                                HStack {
                                    Image("McLaren")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 30)
                                        .clipped()
                                        .cornerRadius(20)
                                    
                                    Text("McLaren")
                                        .font(.custom("SFPro-ExpandedBold", size: 16))
                                }
                            }
                        }
                    }
                }
            }
        }
        //.navigationBarBackButtonHidden(true)
        /*.toolbar {
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
        }*/
    
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
                                        .fill(constructor.TeamColor)
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
