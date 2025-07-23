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
            LazyVStack(spacing: 15) {
                DriverStandingCard(position: 1, name: "Max Verstappen", team: "Red Bull", driverNumber: "1", teamColor: .blue, points: 165, wins: 5, podiums: 7, poles: 3, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
                
                MiniDriverStandingCard(position: 2, name: "Oscar Piastri", team: "Red Bull", driverNumber: "81", points: 165, teamColor: .orange, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"), driverCountry: Image("AustrailianFlag"))
            }
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
                
                Text("\(name) \(driverNumber)")
                    .font(.custom("SFPro-ExpandedBold", size: 24))
                    .foregroundStyle(.white)
                    .padding(.trailing, 100)
                
                driverCountry
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 40)
                    .cornerRadius(8)
                    .padding(.leading, 280)
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
            // Header
            ZStack(alignment: .leading) {
                teamColor
                    .frame(height: 80)
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
                .padding(.top, 25)
            }
            
            // Content
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 5) {
                    // Team name & logo
                    HStack(spacing: 8) {
                        Text(team)
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                        teamLogo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    
                    // Position & Points
                    HStack(spacing: 15) {
                        VStack {
                            Text("\(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 24))
                            Text("POS")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                        }
                        
                        VStack {
                            Text("\(points)")
                                .font(.custom("SFPro-ExpandedBold", size: 24))
                            Text("PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 10))
                        }
                    }
                }
                .padding(.bottom, 20)
                
                Spacer()
                
                // Driver image
                driverImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 120, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 1)
            }
            .padding(15)
            .background(Color(.systemBackground))
        }
        .frame(width: 400, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 1)
    }
}

#Preview {
    DriverStandingsView()
}
