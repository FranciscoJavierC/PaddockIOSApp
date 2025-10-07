//
//  DriverStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct DriverStandingsView: View {
    @StateObject private var viewModel = DriverStandingsModel()

    var body: some View {
        ScrollView {
            NavigationLink(destination: DriverDetailView()) {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 70) {
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
                        }
                    }
                    Spacer().frame(height: 40)
                }
            }
            .buttonStyle(.plain) // 👈 add this line
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
        ZStack(alignment: .top) {
            // Background Image
            Rectangle()
                .fill(teamColor)
                .frame(maxWidth: .infinity, maxHeight: 170)
                .cornerRadius(20)
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .frame(maxWidth: .infinity)
                .frame(height: 170)
            
            Image(teamLogo)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
           // Driver Image
           Image(driverImage)
               .resizable()
               .scaledToFill() // Changed to scaledToFill
               .frame(width: 200, height: 200, alignment: .top) // Reduced height and aligned to top
               .clipped() // Ensure it's clipped
               //.offset(y: 50)
            
            VStack(alignment: .trailing, spacing: -5) {
                Text("\(driverNumber)")
                    .font(.custom("SFPro-ExpandedBold", size: 75))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
            .offset(x: 130, y: 45)
            
            // Bottom Info Box
            if #available(iOS 26.0, *) {
                VStack(alignment: .center, spacing: 5) {
                    // Top section: Name & Team Logo
                    HStack(alignment: .center, spacing: 8) {
                        Text(driverName.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        
                        Image(driverFlag)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                    }
                    .padding(.top, 10)
                    
                    // Thin dashed line
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .foregroundColor(.white.opacity(0.4))
                        .frame(height: 1)
                    
                    // Bottom section: Position & Points
                    HStack {
                        Text("Pos. \(position)")
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("\(points) pts")
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 95) // Fixed height for info box
                .glassEffect(in: .rect(cornerRadius: 20))
                //.background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay( // This adds the thin border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(teamColor.opacity(1.0), lineWidth: 1.5)
                )
                .offset(y: 150)
            } else {
                // Fallback on earlier versions
                VStack(alignment: .center, spacing: 5) {
                    // Top section: Name & Team Logo
                    HStack(alignment: .center, spacing: 8) {
                        Text(driverName.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        
                        Image(driverFlag)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                    }
                    .padding(.top, 10)
                    
                    // Thin dashed line
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .foregroundColor(.white.opacity(0.4))
                        .frame(height: 1)
                    
                    // Bottom section: Position & Points
                    HStack {
                        Text("Pos. \(position)")
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("\(points) pts")
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 95) // Fixed height for info box
                //.glassEffect(in: .rect(cornerRadius: 16.0))
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay( // This adds the thin border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(teamColor.opacity(1.0), lineWidth: 1.5)
                )
                .offset(y: 150)
            } // Adjust position to appear at the bottom of the card
            
        }
        .frame(height: 200) // Total height of the card
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
