//
//  StatsCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/31/25.
//

import SwiftUI

struct StatsCardView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Stats")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .padding(.bottom, 8)

                Group {
                    Text("Qualifying")
                        .font(.custom("SFPro-ExpandedBold", size: 14))

                    StatRowView(label: "Avg Qual", value: "4.3", percentage: 0.7, highlightColor: .green)
                    StatRowView(label: "Best Qual", value: "P1", percentage: 1.0, highlightColor: .green)
                    StatRowView(label: "Q3 Appearances", value: "12 / 13", percentage: 0.92, highlightColor: .green)
                    StatRowView(label: "Poles", value: "5", percentage: 0.5, highlightColor: .green)
                }
                
                Divider()

                Group {
                    Text("Race")
                        .font(.custom("SFPro-ExpandedBold", size: 14))

                    StatRowView(label: "Avg Finish", value: "5.1", percentage: 0.6, highlightColor: .blue)
                    StatRowView(label: "Best Finish", value: "P1", percentage: 1.0, highlightColor: .blue)
                    StatRowView(label: "Overtakes", value: "48", percentage: 0.75, highlightColor: .blue)
                    StatRowView(label: "Positions Gained", value: "+26", percentage: 0.6, highlightColor: .blue)
                }
                
                Divider()

                Group {
                    Text("Consistency")
                        .font(.custom("SFPro-ExpandedBold", size: 14))

                    StatRowView(label: "DNFs", value: "2", percentage: 0.15, highlightColor: .orange)
                    StatRowView(label: "Laps Completed", value: "852", percentage: 0.9, highlightColor: .orange)
                    StatRowView(label: "Beat Teammate", value: "9 / 13", percentage: 0.7, highlightColor: .orange)
                }
            }
            .padding()
            .frame(width: 400)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
            .fixedSize(horizontal: false, vertical: true)

            // Capsule Label
            Text("STATS")
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

struct StatRowView: View {
    let label: String
    let value: String
    let percentage: Double // 0.0 to 1.0
    let highlightColor: Color

    var body: some View {
        HStack {
            Text(label)
                .font(.custom("SFPro-ExpandedRegular", size: 14))
                .foregroundColor(.primary)

            Spacer()

            Text(value)
                .font(.custom("SFPro-ExpandedRegular", size: 14))
                .foregroundColor(.secondary)

            ProgressView(value: percentage)
                .progressViewStyle(LinearProgressViewStyle(tint: highlightColor))
                .frame(width: 80)
        }
    }
}

#Preview {
    StatsCardView()
}
