//
//  DriverStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct DriverStandingsView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red.opacity(0.95)) // Keep red, but easier on the eyes
                        .frame(width: 400, height: 300)

                    // Red Bull logo in white circle for visibility
                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 4)

                                Image("RedBull")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 70)
                            }
                            .padding(.top, 20)
                            .padding(.trailing, 30)
                        }
                        Spacer()
                    }

                    // Driver + Stats
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("1")
                                .foregroundStyle(.red)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.bottom, 120)

                            Text("Verstappen")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Red Bull")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .fontWeight(.bold)
                            Text("280 pts")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        .padding(.leading, 30)

                        Spacer()

                        Image("VerstappenStand")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 270, alignment: .top)
                            .clipped()
                            .padding(.trailing, 100)
                            .padding(.top, 30)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red.opacity(0.95)) // Keep red, but easier on the eyes
                        .frame(width: 400, height: 100)

                    // Red Bull logo in white circle for visibility
                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 4)

                                Image("RedBull")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 70)
                            }
                            .padding(.top, 15)
                            .padding(.trailing, 30)
                        }
                        Spacer()
                    }

                    // Driver + Stats
                    HStack {
                        HStack(spacing: 4) {
                            Text("1")
                                .foregroundStyle(.red)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(10)

                            VStack {
                                Text("Verstappen")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text("Red Bull")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text("280 pts")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.leading, 30)

                        Spacer()

                        Image("VerstappenStand")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 105, alignment: .top)
                            .clipped()
                            .padding(.trailing, 80)
                            .padding(.top, -5)
                    }
                }
            }
        }
    }
}

#Preview {
    DriverStandingsView()
}
