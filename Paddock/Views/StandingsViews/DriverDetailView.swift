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
    
    // State to track if the content header is visible.
    @State private var isHeaderVisible: Bool = true

    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                ScrollView {
                    VStack(spacing: 0) {
                        // Keep your original header design
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .fill(driver.TeamColor)
                                .frame(maxWidth: .infinity, maxHeight: 500)
                                .cornerRadius(20)
            
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .black.opacity(0.5),
                                    .black.opacity(0)
                                ]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                            .cornerRadius(20)
                            
                            Image(driver.FullName)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 400, alignment: .top)
                                .clipped()
                            
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .black.opacity(0.5),
                                    .black.opacity(0)
                                ]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Image(driver.ConstructorNames.first ?? "Default")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                Text(driver.FullName)
                                    .font(.custom("SFPro-ExpandedBold", size: 28))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30 )
                        }
                        .frame(height: 450)
                        
                        // Apply onScrollVisibilityChange directly to the header ZStack
                        .onScrollVisibilityChange { isVisible in
                            withAnimation {
                                isHeaderVisible = isVisible
                            }
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
                .scrollEdgeEffectHidden(isHeaderVisible)
                .ignoresSafeArea(edges: .top)
                // Conditionally apply the title within the toolbar.
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        // Show the toolbar title only when the header is NOT visible.
                        if !isHeaderVisible {
                            HStack {
                                
                                Text("O.Piastri")
                                    .font(.custom("SFPro-ExpandedBold", size: 16))
                            }
                        }
                    }
                }
            } else {
                // Fallback on earlier versions
                ScrollView {
                    VStack(spacing: 0) {
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
                            .frame(height: 450)
                            .ignoresSafeArea(edges: .top)
                            
                            Image("McLaren")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 450)
                                .clipped()
                                .cornerRadius(20)
                            
                            Image("Piastri")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 400, alignment: .top)
                                .clipped()
                            
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0),
                                    Color.black.opacity(0.8)
                                ]), startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 450)
                            .ignoresSafeArea(edges: .top)
                            
                            VStack(alignment: .leading) {
                                Image("McLaren")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                
                                Text("Oscar Piastri")
                                    .font(.custom("SFPro-ExpandedBold", size: 28))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 60 )
                        }
                        .frame(height: 450)
                        
                        // Apply onScrollVisibilityChange directly to the header ZStack
                        .onScrollVisibilityChange { isVisible in
                            withAnimation {
                                isHeaderVisible = isVisible
                            }
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
                .ignoresSafeArea(edges: .top)
                // Conditionally apply the title within the toolbar.
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        // Show the toolbar title only when the header is NOT visible.
                        if !isHeaderVisible {
                            HStack {
                                
                                Text("O.Piastri")
                                    .font(.custom("SFPro-ExpandedBold", size: 16))
                            }
                        }
                    }
                }
            }
        }
    }
    
        //.ignoresSafeArea(edges: .top)
        //.navigationBarBackButtonHidden(true)
        /*.toolbar {
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
        }*/

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
                                        .fill(driver.TeamColor)
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
