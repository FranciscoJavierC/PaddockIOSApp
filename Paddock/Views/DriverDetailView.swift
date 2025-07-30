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

            ScrollView {
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
                                driverNumber: 1
                            )
                            DriverCard(
                                title: "Races",
                                age: 26,
                                // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                                birthDate: "Feb 7, 2004",
                                driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                                driverNumber: 1
                            )
                            DriverCard(
                                title: "Stats",
                                age: 26,
                                // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                                birthDate: "Feb 7, 2004",
                                driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                                driverNumber: 1
                            )
                            DriverCard(
                                title: "Career",
                                age: 26,
                                // Example Date for Max Verstappen's birth date (Sept 30, 1997)
                                birthDate: "Feb 7, 2004",
                                driverFlag: "AustrailianFlag", // Ensure "NetherlandsFlag" is in your Assets.xcassets
                                driverNumber: 1
                            )
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 220) // Adjusted for bigger card height
                    .padding(.vertical, -80)
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                .padding(.bottom, 40)
            }
        }
    }
}

struct DriverCard: View {
    let title: String
    let age: Int
    let birthDate: String
    let driverFlag: String
    let driverNumber: Int

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 20) {
                        VStack {
                            HStack {
                                Image(driverFlag)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 30)
                                    .cornerRadius(4)
                                
                                Text("AUS")
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                            }
                            
                            Text("Country")
                                .font(.custom("SFPro-ExpandedRegular", size: 15))
                        }
                        
                        VStack {
                            Text("\(driverNumber)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("Number")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                        }
                        
                        VStack {
                            Text("\(age)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            
                            Text("\(birthDate)")
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                        }
                    }
                }
                .padding(.top)
            }
            .frame(width: 400, height: 180)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)

            Text(title.uppercased())
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(.red)
                .clipShape(Capsule())
                .offset(y: -12)
        }
        .padding(.top, 12)
    }
}

#Preview {
    DriverDetailView()
}
