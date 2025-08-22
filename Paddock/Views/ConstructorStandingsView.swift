//
//  ConstructorStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct ConstructorStandingsView: View {
    var hasFloatingTabBar: Bool

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 110 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
                   Color.clear.frame(height: 10)
               }
    }
}

struct ConstructorStandingsCard: View {
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
            Image(driverFlag)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            // Dark overlay for readability
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame(maxWidth: .infinity, maxHeight: 170)
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
                    
                    Image(teamLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 30)
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
    ConstructorStandingsView(hasFloatingTabBar: true)
}
