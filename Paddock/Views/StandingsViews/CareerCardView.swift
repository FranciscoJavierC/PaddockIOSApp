//
//  CareerCardView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/31/25.
//

import SwiftUI

struct CareerCardView: View {
    let seasons: [CareerSeason] = [
        CareerSeason(teamName: "Red Bull", teamLogo: "RedBull", year: "2025", races: 12, wins: 2, podiums: 5, points: 185, rating: 7.5),
        CareerSeason(teamName: "Red Bull", teamLogo: "RedBull", year: "2024", races: 22, wins: 9, podiums: 14, points: 325, rating: 8.9)
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 12) {
                // Header Row with stat labels (icon + label combined)
                HStack(alignment: .bottom, spacing: 17) {
                    Spacer().frame(width: 110) // offset for team info
                    
                    StatColumn(icon: "flag.checkered", value: nil)
                    StatColumn(icon: "trophy", value: nil)
                    StatColumn(icon: "chart.bar", value: nil)
                    StatColumn(icon: "target", value: nil)
                    StatColumn(icon: "star", value: nil)
                }
                
                // Season Rows
                ForEach(seasons, id: \.year) { season in
                    CareerSeasonRow(season: season)
                }
            }
            .padding()
            .padding(.top, 18)
            .frame(width: 400)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
            .fixedSize(horizontal: false, vertical: true)

            // Capsule Label
            Text("CAREER")
                .font(.custom("SFPro-ExpandedRegular", size: 15))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.red)
                .clipShape(Capsule())
                .offset(y: -18)
        }
        .padding(.top, 20)
    }
}

struct CareerSeasonRow: View {
    let season: CareerSeason
    
    var body: some View {
        HStack(spacing: 16) {
            // Team Logo and Info
            HStack(spacing: 12) {
                Image(season.teamLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 34)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(season.teamName)
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                    Text(season.year)
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 120, alignment: .leading)
            
            // Stat Columns
            StatColumn(icon: nil, value: "\(season.races)")
            StatColumn(icon: nil, value: "\(season.wins)")
            StatColumn(icon: nil, value: "\(season.podiums)")
            StatColumn(icon: nil, value: "\(season.points)")
            StatColumn(icon: nil, value: String(format: "%.1f", season.rating), isRating: true)
        }
    }
}

struct StatColumn: View {
    let icon: String?
    let value: String?
    var isRating: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            if let icon {
                Image(systemName: icon)
                    .font(.system(size: 14))
            }
            
            if let value {
                if isRating {
                    Text(value)
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
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
                } else {
                    Text(value)
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                }
            }
        }
        .frame(minWidth: 28)
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
    CareerCardView()
}
