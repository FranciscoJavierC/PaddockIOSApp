//
//  DriverDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/18/25.
//

import SwiftUI

struct DriverDetailView: View {
    let teamColor = LinearGradient(
        colors: [Color(red: 0.0, green: 0.09, blue: 0.3), Color(red: 0.8, green: 0.0, blue: 0.0)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        ZStack {
            teamColor
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Name + Team
                VStack(spacing: 4) {
                    Text("Max Verstappen")
                        .font(.custom("SFPro-ExpandedBold", size: 28))
                        .foregroundStyle(.white)

                    HStack(spacing: 8) {
                        Image("RedBull")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 20)
                            .cornerRadius(4)

                        Text("Red Bull Racing")
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }

                // Driver Image (Cropped)
                Image("VerstappenStand")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 280, height: 350, alignment: .top)
                    .clipped()
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .mask(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .black, location: 0),   // Start opaque (top of the image)
                                .init(color: .black, location: 0.8), // Remain opaque until 80% down
                                .init(color: .clear, location: 1.0)  // Fade to clear at the bottom
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                // Carousel of Floating Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        DriverCard(
                            title: "Profile",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8,
                            raceStarts: 13,
                            wins: 7,
                            podiums: 2,
                            points: 156,
                            rating: 8.7,
                            championships: 4
                        )
                        DriverCard(
                            title: "Races",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8,
                            raceStarts: 13,
                            wins: 7,
                            podiums: 2,
                            points: 156,
                            rating: 8.7,
                            championships: 1
                        )
                        DriverCard(
                            title: "Stats",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8,
                            raceStarts: 13,
                            wins: 7,
                            podiums: 2,
                            points: 156,
                            rating: 8.7,
                            championships: 1

                        )
                        DriverCard(
                            title: "Career",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8,
                            raceStarts: 13,
                            wins: 7,
                            podiums: 2,
                            points: 156,
                            rating: 8.7,
                            championships: 1
                        )
                    }
                    .padding(.horizontal)
                }
                .padding(.top, -80) // pull up slightly if needed
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
            .padding(.bottom)
        }
    }
}

struct DriverCard: View {
    let title: String
    let age: Int
    let birthDate: String
    let driverFlag: String
    let driverNumber: Int
    let height: Double
    let raceStarts: Int
    let wins: Int
    let podiums: Int
    let points: Int
    let rating: Double
    let championships: Int

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
                                            endPoint: .trailing)
                                        )
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
            Text(title.uppercased())
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
    DriverDetailView()
}
