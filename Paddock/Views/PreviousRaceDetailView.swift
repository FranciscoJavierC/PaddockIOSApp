import SwiftUI

struct PreviousRaceDetailView: View {
    @State private var activeTab: RaceDetailTab = .overview
    @Environment(\.dismiss) var dismiss


    var body: some View {
        VStack(spacing: 0) {
            header
            
            VStack(spacing: 0) {
                tabBar
                Divider().background(Color.white.opacity(0.3))
                tabContent
            }
            .frame(maxWidth: 450, minHeight: UIScreen.main.bounds.height - 200)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white.opacity(0.8), lineWidth: 1)
            )
            .offset(y: -30)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true) // 1. Hides the default back button
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

    // MARK: - Header
    private var header: some View {
        ZStack(alignment: .bottom) {
            Image("AustrailianFlag")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .ignoresSafeArea(edges: .top)

            Rectangle()
                .fill(Color.black.opacity(0.4))
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)

            Text("AUSTRALIA")
                .font(.custom("SFPro-ExpandedBold", size: 28))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .offset(y: -130)
        }
        .frame(height: 300)
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
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.red)
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
        case .schedule:
            ScheduleDetailView()
        case .circuit:
            CircuitInfoView()
        }
    }
}

// MARK: - Tabs enum
enum RaceDetailTab: String, CaseIterable {
    case overview = "Overview"
    case schedule = "Schedule"
    case circuit = "Circuit"
}

#Preview {
    PreviousRaceDetailView()
}
