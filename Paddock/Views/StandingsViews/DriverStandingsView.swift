//
//  DriverStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct DriverStandingsView: View {
    var hasFloatingTabBar: Bool

    var body: some View {
        ScrollView {
            NavigationLink(destination: DriverDetailView()) {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 70) {
                        DriverStandingsCard(driverImage: "Piastri", driverFlag: "AustrailianFlag", driverName: "Oscar Piastri", driverNumber: 81, position: 1, points: 284, teamLogo: "McLaren", teamColor: .orange)
                        DriverStandingsCard(driverImage: "Norris", driverFlag: "UKFlag", driverName: "Lando Norris", driverNumber: 4, position: 2, points: 275, teamLogo: "McLaren", teamColor: .orange)
                        DriverStandingsCard(driverImage: "VerstappenStand", driverFlag: "NetherlandsFlag", driverName: "Max Verstappen", driverNumber: 1, position: 3, points: 187, teamLogo: "RedBull", teamColor: .blue)
                        DriverStandingsCard(driverImage: "Russel", driverFlag: "UKFlag", driverName: "George Russell", driverNumber: 63, position: 4, points: 172, teamLogo: "Mercedes", teamColor: .teal)
                    }
                }
            }
            .buttonStyle(.plain) // 👈 add this line
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 140 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            Color.clear.frame(height: 10)
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
    
    var firstName: String {
        return driverName.components(separatedBy: " ").first ?? ""
    }

    var lastName: String {
        return driverName.components(separatedBy: " ").last ?? ""
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Image
            Rectangle()
                .fill(teamColor)
                .frame(maxWidth: .infinity, maxHeight: 170)
                .cornerRadius(20)
            
            // Dark overlay for readability
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame(maxWidth: .infinity, maxHeight: 170)
                .cornerRadius(20)
            
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
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay( // This adds the thin border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(teamColor.opacity(1.0), lineWidth: 1.5)
            )
            .offset(y: 150) // Adjust position to appear at the bottom of the card
            
        }
        .frame(height: 200) // Total height of the card
        .padding(.horizontal)
    }
}

#Preview {
    DriverStandingsView(hasFloatingTabBar: true)
}
