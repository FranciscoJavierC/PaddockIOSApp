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
            LazyVStack(spacing: 15) {
                DriverStandingCard(position: 1, name: "Max Verstappen", team: "Red Bull", driverNumber: "1", teamColor: .blue, points: 165, wins: 5, podiums: 7, poles: 3, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 60 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            Color.clear.frame(height: 5)
        }
    }
}

struct DriverStandingCard: View {
    let position: Int
    let name: String
    let team: String
    let driverNumber: String
    let teamColor: Color
    let points: Int
    let wins: Int
    let podiums: Int
    let poles: Int
    let driverImage: Image
    let teamLogo: Image
    let driverCountry: Image

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                teamColor
                    .frame(height: 80)
                    .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))
                
                HStack {
                    Text("\(name) #\(driverNumber)")
                        .font(.custom("SFPro-ExpandedBold", size: 22))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    driverCountry
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 40)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 12)
            }
            
            HStack(spacing: 6) {
                VStack (spacing: 20){
                    HStack {
                        Text(team)
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                        teamLogo
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 40)
                    }
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("\(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 30))
                            Text("POS")
                                .font(.custom("SFPro-ExpandedRegular", size: 15))
                        }
                        
                        VStack {
                            Text("\(points)")
                                .font(.custom("SFPro-ExpandedBold", size: 30))
                            Text("PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 15))
                        }
                    }
                    
                    HStack(spacing: 6) {
                        VStack {
                            Text("\(wins)")
                                .font(.custom("SFPro-ExpandedRegular", size: 17))
                            Text("Wins")
                                .font(.custom("SFPro-ExpandedRegular", size: 17))

                        }
                        
                        VStack {
                            Text("\(podiums)")
                                .font(.custom("SFPro-ExpandedRegular", size: 17))
                            Text("Podiums")
                                .font(.custom("SFPro-ExpandedRegular", size: 17))
                        }
                        
                        VStack {
                            Text("\(poles)")
                                .font(.custom("SFPro-ExpandedRegular", size: 17))
                            Text("Poles")
                                .font(.custom("SFPro-ExpandedRegular", size: 17))
                        }
                    }
                    .padding(.leading, 8)
                }
                
                driverImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 210, alignment: .top)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .offset(x: 15)
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemBackground))
        }
        .frame(width: 400)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 1)
    }
}

struct MiniDriverStandingCard: View {
    let position: Int
    let name: String
    let team: String
    let driverNumber: String
    let points: Int
    let teamColor: Color
    let driverImage: Image
    let teamLogo: Image
    let driverCountry: Image

    var body: some View {
        VStack(spacing: 0) {
            // HEADER
            ZStack {
                teamColor
                    .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))
                
                HStack {
                    Text("\(name) #\(driverNumber)")
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        .foregroundStyle(.white)

                    Spacer()

                    driverCountry
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 30)
                        .cornerRadius(4)
                }
                .padding(.horizontal, 12)
            }
            .frame(height: 60) // Fixed header height
            
            // CONTENT
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 10) {
                    // Team + logo
                    HStack(spacing: 8) {
                        Text(team)
                            .font(.custom("SFPro-ExpandedRegular", size: 18))
                        teamLogo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }

                    // Position + Points
                    HStack(spacing: 20) {
                        VStack {
                            Text("\(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 22))
                            Text("POS")
                                .font(.custom("SFPro-ExpandedRegular", size: 10))
                        }

                        VStack {
                            Text("\(points)")
                                .font(.custom("SFPro-ExpandedBold", size: 22))
                            Text("PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 10))
                        }
                    }
                }
                .padding(.bottom)

                Spacer()

                driverImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 100, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 1)
            }
            .padding(.top, 10)
            .padding(.horizontal, 15)
            .background(Color(.systemBackground))
        }
        .frame(width: 400, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 1)
    }
}

#Preview {
    DriverStandingsView(hasFloatingTabBar: true)
}
