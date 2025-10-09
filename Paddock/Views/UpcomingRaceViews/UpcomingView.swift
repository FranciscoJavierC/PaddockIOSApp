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
        
    // Filter upcoming races (Session5Date >= today)
    var upcomingRaces: [RaceSchedule] {
        viewModel.races.filter { $0.Session5Date >= Date() }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(upcomingRaces, id: \.id) { race in
                            UpcomingRaceCard(
                                backgroundImage: "\(race.Country)Flag",
                                raceTitle: race.displayCountry,
                                locality: race.Location,
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
    let raceTitle: String       // Country
    let locality: String        // City or track region
    let roundNumber: String
    let raceDate: String
    let raceNameFull: String    // Full track name
    let onRaceInfoTap: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Flag Section
            ZStack(alignment: .topTrailing) {
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .cornerRadius(20)
                    .padding(15)
                    .clipped()
                    .overlay {
                        ReadabilityRoundedRectangle()
                    }
                    .shadow(radius: 3, y: 2)
                
                // Round badge
                if #available(iOS 26.0, *) {
                    Text("R\(roundNumber.replacingOccurrences(of: "Round ", with: ""))")
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .glassEffect()
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                } else {
                    Text("R\(roundNumber.replacingOccurrences(of: "Round ", with: ""))")
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Capsule().fill(Color.red.opacity(0.9)))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.9), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                }
            }
            
            // MARK: - Info Section
            VStack(alignment: .leading, spacing: 10) {
                // Country + locality
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(raceTitle.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(locality)
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                // Track info
                HStack(spacing: 6) {
                    Image(systemName: "mappin")
                        .foregroundColor(.white.opacity(0.9))
                        .imageScale(.small)
                    Text(raceNameFull)
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                        .foregroundColor(.white.opacity(0.95))
                        .lineLimit(2)
                    
                    Spacer()
                    
                    // Race date
                    Text(raceDate.uppercased())
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .foregroundColor(.red)
                        .padding(.top, 2)
                }
                
                // Weekend Info button
                HStack {
                    Spacer()
                    if #available(iOS 26.0, *) {
                        Button("Weekend Info") {
                            onRaceInfoTap()
                        }
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .padding(.horizontal, 115)
                        .buttonStyle(.glassProminent)
                        .tint(.red)
                    } else {
                        Button("Weekend Info") {
                            onRaceInfoTap()
                        }
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 18)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.red)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.white.opacity(0.9), lineWidth: 1)
                        )
                    }
                }
                .padding(.top, 6)
            }
            .padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial.opacity(0.05))
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    UpcomingView()
}

