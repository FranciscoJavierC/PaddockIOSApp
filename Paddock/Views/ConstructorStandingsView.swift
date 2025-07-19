//
//  ConstructorStandings.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

struct ConstructorStandingsView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ConstructorStandingCard(position: 1, constructor: "Red Bull", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 330, teamLogo: Image("RedBull"))

                ConstructorStandingCard(position: 2, constructor: "Ferrari", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.red, Color.black]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 275, teamLogo: Image("RedBull"))

                ConstructorStandingCard(position: 3, constructor: "McLaren", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.black]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 250, teamLogo: Image("RedBull"))
                
                ConstructorStandingCard(position: 3, constructor: "McLaren", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.black]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 250, teamLogo: Image("RedBull"))
                
                ConstructorStandingCard(position: 3, constructor: "McLaren", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.black]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 250, teamLogo: Image("RedBull"))
                
                ConstructorStandingCard(position: 3, constructor: "McLaren", teamColor: LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.black]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing), points: 250, teamLogo: Image("RedBull"))
            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

struct ConstructorStandingCard: View {
    let position: Int
    let constructor: String
    let teamColor: LinearGradient
    let points: Int
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
                        Text(constructor)
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
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
                    teamLogo
                        .resizable()
                        .scaledToFill()
                        .frame(width: 190, height: 160, alignment: .top)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .offset(x: 10)
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
    ConstructorStandingsView()
}
