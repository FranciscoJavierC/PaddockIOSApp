//
//  ConstructorHistoryView.swift
//  Paddock
//
//  Created by Francisco Cortez on 9/3/25.
//

// MARK: - API Endpoints Needed / Notes
//
// ConstructorHistoryView
//
// 1. Historical WCC Positions
//    - Jolpica: https://api.jolpi.ca/ergast/f1/{year}/constructors/{constructorID}/constructorstandings
//    - Replace {year} with each season and {constructorID} with the constructor (e.g., "mclaren").
//    - Each call returns the final standing position for that season.
//
// 2. Implementation Note:
//    - To avoid hitting the API for dozens of seasons every app launch, consider caching the results locally.
//      Options include:
//        • Storing the fetched data in a local JSON file bundled with the app.
//        • Using UserDefaults or a local database (e.g., Core Data or SQLite) for persistent caching.
//    - This also improves app performance and offline support.

import SwiftUI
import Charts

struct ConstructorHistoryView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                HistoricalStandingPosition()
            }
            .padding()
        }
    }
}

struct HistoricalStandingPosition: View {
    let historyData: [StandingHistory] = [
        StandingHistory(year: "2011", position: 2),
        StandingHistory(year: "2012", position: 3),
        StandingHistory(year: "2013", position: 5),
        StandingHistory(year: "2014", position: 5),
        StandingHistory(year: "2015", position: 9),
        StandingHistory(year: "2016", position: 6),
        StandingHistory(year: "2017", position: 9),
        StandingHistory(year: "2018", position: 6),
        StandingHistory(year: "2019", position: 4),
        StandingHistory(year: "2020", position: 3),
        StandingHistory(year: "2021", position: 4),
        StandingHistory(year: "2022", position: 5),
        StandingHistory(year: "2023", position: 4),
        StandingHistory(year: "2024", position: 1),
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Historical Standings Positions")
                .font(.custom("SFPro-ExpandedBold", size: 15))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                let reversedHistoryData = historyData.reversed() // newest year first

                Chart(reversedHistoryData) { item in
                    LineMark(
                        x: .value("Year", item.year),
                        y: .value("Position", item.position)
                    )
                    .foregroundStyle(Color.white)
                    .lineStyle(StrokeStyle(lineWidth: 2, lineCap: .round))
                    
                    PointMark(
                        x: .value("Year", item.year),
                        y: .value("Position", item.position)
                    )
                    .symbolSize(500)
                    .foregroundStyle(Color.orange)
                    .annotation(position: .overlay) {
                        Text("\(item.position)")
                            .font(.custom("SFPro-ExpandedBold", size: 11))
                            .foregroundColor(.white)
                    }
                }
                .chartYScale(domain: .automatic(reversed: true))
                .chartXAxis {
                    AxisMarks(values: .automatic) { value in
                        AxisGridLine(stroke: StrokeStyle(dash: [5]))
                            .foregroundStyle(.gray.opacity(0.3))
                        AxisTick()
                        AxisValueLabel(anchor: .top) {
                            Text(value.as(String.self) ?? "")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                                .foregroundColor(.white)
                                .offset(y: 10)
                        }
                    }
                }
                .chartYAxis(.hidden)
                .chartYScale(domain: 1...10)
                .frame(width: CGFloat(historyData.count) * 60, height: 250)
                .padding(.bottom, 15) // extra space for X-axis labels
                
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.8), lineWidth: 1)
        )
    }
    
    private func isCurrentYear(_ item: StandingHistory) -> Bool {
        return item.year == historyData.last?.year
    }
}

// MARK: - Model
struct StandingHistory: Identifiable {
    let id = UUID()
    let year: String
    let position: Int
}

#Preview {
    ConstructorHistoryView()
        .preferredColorScheme(.dark)
}
