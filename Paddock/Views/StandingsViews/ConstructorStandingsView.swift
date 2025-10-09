//
//  ConstructorStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct ConstructorStandingsView: View {
    @StateObject private var viewModel = ConstructorStandingsModel()
    
    var body: some View {
        ScrollView {
            NavigationLink(destination: ConstructorDetailView()) {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(viewModel.constructors) { constructor in
                            ConstructorStandingsCard(
                                constructorName: constructor.ConstructorName,
                                position: constructor.Position,
                                points: constructor.Points,
                                constructorLogo: "\(constructor.ConstructorName)",
                                constructorColor: constructor.TeamColor,
                                driver1Name: constructor.Drivers[0],
                                driver1Points: constructor.DriverPoints[0],
                                driver2Name: constructor.Drivers[1],
                                driver2Points: constructor.DriverPoints[1]
                                )
                        }
                    }
                    Spacer().frame(height: 80)
                }
            }
            .buttonStyle(.plain) // 👈 add this line
        }
    }
}

struct ConstructorStandingsCard: View {
    let constructorName: String
    let position: Int
    let points: Int
    let constructorLogo: String
    let constructorColor: Color
    let driver1Name: String
    let driver1Points: Int
    let driver2Name: String
    let driver2Points: Int
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                // Background Image
                Rectangle()
                    .fill(constructorColor)
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
                
                Image(constructorLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 180)
                    .padding(.horizontal, 100)
                    .padding(.top, 20)
            }
                
            // MARK: - Info Section (Constructor Stats)
            VStack(alignment: .leading, spacing: 10) {
                // Constructor Name
                HStack {
                    Text(constructorName)
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                // Drivers + Individual Points
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(driver1Name)
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Spacer()
                        
                        Text("\(driver1Points) pts")
                            .font(.custom("SFPro-ExpandedBold", size: 14))
                            .foregroundStyle(constructorColor)
                    }
                    
                    HStack {
                        Text(driver2Name)
                            .font(.custom("SFPro-ExpandedRegular", size: 15))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Spacer()
                        
                        Text("\(driver2Points) pts")
                            .font(.custom("SFPro-ExpandedBold", size: 14))
                            .foregroundStyle(constructorColor)
                    }
                }
                .padding(.top, 2)
                
                // Team Position + Total Points (mirroring Driver Standings layout)
                HStack(alignment: .firstTextBaseline) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(position)")
                            .font(.custom("SFPro-ExpandedBold", size: 30))
                            .foregroundColor(.white)
                        
                        Text("POS")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("\(points)")
                            .font(.custom("SFPro-ExpandedBold", size: 30))
                            .foregroundStyle(constructorColor)
                        
                        Text("PTS")
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.top, 6)
            }
            .padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(constructorColor, lineWidth: 0.4)

        )
        .padding(.horizontal)
    }
}

#Preview {
    ConstructorStandingsView()
}
