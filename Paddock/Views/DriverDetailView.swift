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
                            height: 5.8
                        )
                        DriverCard(
                            title: "Races",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8

                        )
                        DriverCard(
                            title: "Stats",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8

                        )
                        DriverCard(
                            title: "Career",
                            age: 26,
                            // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                            driverNumber: 1,
                            height: 5.8
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

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 16) {
                // Profile Details
                VStack(spacing: 20) {
                    HStack(spacing: 100) {
                        VStack(spacing: 6) {
                            Text("Nationality")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)

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
                        }

                        VStack(spacing: 6) {
                            Text("\(birthDate)")
                                .font(.custom("SFPro-ExpandedRegular", size: 16))
                                .foregroundColor(.secondary)

                            Text("Age: \(age)")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                        }
                    }

                    HStack(spacing: 150) {
                        VStack(spacing: 6) {
                            Text("Number")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)

                            Text("\(driverNumber)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                        }

                        VStack(spacing: 6) {
                            Text("Height")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)

                            Text(String(format: "%.1f ft", height))
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                        }
                    }
                }
                .padding(.bottom, 300)
            }
            .frame(width: 400, height: 470)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)

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
