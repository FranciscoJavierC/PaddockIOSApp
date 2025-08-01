//
//  ProfileCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/31/25.
//

import SwiftUI

struct ProfileCardView: View {
    var age: Int = 0
    var birthDate: String = ""
    var driverFlag: String = ""
    var driverNumber: Int = 0
    var height: Double = 0.0
    var raceStarts: Int = 0
    var wins: Int = 0
    var podiums: Int = 0
    var points: Int = 0
    var rating: Double = 0.0
    var championships: Int = 0

    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {

                // Top Section: Nationality + Age
                VStack(spacing: 16) {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack(spacing: 6) {
                                Image(driverFlag)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 28, height: 20)
                                    .clipShape(Circle())

                                Text("AUS")
                                    .font(.custom("SFPro-ExpandedRegular", size: 16))
                                    .fontWeight(.medium)
                            }
                            Text("Nationality")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 6) {
                            Text("\(age)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text(birthDate)
                                .font(.custom("SFPro-ExpandedRegular", size: 16))
                                .foregroundColor(.secondary)
                        }
                    }

                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("\(driverNumber)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("Number")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 6) {
                            Text(String(format: "%.1f ft", height))
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("Height")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                }

                Divider()

                // Middle Section: Current Season Stats
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        Image("F1Logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                        Text("2025 Season")
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                    }
                    .padding(.horizontal, 15)

                    HStack(spacing: 24) {
                        VStack {
                            Text("\(raceStarts)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                                .padding(.vertical, 8)
                            Text("Races")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }

                        VStack {
                            Text("\(wins)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                                .padding(.vertical, 8)
                            Text("Wins")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }

                        VStack {
                            Text("\(podiums)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                                .padding(.vertical, 8)
                            Text("Podiums")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }

                        VStack {
                            Text("\(points)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                                .padding(.vertical, 8)
                            Text("Points")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }

                        VStack {
                            Text(String(format: "%.1f", rating))
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                                .padding(.horizontal, 9)
                                .padding(.vertical, 8)
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
                            Text("Rating")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                }

                Divider()

                // Bottom Section: Trophies (only if applicable)
                if championships > 0 {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Trophies")
                            .font(.custom("SFPro-ExpandedBold", size: 16))

                        HStack(spacing: 8) {
                            Image("RedBull")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .cornerRadius(4)

                            Text("Red Bull")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                        }

                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.yellow)
                                .frame(width: 20, height: 20)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(championships) World Drivers Championship")
                                    .font(.custom("SFPro-ExpandedRegular", size: 14))
                                Text("(2021, 2022, 2023, 2024)")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .padding()
            .frame(width: 400)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
            .fixedSize(horizontal: false, vertical: true)

            // Capsule Label
            Text("PROFILE")
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

#Preview {
    ProfileCardView()
}
