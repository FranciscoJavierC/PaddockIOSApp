//
//  ConstructorStatsView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 9/3/25.
//

import SwiftUI

struct ConstructorStatsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                CurrentSeasonStats()
                HeadToHead()
            }
            .padding()
        }
    }
}

struct CurrentSeasonStats: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 8) {
                Image("F1Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 25)
                Text("2025 Season")
                    .font(.custom("SFPro-ExpandedBold", size: 18))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            
            HStack(alignment: .top) {
                // Each VStack is a column
                VStack(spacing: 5) {
                    Text("14")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                        .foregroundColor(.white)
                    Text("Races")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 5) {
                    Text("12")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                        .foregroundColor(.white)
                    Text("Wins")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 5) {
                    Text("25")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                        .foregroundColor(.white)
                    Text("Podiums")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 5) {
                    Text("584")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                        .foregroundColor(.white)
                    Text("Points")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.8), lineWidth: 1)
        )

    }
}

struct HeadToHead: View {
    let leftDriver = "Lando Norris"
    let rightDriver = "Oscar Piastri"
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(leftDriver.uppercased())
                    .font(.custom("SFPro-ExpandedBold", size: 12))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("McLaren") // replace with team logo asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                
                Text(rightDriver.uppercased())
                    .font(.custom("SFPro-ExpandedBold", size: 12))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Divider().background(Color.white.opacity(0.4))
            
            VStack(spacing: 14) {
                statRow(label: "WINS", left: 5, right: 7)
                statRow(label: "PODIUMS", left: 7, right: 7)
                statRow(label: "POLE POSITIONS", left: 4, right: 5)
                statRow(label: "POINTS", left: 275, right: 309)
                statRow(label: "QUALIFIYING", left: 6, right: 9)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.8), lineWidth: 1)
        )
    }
    
    // MARK: - Reusable Row
    private func statRow(label: String, left: Int, right: Int) -> some View {
        HStack {
            Text("\(left)")
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(left > right ? .orange : .white)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text(label)
                .font(.custom("SFPro-ExpandedBold", size: 14))
                .foregroundColor(.white)
                .frame(width: 200)
            
            Text("\(right)")
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(right > left ? .orange : .white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func statRow(label: String, left: String, right: String) -> some View {
        HStack {
            Text(left)
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(left > right ? .orange : .white)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text(label)
                .font(.custom("SFPro-ExpandedBold", size: 14))
                .foregroundColor(.white)
                .frame(width: 200)
            
            Text(right)
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(right > left ? .orange : .white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ConstructorStatsView()
}
