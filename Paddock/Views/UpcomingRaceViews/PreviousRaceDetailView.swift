import SwiftUI

struct PreviousRaceDetailView: View {
    @State private var activeTab: RaceDetailTab = .overview
    @Environment(\.dismiss) var dismiss

    private let minHeight: CGFloat = 150
    private let maxHeight: CGFloat = 220

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

                ZStack(alignment: .bottom) {
                    // Your header background
                    Image("AustrailianFlag")
                        .resizable()
                        .scaledToFill()
                        .frame(height: height)
                        .clipped()
                        .ignoresSafeArea(edges: .top)

                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.6)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: height)
                    .ignoresSafeArea(edges: .top)

                    Text("AUSTRALIA")
                        .font(.custom("SFPro-ExpandedBold", size: 28))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .offset(y: -90 * (height / maxHeight))
                        .opacity(fadeOutProgress)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.6)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: height)
                    .ignoresSafeArea(edges: .top)

                    VStack {
                        Spacer()
                        tabBar
                    }
                }
                .frame(height: height)
                .overlay(
                    HStack(spacing: 10) {
                        Text("AUSTRALIA")
                            .font(.custom("SFPro-ExpandedBold", size: 20))
                            .foregroundColor(.white)
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
                Button(action: {
                    dismiss()
                }) { 
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
