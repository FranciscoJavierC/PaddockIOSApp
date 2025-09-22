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
    @State private var navigateToDetails = false
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 30) {
                        
                        UpcomingRaceCard(
                            backgroundImage: "AustrailianFlag",
                            raceTitle: "Australia",
                            roundNumber: "Round 1",
                            raceDate: "13–15 Mar",
                            raceNameFull: "Albert Park Circuit"
                        ) {
                            navigateToDetails = true
                        }
                        
                        UpcomingRaceCard(
                            backgroundImage: "ChinaFlag",
                            raceTitle: "China",
                            roundNumber: "Round 2",
                            raceDate: "20–23 Mar",
                            raceNameFull: "Shanghai International Circuit"
                        ) {
                            navigateToDetails = true
                        }
                        
                        UpcomingRaceCard(
                            backgroundImage: "JapanFlag",
                            raceTitle: "Japan",
                            roundNumber: "Round 3",
                            raceDate: "05–06 Apr",
                            raceNameFull: "Suzuka Circuit"
                        ) {
                            navigateToDetails = true
                        }
                        
                        UpcomingRaceCard(
                            backgroundImage: "BahrainFlag",
                            raceTitle: "Bahrain",
                            roundNumber: "Round 4",
                            raceDate: "11–13 Apr",
                            raceNameFull: "Bahrain International Circuit"
                        ) {
                            navigateToDetails = true
                        }
                    }
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToDetails) {
                PreviousRaceDetailView()
            }
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
    let onRaceInfoTap: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
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
                        onRaceInfoTap()
                    }) {
                        Text("Race Info")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.red)
                            )
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.9), lineWidth: 1.2)
                            )
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 95) // Fixed height for info box
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(1.0), lineWidth: 1.5)
            )
            .offset(y: 109)
            
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}

// Placeholder detail view
struct RaceDetailView: View {
    var body: some View {
        Text("Race Details Screen")
            .font(.title)
            .padding()
    }
}

#Preview {
    UpcomingView()
}
