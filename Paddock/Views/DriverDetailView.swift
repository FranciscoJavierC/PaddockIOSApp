//
//  DriverDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/18/25.
//

import SwiftUI

struct DriverDetailView: View {
    @State private var selectedCardIndex = 0
    
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
                TabView(selection: $selectedCardIndex) {
                    ForEach(0..<4, id: \.self) { index in
                        ProfileCardView(
                            age: 26,
                            birthDate: "Feb 7, 2004",
                            driverFlag: "AustrailianFlag",
                            driverNumber: 1,
                            height: 5.8,
                            raceStarts: 13,
                            wins: 7,
                            podiums: 2,
                            points: 156,
                            rating: 8.7,
                            championships: 4
                        )
                        .tag(0)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.horizontal)
                .padding(.top, -140)
                
                HStack(spacing: 8) {
                    ForEach(0..<4, id: \.self) { index in
                        Circle()
                            .fill(index == selectedCardIndex ? Color.white : Color.white.opacity(0.4))
                            .animation(.easeInOut, value: selectedCardIndex)
                            .frame(width: 8, height: 8)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
            .padding(.bottom)
        }
    }
}

#Preview {
    DriverDetailView()
}
