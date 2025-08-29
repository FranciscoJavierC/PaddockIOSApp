//
//  PreviewConstructorStandingsView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 8/28/25.
//

import SwiftUI

// ---- Column/grid constants (used by header + rows) ----
private let posColW: CGFloat   = 15
private let avatarColW: CGFloat = 40
private let statColW: CGFloat  = 30
private let ptsColW: CGFloat   = 45
private let rowInnerInset: CGFloat = 12   // inside each row card
private let headerInset: CGFloat   = 28   // 16 (row outer) + 12 (row inner) to match rows

struct PreviewConstructorStandingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                VStack(alignment: .center, spacing: 12) {
                    // Title
                    HStack {
                        Image("F1Logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Formula 1 Constructor Standings")
                            .font(.custom("SFPro-ExpandedBold", size: 14))
                    }
                    
                    // ----- Column Headers (aligned to row grid) -----
                    HStack(spacing: 4) {
                        Text("#").frame(width: posColW, alignment: .leading)
                        
                        Text("Constructor").frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("RS").frame(width: statColW)
                        Text("W").frame(width: statColW)
                        Text("P").frame(width: statColW)
                        Text("PTS").frame(width: ptsColW, alignment: .trailing)
                    }
                    .font(.custom("SFPro-ExpandedBold", size: 14))
                    .padding(.horizontal, headerInset) // <-- matches row’s content inset
                    
                    // ----- Your rows (unchanged design, aligned) -----
                    ConstructorRowCard(position: 1, teamName: "McLaren",
                                  races: 14, wins: 6, podiums: 12, points: 559,
                                  teamImage: "McLaren", teamColor: .orange)
                    ConstructorRowCard(position: 2, teamName: "Ferrari",
                                  races: 14, wins: 5, podiums: 12, points: 260,
                                  teamImage: "Ferrari", teamColor: .red)
                    ConstructorRowCard(position: 3, teamName: "Mercedes",
                                  races: 14, wins: 2, podiums: 5, points: 236,
                                  teamImage: "Mercedes", teamColor: .teal)
                    ConstructorRowCard(position: 4, teamName: "Red Bull",
                                  races: 14, wins: 2, podiums: 5, points: 194,
                                  teamImage: "RedBull", teamColor: .blue)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
                
                VStack(alignment: .leading) {
                    Text ("Legend")
                        .font(.custom("SFPro-ExpandedRegular", size: 15))
                    
                    HStack {
                        Text("RS")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                        
                        Text("Race Starts")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                    }
                    HStack {
                        Text("W")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                        
                        Text("Wins")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                    }
                    HStack {
                        Text("P")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                        
                        Text("Podiums")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                    }
                    HStack {
                        Text("PTS")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                        
                        Text("Points")
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Driver Row Card (keeps your look; aligns to the grid)
struct ConstructorRowCard: View {
    let position: Int
    let teamName: String
    let races: Int
    let wins: Int
    let podiums: Int
    let points: Int
    let teamImage: String
    let teamColor: Color

    var body: some View {
        ZStack {
            Rectangle().fill(teamColor).cornerRadius(12)
            Rectangle().fill(Color.black.opacity(0.4)).cornerRadius(12)

            HStack(spacing: 4) {
                Text("\(position)")
                    .frame(width: posColW, alignment: .leading)
                    .font(.custom("SFPro-ExpandedBold", size: 14))
                    .foregroundColor(.white)

                Image(teamImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: avatarColW, height: 40, alignment: .top)
                    
                VStack(alignment: .leading, spacing: 2) {
                    Text(teamName)
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // stats columns (monospaced digits keep them steady)
                Text("\(races)").frame(width: statColW).monospacedDigit()
                    .font(.custom("SFPro-ExpandedRegular", size: 12))

                Text("\(wins)").frame(width: statColW).monospacedDigit()
                    .font(.custom("SFPro-ExpandedRegular", size: 12))

                Text("\(podiums)").frame(width: statColW).monospacedDigit()
                    .font(.custom("SFPro-ExpandedRegular", size: 12))

                Text("\(points)").frame(width: ptsColW, alignment: .trailing).monospacedDigit()
                    .font(.custom("SFPro-ExpandedRegular", size: 12))

            }
            .padding(.horizontal, rowInnerInset) // <-- inner content inset
        }
        .frame(height: 60)
        .padding(.horizontal) // outer inset (16) that header accounts for
        
    }
}

#Preview {
    PreviewConstructorStandingsView()
}
