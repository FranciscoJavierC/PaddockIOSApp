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
                        PodiumCard(number: 1, wordText: "ST", imageName: "Verstappen", name: "Max Verstappen", team: "Red Bull", timeGap: "1:29:15.211")
                        PodiumCard(number: 2,  wordText: "ND", imageName: "Verstappen", name: "Lando Norris", team: "McLaren", timeGap: "+5.221s")
                        PodiumCard(number: 3,  wordText: "RD", imageName: "Verstappen", name: "Charles Leclerc", team: "Ferrari", timeGap: "+12.407s")
                    }
                    .padding(.horizontal, 50)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    HStack {
                        // Text content on the left
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Round 1")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Text("Australian GP")
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
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 140)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            // Flag
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .padding(.leading, 30)
                            
                            // Info
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Round 1")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                Text("Australian GP")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text("Melbourne")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            // Date box
                            VStack(spacing: 1) {
                                Text("13-15")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                Text("MAR")
                                    .font(.caption2)
                            }
                            .foregroundColor(.red)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(6)
                        }
                        .padding(.horizontal, 16)
                        .padding(.trailing, 30)
                        
                        HStack(spacing: 16) {
                            PodiumMini(position: "1", imageName: "Verstappen", code: "VER", time: "1:29:15.211")
                            PodiumMini(position: "2", imageName: "Verstappen", code: "NOR", time: "+5.221")
                            PodiumMini(position: "3", imageName: "Verstappen", code: "LEC", time: "+12.407")
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .frame(width: 370)
                        )
                        .frame(width: 380)
                    }
                    Image("AustrailianGP")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .cornerRadius(8)
                            .offset(x: 50, y: -30)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 140)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            // Flag
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .padding(.leading, 30)
                            
                            // Info
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Round 1")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                Text("Australian GP")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text("Melbourne")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            // Date box
                            VStack(spacing: 1) {
                                Text("13-15")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                Text("MAR")
                                    .font(.caption2)
                            }
                            .foregroundColor(.red)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(6)
                        }
                        .padding(.horizontal, 16)
                        .padding(.trailing, 30)
                        
                        HStack(spacing: 16) {
                            PodiumMini(position: "1", imageName: "Verstappen", code: "VER", time: "1:29:15.211")
                            PodiumMini(position: "2", imageName: "Verstappen", code: "NOR", time: "+5.221")
                            PodiumMini(position: "3", imageName: "Verstappen", code: "LEC", time: "+12.407")
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .frame(width: 370)
                        )
                        .frame(width: 380)
                    }
                    Image("AustrailianGP")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .cornerRadius(8)
                            .offset(x: 50, y: -30)
                }            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

struct PodiumCard: View {
    let number: Int
    let wordText: String
    let imageName: String
    let name: String
    let team: String
    let timeGap: String

    var body: some View {
        HStack(spacing: 6) {
            VStack {
                // Position
                Text("\(number)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 24)
                    .foregroundStyle(.red)
                
                // Rest of the 1st
                Text("\(wordText)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 24)
                    .foregroundStyle(.red)
            }

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
                .font(.headline)
                .foregroundStyle(.red)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .frame(width: 300)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(radius: 2)
        )
    }
}

struct PodiumMini: View {
    let position: String
    let imageName: String
    let code: String
    let time: String

    var body: some View {
        HStack(spacing: 4) {
            Text(position)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding(.horizontal, 5)

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red.opacity(0.7), lineWidth: 1.5))

            VStack {
                Text(code)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(.red)
                
                Text(time)
                    .font(.caption2)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    PreviousView()
}
