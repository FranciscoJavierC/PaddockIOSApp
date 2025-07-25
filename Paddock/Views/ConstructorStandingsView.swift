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
                ConstructorStandingCard(position: 1, constructor: "Red Bull", chassis: "RB21", teamColor: .blue, points: 330, wins: 10, podiums: 5, poles: 6, drivers: ["VERSTAPPEN", "TSUNODA"], driverFlags: [Image("AustrailianFlag"), Image("AustrailianFlag")], teamLogo: Image("RedBull"), constructorFlag: Image("AustrailianFlag"))

                MiniConstructorStandingCard(position: 1, constructor: "Red Bull", chassis: "RB21", teamColor: .blue, points: 330, drivers: ["VERSTAPPEN", "TSUNODA"], driverFlags: [Image("AustrailianFlag"), Image("AustrailianFlag")], teamLogo: Image("RedBull"), constructorFlag: Image("AustrailianFlag"))
                
                MiniConstructorStandingCard(position: 1, constructor: "Red Bull", chassis: "RB21", teamColor: .blue, points: 330, drivers: ["VERSTAPPEN", "TSUNODA"], driverFlags: [Image("AustrailianFlag"), Image("AustrailianFlag")], teamLogo: Image("RedBull"), constructorFlag: Image("AustrailianFlag"))
                
                MiniConstructorStandingCard(position: 1, constructor: "Red Bull", chassis: "RB21", teamColor: .blue, points: 330, drivers: ["VERSTAPPEN", "TSUNODA"], driverFlags: [Image("AustrailianFlag"), Image("AustrailianFlag")], teamLogo: Image("RedBull"), constructorFlag: Image("AustrailianFlag"))
                
                MiniConstructorStandingCard(position: 1, constructor: "Red Bull", chassis: "RB21", teamColor: .blue, points: 330, drivers: ["VERSTAPPEN", "TSUNODA"], driverFlags: [Image("AustrailianFlag"), Image("AustrailianFlag")], teamLogo: Image("RedBull"), constructorFlag: Image("AustrailianFlag"))
                
                MiniConstructorStandingCard(position: 1, constructor: "Red Bull", chassis: "RB21", teamColor: .blue, points: 330, drivers: ["VERSTAPPEN", "TSUNODA"], driverFlags: [Image("AustrailianFlag"), Image("AustrailianFlag")], teamLogo: Image("RedBull"), constructorFlag: Image("AustrailianFlag"))
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

struct ConstructorStandingCard: View {
    let position: Int
    let constructor: String
    let chassis: String
    let teamColor: Color
    let points: Int
    let wins: Int
    let podiums: Int
    let poles: Int
    let drivers: [String]
    let driverFlags: [Image]
    let teamLogo: Image
    let constructorFlag: Image

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                teamColor
                    .frame(height: 80)
                    .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))
                
                HStack {
                    Text("\(constructor) - \(chassis)")
                        .font(.custom("SFPro-ExpandedBold", size: 22))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    constructorFlag
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 40)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 12)
            }
            
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(0..<drivers.count, id: \.self) { index in
                            HStack(spacing: 6) {
                                Text(drivers[index])
                                    .font(.custom("SFPro-ExpandedRegular", size: 16))
                                driverFlags[index]
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 18)
                                    .cornerRadius(3)
                            }
                        }
                    }
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("\(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 26))
                            Text("POS")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                        }
                        
                        VStack {
                            Text("\(points)")
                                .font(.custom("SFPro-ExpandedBold", size: 26))
                            Text("PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                        }
                    }
                    
                    HStack(spacing: 12) {
                        VStack {
                            Text("\(wins)")
                                .font(.custom("SFPro-ExpandedRegular", size: 18))
                            Text("Wins")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))

                        }
                        
                        VStack {
                            Text("\(podiums)")
                                .font(.custom("SFPro-ExpandedRegular", size: 18))
                            Text("Podiums")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                        }
                        
                        VStack {
                            Text("\(poles)")
                                .font(.custom("SFPro-ExpandedRegular", size: 18))
                            Text("Poles")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                        }
                    }
                    .padding(.leading, 8)
                }
                
                Spacer()
                
                teamLogo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
            }
            .padding(15)
            .background(Color(.systemBackground))
        }
        .frame(width: 400)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 1)
    }
}

struct MiniConstructorStandingCard: View {
    let position: Int
    let constructor: String
    let chassis: String
    let teamColor: Color
    let points: Int
    let drivers: [String]
    let driverFlags: [Image]
    let teamLogo: Image
    let constructorFlag: Image

    var body: some View {
        VStack(spacing: 0) {
            
            // HEADER (fixed height)
            ZStack {
                teamColor
                    .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))
                
                HStack {
                    Text("\(constructor) - \(chassis)")
                        .font(.custom("SFPro-ExpandedBold", size: 18))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    constructorFlag
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .cornerRadius(6)
                }
                .padding(.horizontal, 12)
                .padding(.top, 10)
            }
            .frame(height: 60) // ✅ This locks the header size
            
            // CONTENT (independent padding)
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(0..<drivers.count, id: \.self) { index in
                            HStack(spacing: 6) {
                                Text(drivers[index])
                                    .font(.custom("SFPro-ExpandedRegular", size: 14))
                                driverFlags[index]
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 14)
                                    .cornerRadius(3)
                            }
                        }
                    }
                    
                    HStack(spacing: 25) {
                        VStack {
                            Text("\(position)")
                                .font(.custom("SFPro-ExpandedBold", size: 20))
                            Text("POS")
                                .font(.custom("SFPro-ExpandedRegular", size: 10))
                        }
                        
                        VStack {
                            Text("\(points)")
                                .font(.custom("SFPro-ExpandedBold", size: 20))
                            Text("PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 10))
                        }
                    }
                }
                
                Spacer()
                
                teamLogo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 5)
            }
            .padding([.top, .horizontal], 12)
            .padding(.bottom, 20) // ✅ Only this affects the bottom padding
            .background(Color(.systemBackground))
            
        }
        .frame(width: 400, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 1)
    }
}

#Preview {
    ConstructorStandingsView(hasFloatingTabBar: true)
}
