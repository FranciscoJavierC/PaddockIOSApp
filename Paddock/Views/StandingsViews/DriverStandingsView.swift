//
//  DriverStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct DriverStandingsView: View {
    @StateObject private var viewModel = DriverStandingsModel()
    @State private var selectedDriver: DriverStandings? = nil
    @State private var showDetail = false

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.drivers, id: \.id) { driver in
                    DriverStandingsCard(
                        driverImage: "\(driver.FullName)",
                        driverFlag: "\(driver.CountryName)Flag",
                        driverName: driver.FullName,
                        driverNumber: driver.DriverNumber,
                        position: driver.Position,
                        points: driver.Points,
                        teamLogo: driver.ConstructorNames.first ?? "Default",
                        teamColor: driver.TeamColor
                    )
                    .onTapGesture {
                        selectedDriver = driver
                        showDetail = true
                    }
                }
            }
            .padding(.vertical, 20)
        }
        .navigationDestination(isPresented: $showDetail) {
            if let driver = selectedDriver {
                DriverDetailView(driver: driver)
            }
        }
    }
}

struct DriverStandingsCard: View {
    let driverImage: String
    let driverFlag: String
    let driverName: String
    let driverNumber: Int
    let position: Int
    let points: Int
    let teamLogo: String
    let teamColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Top Section (Team Background + Driver)
            ZStack(alignment: .topTrailing) {
                // Team color + gradient
                Rectangle()
                    .fill(teamColor)
                    .frame(height: 190)
                    .cornerRadius(20)
                    .padding(15)
                    .overlay {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .black.opacity(0.6),
                                .black.opacity(0)
                            ]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        .cornerRadius(20)
                        .padding(15)
                    }
                    .shadow(radius: 3, y: 2)
                
                // Driver number badge (like race round badge)
                if #available(iOS 26.0, *) {
                    Text("#\(driverNumber)")
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .glassEffect()
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                } else {
                    Text("#\(driverNumber)")
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Capsule().fill(teamColor.opacity(0.9)))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.8), lineWidth: 1)
                        )
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                }
                
                // Driver image overlay
                Image(driverImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 205, alignment: .top)
                    .cornerRadius(20)
                    .padding(.horizontal, 25)
                    .clipped()
            }
            
            // MARK: - Info Section (Driver stats)
            VStack(alignment: .leading, spacing: 10) {
                // Driver Name + Country
                HStack(alignment: .center, spacing: 8) {
                    Text(driverName.split(separator: " ").first ?? "")
                            .font(.custom("SFPro-ExpandedBold", size: 20))
                            .foregroundColor(.white)
                        
                    Text(driverName.split(separator: " ").dropFirst().joined(separator: " "))
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        .foregroundStyle(teamColor)
                    
                    Image(driverFlag)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 20)
                        .cornerRadius(5)
                    
                    Spacer()
                }
                
                // Team name or logo
                HStack(spacing: 6) {
                    Image(teamLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                    Text("\(teamLogo.replacingOccurrences(of: "_", with: " ").capitalized)")
                        .font(.custom("SFPro-ExpandedRegular", size: 15))
                        .foregroundColor(.white.opacity(0.95))
                }
                
                // Points
                HStack {
                    // Position
                    VStack(spacing: 2) {
                        Text("\(position)")
                            .font(.custom("SFPro-ExpandedBold", size: 34))
                            .foregroundColor(.white)
                        
                        Text("POS")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    // Points
                    VStack(spacing: 2) {
                        Text("\(points)")
                            .font(.custom("SFPro-ExpandedBold", size: 34))
                            .foregroundColor(teamColor)
                        
                        Text("PTS")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 10)
                .padding(.top, 5)
            }
            .padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(teamColor, lineWidth: 0.4)

        )
        .padding(.horizontal)
    }
}

extension Color {
    init(hex: UInt, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
#Preview {
    DriverStandingsView()
}
