//
//  PreviousView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct PreviousView: View {
    @State private var selectedRace: RaceSchedule? = nil
    @State private var showDetail = false
    @StateObject private var viewModel = ScheduleViewModel()
    
    // Filter past races
    var pastRaces: [RaceSchedule] {
        viewModel.races
            .filter { $0.Session5Date < Date() }
            .sorted { $0.Session1Date > $1.Session1Date }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(pastRaces, id: \.id) { race in
                            PreviousRaceCard(
                                backgroundImage: "\(race.Country)Flag", // your naming convention
                                raceTitle: race.displayCountry,
                                locality: race.Location,
                                roundNumber: "Round \(race.RoundNumber)",
                                raceNameFull: race.circuitName ?? "Unknown Circuit",
                                raceDate: race.dayRangeWithMonth
                            ) {
                                selectedRace = race
                                showDetail = true
                            }
                        }
                    }
                    Spacer().frame(height: 20)
                }
            }
            .navigationDestination(isPresented: $showDetail) {
                if let race = selectedRace {
                    PreviousRaceDetailView(race: race)
                }
            }
        }
    }
}

struct PreviousRaceCard: View {
    let backgroundImage: String
    let raceTitle: String
    let locality: String
    let roundNumber: String
    let raceNameFull: String
    let raceDate: String
    let onFullResultsTap: () -> Void

    var body: some View {
        ZStack {
            // MARK: - Card background + content
            VStack(spacing: 0) {
                // Flag Section
                ZStack(alignment: .topTrailing) {
                    Image(backgroundImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 190)
                        .cornerRadius(20)
                        .padding(15)
                        .clipped()
                        .overlay { ReadabilityRoundedRectangle() }
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

                // Info Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(raceTitle.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                        Spacer()
                        Text(locality)
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                            .foregroundColor(.white.opacity(0.9))
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "mappin")
                            .foregroundColor(.white.opacity(0.9))
                            .imageScale(.small)
                        Text(raceNameFull)
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                            .foregroundColor(.white.opacity(0.95))
                            .lineLimit(2)
                        Spacer()
                        Text(raceDate.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 15))
                            .foregroundColor(.red)
                            .padding(.top, 2)
                    }

                    // Add some space for button overlay
                    Spacer().frame(height: 40)
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
            .allowsHitTesting(false) // disables tap on entire card, only button is tappable

            // MARK: - Force tappable button overlay
            VStack {
                Spacer()
                if #available(iOS 26.0, *) {
                    Button("Weekend Info") {
                        onFullResultsTap()
                    }
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .buttonStyle(.glassProminent)
                    .tint(.red)
                    .contentShape(Rectangle())
                } else {
                    Button("Weekend Info") {
                        onFullResultsTap()
                    }
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(RoundedRectangle(cornerRadius: 18).fill(Color.red))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.9), lineWidth: 1)
                    )
                    .contentShape(Rectangle())
                }
            }
            .padding(.bottom, 20) // adjust button position
        }
    }
}

#Preview {
    PreviousView()
}
