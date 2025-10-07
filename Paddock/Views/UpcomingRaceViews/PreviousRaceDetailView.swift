import SwiftUI

struct PreviousRaceDetailView: View {
    @State private var activeTab: RaceDetailTab = .overview
    @Environment(\.dismiss) var dismiss
    
    // State to track if the content header is visible.
    @State private var isHeaderVisible: Bool = true

    var body: some View {
        NavigationStack {
            if #available(iOS 26.0, *) {
                GeometryReader { geometry in
                    ScrollView {
                        VStack(spacing: 0) {
                            // MARK: - Header
                            ZStack(alignment: .bottom) {
                                Image("AustraliaFlag")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: 300) // 1. Use the geometry reader's width
                                    .clipped()
                                    .ignoresSafeArea(edges: .top)
                                
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0),
                                        Color.black.opacity(0.7)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(width: geometry.size.width, height: 300) // 1. Use the geometry reader's width
                                .ignoresSafeArea(edges: .top)
                                
                                Text("AUSTRALIA")
                                    .font(.custom("SFPro-ExpandedBold", size: 28))
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                                    .padding(.bottom, 130)
                                
                                if isHeaderVisible {
                                    tabBar
                                }
                            }
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
                                Image("AustrailianFlag")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .cornerRadius(3)
                                
                                Text("Australia")
                                    .font(.custom("SFPro-ExpandedBold", size: 16))
                            }
                        }
                    }
                }
                .safeAreaInset(edge: .top) {
                    if !isHeaderVisible {
                        tabBar
                            .background(Color.black.opacity(0.6))
                    }
                }
                
            } else {
                // Fallback on earlier versions
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - Header
                        ZStack(alignment: .bottom) {
                            Image("AustrailianFlag")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 220)
                                .clipped()
                                .ignoresSafeArea(edges: .top)
                            
                            // Subtle top gradient for legibility over the image
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0.35), .clear]),
                                startPoint: .top,
                                endPoint: .center
                            )
                            .ignoresSafeArea(edges: .top)
                            
                            Text("AUSTRALIA")
                                .font(.custom("SFPro-ExpandedBold", size: 28))
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                                .padding(.bottom, 90)
                        }
                        // Apply onScrollVisibilityChange directly to the header ZStack
                        .onScrollVisibilityChange { isVisible in
                            withAnimation {
                                isHeaderVisible = isVisible
                            }
                        }
                        
                        VStack {
                            Spacer()
                            if isHeaderVisible {
                                tabBar
                            }
                        }
                        
                        // MARK: - Tab Content
                        tabContent
                            .padding(.top, 16)
                    }
                }
                .ignoresSafeArea(edges: .top)

                // Conditionally apply the title within the toolbar.
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        // Show the toolbar title only when the header is NOT visible.
                        if !isHeaderVisible {
                            HStack {
                                Image("AustrailianFlag")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .cornerRadius(3)
                                
                                
                                Text("Australia")
                                    .font(.custom("SFPro-ExpandedBold", size: 16))
                            }
                        }
                    }
                }
                .safeAreaInset(edge: .top) {
                    if !isHeaderVisible {
                        tabBar
                            .background(Color.black.opacity(0.6))
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Tab Bar
    private var tabBar: some View {
        HStack {
            ForEach(RaceDetailTab.allCases, id: \.self) { tab in
                Button(action: { activeTab = tab }) {
                    Text(tab.rawValue)
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(activeTab == tab ? .white : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if activeTab == tab {
                                    Rectangle()
                                        .fill(Color.red)
                                        .frame(height: 3)
                                        .offset(y: 25)
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
        case .overview:
            OverviewView()
        case .standings:
            StandingsDetailView()
        case .circuit:
            CircuitInfoView()
        }
    }
}

// MARK: - Tabs enum
enum RaceDetailTab: String, CaseIterable {
    case overview = "Overview"
    case standings = "Standings"
    case circuit = "Circuit"
}

#Preview {
    PreviousRaceDetailView()
}
