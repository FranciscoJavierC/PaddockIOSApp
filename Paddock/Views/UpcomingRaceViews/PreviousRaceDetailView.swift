import SwiftUI

struct PreviousRaceDetailView: View {
    @State private var activeTab: RaceDetailTab = .overview
    @Environment(\.dismiss) var dismiss
    
    // State to track if the content header is visible.
    @State private var isHeaderVisible: Bool = true

    var body: some View {
        NavigationStack {
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
                        tabBar
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
                                .cornerRadius(20)
                                .clipped()
                            
                            Text("Australia")
                                .font(.custom("SFPro-ExpandedBold", size: 16))
                        }
                    }
                }
            }
        }
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
