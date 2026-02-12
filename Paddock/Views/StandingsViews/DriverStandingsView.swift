//
//  DriverStandings.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/12/25.
//

import SwiftUI

struct DriverStandingsView: View {
    @StateObject private var viewModel = DriverStandingsModel()
    @State private var selectedDriver: DriverStandings? = nil
    @State private var showDetail = false

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) { // Match constructor spacing for consistency
                ForEach(viewModel.drivers, id: \.id) { driver in
                    DriverStandingsRow(
                        driverName: driver.FullName,
                        driverNumber: driver.DriverNumber,
                        position: driver.Position,
                        points: Int(driver.Points),
                        teamColor: Color(hex: driver.TeamColorHex)
                    )
                    .onTapGesture {
                        selectedDriver = driver
                        showDetail = true
                    }
                }
            }
            .padding(.top, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Clean black background
        .navigationDestination(isPresented: $showDetail) {
            if let driver = selectedDriver {
                DriverDetailView(driver: driver)
            }
        }
    }
}

struct DriverStandingsRow: View {
    let driverName: String
    let driverNumber: Int
    let position: Int
    let points: Int
    let teamColor: Color
    
    var body: some View {
        HStack(spacing: 0) {
            // 1. Position Block
            Text("\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(.white)
                .frame(width: 45) // Safety for ranks 10-22
                .padding(.leading, 8)
            
            // 2. Driver Number Badge
            Image(driverName)
                .resizable()
                    .scaledToFill() // Fills the frame while maintaining aspect ratio
                    .frame(width: 60, height: 60, alignment: .top) // Anchors head at top, crops legs
                    .clipped() // Strictly removes the overflow
                    .cornerRadius(6) // Keeps it consistent with your timing tower corners
                    .padding(.leading, 4)
            
            // 3. Driver Name
            VStack(alignment: .leading, spacing: -2) {
                // 1. First & Middle Names (Small/Dimmed)
                // Joins all names except the last one
                Text(driverName.split(separator: " ").dropLast().joined(separator: " "))
                    .font(.custom("SFPro-ExpandedMedium", size: 10))
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(1) // Prevents vertical expansion
                
                // 2. Last Name (Large/Bold)
                Text(driverName.split(separator: " ").last?.uppercased() ?? "")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // 4. Points
            Text("\(points)")
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(.white)
                .padding(.trailing, 16)
        }
        .frame(height: 60) // Slightly shorter than constructor rows for high-density scan
        .background(
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    // 🏎️ Solid 30% Team Color Block
                    UnevenRoundedRectangle(topLeadingRadius: 12, bottomLeadingRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [teamColor, teamColor.opacity(0.7), .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * 0.8)
                }
            }
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    DriverStandingsView()
}
