//
//  PreviousView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct PreviousView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 400)
                        .overlay(
                            Image("AustrailianGP")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding(.top, 300)
                                .padding(.leading, 200)
                        )
                    
                    VStack(spacing: 12) {
                        PodiumCard(position: 1, imageName: "Verstappen", name: "Max Verstappen", team: "Red Bull", timeGap: "1:29:15.211")
                        PodiumCard(position: 2, imageName: "Verstappen", name: "Lando Norris", team: "McLaren", timeGap: "+5.221s")
                        PodiumCard(position: 3, imageName: "Verstappen", name: "Charles Leclerc", team: "Ferrari", timeGap: "+12.407s")
                    }
                    .padding(.horizontal, 50)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    HStack {
                        // Text content on the left
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Round 1")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Text("Austrailian GP")
                                .foregroundStyle(.white)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Melbourne")
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        .padding(.leading, 50)
                        .padding(.top, 280)

                        Spacer()

                        // Date box on the right
                        VStack(spacing: 4) {
                            Text("13-15")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.title2)
                        }
                        .foregroundColor(.red)
                        .frame(width: 80, height: 80)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.trailing, 30)
                        .padding(.bottom, 280)
                        
                        VStack(spacing: 4) {
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, style: StrokeStyle(lineWidth: 4)))
                        }
                        .padding(.leading, -400)
                        .padding(.top, -180)
                    }
                }            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

struct PodiumCard: View {
    let position: Int
    let imageName: String
    let name: String
    let team: String
    let timeGap: String

    var body: some View {
        HStack(spacing: 6) {
            // Position
            Text("\(position)")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(width: 24)
                .foregroundStyle(.red)

            // Driver Image
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 38, height: 38)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red.opacity(0.7), lineWidth: 1.5))

            // Name + Team
            VStack(alignment: .leading, spacing: 1) {
                Text(name)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
                Text(team)
                    .font(.caption2)
                    .foregroundStyle(.red.opacity(0.8))
            }

            Spacer()

            // Gap or Lap Time
            Text(timeGap)
                .font(.caption2)
                .foregroundStyle(.red)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .frame(width: 350)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(radius: 2)
        )
    }
}

#Preview {
    PreviousView()
}
