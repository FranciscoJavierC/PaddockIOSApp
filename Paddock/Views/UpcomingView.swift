//
//  UpcomingView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

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
                        .frame(width: 400, height: 400)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)
                        .overlay(
                            Image("AustrailianGP")
                        )
                    
                    Text("Race Starts in")
                        .foregroundColor(.adaptiveText)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 170)
                        .padding(.top, 170)
                    
                    Text("01 16 46")
                        .foregroundColor(.adaptiveText)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 240)
                        .padding(.top, 250)
                    
                    Text("Days Hours Minutes")
                        .foregroundColor(.adaptiveText)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 90)
                        .padding(.top, 320)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Round 1")
                                .font(.headline)
                                .foregroundColor(.adaptiveText)
                            Text("Australian GP")
                                .foregroundColor(.adaptiveText)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Melbourne")
                                .foregroundColor(.adaptiveText)
                                .font(.headline)
                        }
                        .padding(.leading, 150)
                        .padding(.bottom, 280)

                        Spacer()

                        VStack(spacing: 4) {
                            Text("13-15")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.title2)
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.trailing, 30)
                        .padding(.bottom, 280)
                        
                        VStack(spacing: 4) {
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, style: StrokeStyle(lineWidth: 4)))
                        }
                        .padding(.leading, -400)
                        .padding(.top, -180)
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
