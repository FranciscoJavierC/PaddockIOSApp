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
    @StateObject private var viewModel = ScheduleViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    // Filter upcoming races (Session5Date >= today)
    var upcomingRaces: [RaceSchedule] {
        viewModel.races.filter { $0.Session5Date >= Date() }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 50) {
                        ForEach(upcomingRaces, id: \.id) { race in
                            UpcomingRaceCard(
                                backgroundImage: "\(race.Country)Flag",
                                raceTitle: race.displayCountry,
                                roundNumber: "Round \(race.RoundNumber)",
                                raceDate: race.dayRangeWithMonth,
                                raceNameFull: race.circuitName ?? "Unknown Circuit"
                            ) {
                                navigateToDetails = true
                            }
                        }
                    }
                    Spacer().frame(height: 20)
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
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.5),
                    Color.black.opacity(0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Race Title at the top center
            Text(raceTitle.uppercased())
                .font(.custom("SFPro-ExpandedBold", size: 28))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .offset(y: 80)
            
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
            .offset(y: 130)
            
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

