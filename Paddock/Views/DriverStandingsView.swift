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
            LazyVStack {
                
                DriverStandingCard(position: 1, name: "Max Verstappen", team: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.cyan]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverNumber: 1, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
            }
        }
    }
}

struct DriverStandingCard: View {
    let position: Int
    let name: String
    let team: String
    let teamColor: LinearGradient
    let points: Int
    let driverNumber: Int
    let driverImage: Image
    let teamLogo: Image

    var body: some View {
        ZStack {
            // Background Card
            RoundedRectangle(cornerRadius: 20)
                .fill(teamColor)
                .frame(height: 230)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    VStack {
                        Text(name)
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        HStack {
                            teamLogo
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(team)
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing, 25)
                    }
                    
                    Text("\(position)st place")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.medium)

                    Text("\(points) pts")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                Spacer()

                ZStack(alignment: .bottomTrailing) {
                    driverImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 190, height: 230, alignment: .top)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .offset(x: 25)
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}


#Preview {
    DriverStandingsView()
}
