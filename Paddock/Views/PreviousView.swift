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
                    
                    HStack(alignment: .bottom, spacing: 20) {
                        PodiumCard(number: 2, code: "VER", imageName: "Verstappen", timeGap: "1:29:15.211")
                            .frame(height: 150)
                        PodiumCard(number: 1, code: "NOR", imageName: "Verstappen", timeGap: "+5.221s")
                            .frame(height: 180)
                        PodiumCard(number: 3, code: "LEC", imageName: "Verstappen", timeGap: "+12.407s")
                            .frame(height: 130)
                    }
                    .padding(.horizontal, 50)
                    .padding(.top, 60)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    HStack {
                        // Text content on the left
                        VStack(alignment: .leading) {
                            Text("Round 1")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text("Australian GP")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Melbourne")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .padding(.leading, 150)
                        .padding(.bottom, 280)
                        
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
                }
            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

struct PodiumCard: View {
    let number: Int
    let code: String
    let imageName: String
    let timeGap: String

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Position number OUTSIDE of the rectangle, like driver image
                Text("\(number)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 32, height: 32)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(y: -20) // Pull it up outside the card

                // Rectangle body
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white)
                    .frame(width: 100, height: 150)
                    .shadow(radius: 2)
                    .overlay(
                        VStack(spacing: 10) {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .background(
                                        Circle()
                                            .fill(Color.blue)
                                    )

                            Text(code)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.red)

                            Text(timeGap)
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    )
            }
        }
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
                .background(
                        Circle()
                            .fill(Color.blue)
                    )


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
