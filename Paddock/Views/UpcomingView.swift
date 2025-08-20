//
//  UpcomingView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct UpcomingView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedScheduleID: String? = nil
    @State private var isExpanded = false
    
    @Environment(\.colorScheme) var colorScheme

    var cardBackground: Color {
        colorScheme == .dark ? Color(.systemGray6) : .white
    }

    var cardShadow: Color {
        colorScheme == .dark ? .white.opacity(0.2) : .black.opacity(0.3)
    }
    
    var hasFloatingTabBar: Bool


    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                NavigationLink(destination: PreviousRaceDetailView()) {
                    VStack(alignment: .leading, spacing: 30) {
                        UpcomingRaceCard(
                            backgroundImage: "AustrailianFlag",
                            raceTitle: "Australia",
                            roundNumber: "Round 1",
                            raceDate: "13–15 Mar",
                            raceNameFull: "Albert Park Circuit"
                        )
                        
                        UpcomingRaceCard(
                            backgroundImage: "AustrailianFlag",
                            raceTitle: "Australia",
                            roundNumber: "Round 1",
                            raceDate: "13–15 Mar",
                            raceNameFull: "Albert Park Circuit"
                        )
                        UpcomingRaceCard(
                            backgroundImage: "AustrailianFlag",
                            raceTitle: "Australia",
                            roundNumber: "Round 1",
                            raceDate: "13–15 Mar",
                            raceNameFull: "Albert Park Circuit"
                        )

                        UpcomingRaceCard(
                            backgroundImage: "AustrailianFlag",
                            raceTitle: "Australia",
                            roundNumber: "Round 1",
                            raceDate: "13–15 Mar",
                            raceNameFull: "Albert Park Circuit"
                        )

                    }
                }
                .buttonStyle(.plain)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 115 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
                   Color.clear.frame(height: 10)
               }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct UpcomingRaceCard: View {
    let backgroundImage: String
    let raceTitle: String
    let roundNumber: String
    let raceDate: String
    let raceNameFull: String
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Image
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            // Dark overlay for readability
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame(maxWidth: .infinity, maxHeight: 130)
                .cornerRadius(20)
            
            // Race Title at the top center
            Text(raceTitle.uppercased())
                .font(.custom("SFPro-ExpandedBold", size: 28))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .offset(y: 40)
            
            // Bottom Info Box
            VStack(alignment: .leading, spacing: 5) {
                // Top row with "Testing Round" and date
                HStack {
                    Text(roundNumber)
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)
                    Spacer()
                    Text(raceDate)
                        .font(.custom("SFPro-ExpandedRegular", size: 16))
                        .foregroundColor(.white)
                }
                .padding(.top, 10)
                
                // Thin dashed line
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .foregroundColor(.white.opacity(0.4))
                    .frame(height: 1)
                
                // Second row with race name and button
                HStack {
                    Image(systemName: "mappin")
                        .foregroundColor(.white)

                    Text(raceNameFull)
                        .font(.custom("SFPro-ExpandedRegular", size: 13))
                        .foregroundColor(.white)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Text("View Details")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.red)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 95) // Fixed height for info box
            .background(Color(.red))
            .cornerRadius(20)
            .overlay( // This adds the thin border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(1.0), lineWidth: 1.5)
            )
            .offset(y: 109) // Adjust position to appear at the bottom of the card
            
        }
        .frame(height: 200) // Total height of the card
        .padding(.horizontal)
    }
}

#Preview {
    UpcomingView(hasFloatingTabBar: true)
}
