//
//  StatsCardView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/31/25.
//

import SwiftUI

struct StatsCardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                
                // ---------- Qualifying Section ----------
                StatSection(title: "Qualifying", stats: [
                    StatRow(label: "Average Qualifying Position", value: "7.2", progress: 0.78),
                    StatRow(label: "Best Qualifying Position", value: "P2", progress: 0.95),
                    StatRow(label: "Outqualified Teammate %", value: "65%", progress: 0.65),
                    StatRow(label: "Q3 Appearances", value: "12", progress: 0.60)
                ])
                
                // ---------- Race Performance Section ----------
                StatSection(title: "Race Performance", stats: [
                    StatRow(label: "Average Finish", value: "6.8", progress: 0.72),
                    StatRow(label: "Points Per Race", value: "12.3", progress: 0.80),
                    StatRow(label: "Top 10 Finishes", value: "15", progress: 0.88),
                    StatRow(label: "Fastest Laps", value: "2", progress: 0.40)
                ])
                
                // ---------- Racecraft Section ----------
                StatSection(title: "Racecraft", stats: [
                    StatRow(label: "Overtakes Made", value: "48", progress: 0.70),
                    StatRow(label: "Positions Gained (Lap 1)", value: "15", progress: 0.65),
                    StatRow(label: "Battles Won %", value: "58%", progress: 0.58),
                    StatRow(label: "Defensive Success %", value: "62%", progress: 0.62)
                ])
                
            }
            .padding()
            .padding(.bottom, 80) // avoid cutoff by home bar
        }
    }
}

struct StatSection: View {
    let title: String
    let stats: [StatRow]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.custom("SFPro-ExpandedBold", size: 16))
                .foregroundStyle(.white)
                .padding(.bottom, 4)
            
            VStack(spacing: 12) {
                ForEach(stats, id: \.label) { stat in
                    HStack {
                        Text(stat.label)
                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(stat.value)
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .frame(width: 60, alignment: .trailing)
                        
                        ProgressView(value: stat.progress)
                            .progressViewStyle(StatProgressStyle())
                            .frame(width: 100)
                    }
                }
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

struct StatRow {
    let label: String
    let value: String
    let progress: Double
}

// Custom progress style (FotMob-like bar)
struct StatProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                Capsule()
                    .fill(Color.green)
                    .frame(width: geo.size.width * CGFloat(configuration.fractionCompleted ?? 0))
            }
        }
        .frame(height: 6)
    }
}

#Preview {
    StatsCardView()
}
