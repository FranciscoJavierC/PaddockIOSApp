//
//  SeasonsCardView.swift
//  Paddock
//
//  Created by Francisco Cortez on 8/29/25.
//

import SwiftUI

struct SeasonsCardView: View {
    let seasons: [CareerSeason] = [
        CareerSeason(
            teamName: "McLaren",
            teamLogo: "McLaren",
            year: "2025",
            races: 14,
            wins: 6,
            podiums: 12,
            points: 673,
            rating: 8.8
        ),
        CareerSeason(
            teamName: "McLaren",
            teamLogo: "McLaren",
            year: "2024",
            races: 22,
            wins: 9,
            podiums: 14,
            points: 325,
            rating: 8.9
        )
    ]
    
    var body: some View {
        ScrollView {
            // This is the single card container
            VStack(spacing: 12) {
                // Header at the top of the single card
                HStack {
                    Text("Senior Career")
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 25) {
                        Image(systemName: "flag.checkered")
                            .font(.system(size: 13))
                        Image(systemName: "trophy")
                            .font(.system(size: 13))
                        Image(systemName: "chart.bar")
                            .font(.system(size: 13))
                        Image(systemName: "medal")
                            .font(.system(size: 13))
                        Image(systemName: "star")
                            .font(.system(size: 13))
                    }
                    .frame(width: 220, alignment: .center)
                }
                .padding(.horizontal)
                
                // ForEach to display each season's stats within the same card
                ForEach(seasons, id: \.year) { season in
                    HStack {
                        // Left: Team info
                        HStack(spacing: 12) {
                            Image(season.teamLogo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(season.teamName)
                                    .font(.custom("SFPro-ExpandedBold", size: 13))
                                Text(season.year)
                                    .font(.custom("SFPro-ExpandedRegular", size: 11))
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 18) {
                            Text("\(season.races)")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .gridColumnAlignment(.center)
                            
                            Text("\(season.wins)")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .gridColumnAlignment(.center)
                            
                            Text("\(season.podiums)")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .gridColumnAlignment(.center)
                            
                            Text("\(season.points)")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .gridColumnAlignment(.center)
                            
                            Text(String(format: "%.1f", season.rating))
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .padding(.horizontal, 7)
                                .background(
                                    Capsule()
                                        .fill(LinearGradient(
                                            colors: [Color.green.opacity(0.7), Color.green.opacity(0.3)],
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                        .overlay(
                                            Capsule()
                                                .stroke(Color.green, lineWidth: 1)
                                        )
                                )

                        }
                        .frame(width: 205, alignment: .center)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white.opacity(0.8), lineWidth: 1)
            )
            .padding()
            .padding(.bottom, 80)
        }
    }
}

struct CareerSeason {
    let teamName: String
    let teamLogo: String
    let year: String
    let races: Int
    let wins: Int
    let podiums: Int
    let points: Int
    let rating: Double
}

#Preview {
    SeasonsCardView()
}
