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
                    VStack(alignment: .leading, spacing: 100) {
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
        ZStack(alignment: .top) {
            // Background Image
            Rectangle()
                .fill(constructorColor)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .cornerRadius(20)

            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            
            Image(constructorLogo)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            // Bottom Info Box
            if #available(iOS 26.0, *) {
                VStack(alignment: .center, spacing: 5) {
                    // Top section: Name & Team Logo
                    HStack(alignment: .center, spacing: 8) {
                        Text(constructorName.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    
                    // Thin dashed line
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .foregroundColor(.white.opacity(0.4))
                        .frame(height: 1)
                    
                    // Bottom section: Position & Points
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 5) {
                            // Driver 1
                            VStack(alignment: .leading) {
                                Text(driver1Name)
                                    .font(.custom("SFPro-ExpandedRegular", size: 14))
                                    .foregroundColor(.white)
                                Text("\(driver1Points) pts")
                                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                                    .foregroundColor(.gray)
                            }
                            
                            // Driver 2
                            VStack(alignment: .leading) {
                                Text(driver2Name)
                                    .font(.custom("SFPro-ExpandedRegular", size: 14))
                                    .foregroundColor(.white)
                                Text("\(driver2Points) pts")
                                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        // Total Position & Points
                        VStack(alignment: .trailing, spacing: 20) {
                            Text("Pos. \(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 16))
                                .foregroundColor(.white)
                            
                            Text("\(points) pts")
                                .font(.custom("SFPro-ExpandedBold", size: 16))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 125) // Fixed height for info box
                .glassEffect(in: .rect(cornerRadius: 20))
                //.background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay( // This adds the thin border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(constructorColor.opacity(1.0), lineWidth: 1.5)
                )
                .offset(y: 150)
            } else {
                // Fallback on earlier versions
                VStack(alignment: .center, spacing: 5) {
                    // Top section: Name & Team Logo
                    HStack(alignment: .center, spacing: 8) {
                        Text(constructorName.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    
                    // Thin dashed line
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .foregroundColor(.white.opacity(0.4))
                        .frame(height: 1)
                    
                    // Bottom section: Position & Points
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 5) {
                            // Driver 1
                            VStack(alignment: .leading) {
                                Text(driver1Name)
                                    .font(.custom("SFPro-ExpandedRegular", size: 14))
                                    .foregroundColor(.white)
                                Text("\(driver1Points) pts")
                                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                                    .foregroundColor(.gray)
                            }
                            
                            // Driver 2
                            VStack(alignment: .leading) {
                                Text(driver2Name)
                                    .font(.custom("SFPro-ExpandedRegular", size: 14))
                                    .foregroundColor(.white)
                                Text("\(driver2Points) pts")
                                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        // Total Position & Points
                        VStack(alignment: .trailing, spacing: 20) {
                            Text("Pos. \(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 16))
                                .foregroundColor(.white)
                            
                            Text("\(points) pts")
                                .font(.custom("SFPro-ExpandedBold", size: 16))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 125) // Fixed height for info box
                //.glassEffect(in: .rect(cornerRadius: 20))
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay( // This adds the thin border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(constructorColor.opacity(1.0), lineWidth: 1.5)
                )
                .offset(y: 150)
            } // Adjust position to appear at the bottom of the card
            
        }
        .frame(height: 200) // Total height of the card
        .padding(.horizontal)
    }
}

#Preview {
    ConstructorStandingsView()
}
