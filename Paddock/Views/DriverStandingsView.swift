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
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
                
                DriverStandingCard(position: 2, name: "Max Verstappen", team: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
                
                DriverStandingCard(position: 3, name: "Max Verstappen", team: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
                
                DriverStandingCard(position: 4, name: "Max Verstappen", team: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
                
                DriverStandingCard(position: 5, name: "Max Verstappen", team: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
                
                DriverStandingCard(position: 6, name: "Max Verstappen", team: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 165, driverImage: Image("VerstappenStand"), teamLogo: Image("RedBull"))
            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

struct DriverStandingCard: View {
    let position: Int
    let name: String
    let team: String
    let teamColor: LinearGradient
    let points: Int
    let driverImage: Image
    let teamLogo: Image

    var body: some View {
        ZStack {
            // Background Card
            RoundedRectangle(cornerRadius: 20)
                .fill(teamColor)
                .frame(height: 160)

            HStack {
                VStack(alignment: .leading) {
                    VStack {
                        Text(name)
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        HStack {
                            teamLogo
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(team)
                                .font(.title3)
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing, 50)
                    }
                    
                    Text("\(position)\(ordinalSuffix(for: position)) place")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.medium)

                    Text("\(points) pts")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                Spacer()

                ZStack(alignment: .bottomTrailing) {
                    driverImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 190, height: 160, alignment: .top)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .offset(x: 25)
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    private func ordinalSuffix(for number: Int) -> String {
        switch number {
        case 11...13: return "th"
        default:
            switch number % 10 {
            case 1: return "st"
            case 2: return "nd"
            case 3: return "rd"
            default: return "th"
            }
        }
    }

}

#Preview {
    DriverStandingsView()
}
