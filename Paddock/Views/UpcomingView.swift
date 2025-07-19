//
//  UpcomingView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct Session {
    let title: String
    let day: String
    let time: String
}

let scheduleData: [Session] = [
    .init(title: "Practice 1", day: "FRI", time: "12:30 - 13:30"),
    .init(title: "Practice 2", day: "FRI", time: "16:00 - 17:00"),
    .init(title: "Practice 3", day: "SAT", time: "12:30 - 13:30"),
    .init(title: "Qualifying", day: "SAT", time: "16:00 - 17:00"),
    .init(title: "Race",       day: "SUN", time: "15:00")
]

struct UpcomingView: View {
    @Environment(\.colorScheme) var colorScheme

    var cardBackground: Color {
        colorScheme == .dark ? Color(.systemGray6) : .white
    }

    var cardShadow: Color {
        colorScheme == .dark ? .white.opacity(0.2) : .black.opacity(0.3)
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(cardBackground)
                        .frame(width: 400, height: 570)
                        .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

                    VStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Round 1")
                                        .font(.headline)
                                        .foregroundColor(.adaptiveText)
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 100, height: 25)
                                        .foregroundColor(.red)
                                        .overlay(
                                            Text("UP NEXT")
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                            
                                        )
                                }
                                
                                
                                HStack(spacing: 8) {
                                    Image("AustrailianFlag")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 24)
                                        .cornerRadius(8)
                                    Text("AUSTRALIA")
                                        .foregroundColor(.adaptiveText)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                
                                Text("FORMULA 1 LOUIS VUITTON AUSTRALIAN GRAND PRIX 2025")
                                    .foregroundColor(.adaptiveText)
                                    .font(.headline)
                                
                                Text("13-15 Mar")
                                    .foregroundColor(.adaptiveText)
                            }
                            Image("AustrailianGP")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                                .padding(.top, 20)
                                .padding(.trailing, 20)
                        }
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image("AustralianWide")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 380, height: 200)
                            .cornerRadius(10)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray5))
                                .frame(width: 380, height: 170)
                            
                            Grid(horizontalSpacing: 0, verticalSpacing: 12) {
                                ForEach(scheduleData, id: \.title) { session in
                                    GridRow {
                                        Text(session.title)
                                            .foregroundColor(.adaptiveText)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                        Text(session.day)
                                            .foregroundColor(.secondary)
                                            .frame(maxWidth: .infinity, alignment: .center)

                                        Text(session.time)
                                            .foregroundColor(.adaptiveText)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                }

                ForEach(0..<4) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .frame(width: 400, height: 120)
                            .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                        HStack(spacing: 12) {
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                .padding(.leading, 40)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Round 1")
                                    .font(.subheadline)
                                    .foregroundColor(.adaptiveText)
                                Text("Australian GP")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.adaptiveText)
                                Text("Melbourne")
                                    .font(.subheadline)
                                    .foregroundColor(.adaptiveText)
                            }

                            Spacer()

                            Image("AustrailianGP")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .cornerRadius(10)

                            VStack(spacing: 2) {
                                Text("13-15")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text("MAR")
                                    .font(.caption)
                            }
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.trailing, 40)
                        }
                    }
                }
            }
        }
        .padding(.vertical, -10)
        .safeAreaInset(edge: .top, spacing: 0) {
            Color.clear.frame(height: 10)
        }
        .safeAreaPadding(.bottom, 70)
    }
}


#Preview {
    UpcomingView()
}
