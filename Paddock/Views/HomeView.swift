//
//  HomeView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/2/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 40) {
                    ExperimentCard(backgroundImage: "SingaporeFlag", raceTitle: "Singapore", roundNumber: "Round 18", raceDate: "Oct 03-05", raceNameFull: "Marina Bay Street Circuit")
                    Experiment2Card(backgroundImage: "SingaporeFlag", raceTitle: "Singapore", locality: "Marina Bay", roundNumber: "Round 18", raceDate: "Oct 03-05", raceNameFull: "Marina Bay Street Circuit")
                }
            }
        }
    }
}

struct ExperimentCard: View {
    let backgroundImage: String
    let raceTitle: String
    let roundNumber: String
    let raceDate: String
    let raceNameFull: String

    var body: some View {
        ZStack(alignment: .top) {
            // Background Image
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.5),
                    Color.black.opacity(0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Race Title at the top center
            Text(raceTitle.uppercased())
                .font(.custom("SFPro-ExpandedBold", size: 28))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .offset(y: 80)
            
            // Bottom Info Box
            if #available(iOS 26.0, *) {
                VStack(alignment: .leading, spacing: 5) {
                    // Top row with "Testing Round" and date
                    HStack {
                        Text(roundNumber)
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        Spacer()
                        Text(raceDate)
                            .font(.custom("SFPro-ExpandedRegular", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    
                    // Thin dashed line
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .foregroundColor(.white.opacity(0.4))
                        .frame(height: 1)
                    
                    // Second row with race name and button
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(.white)
                        
                        Text(raceNameFull)
                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Text("Race Info")
                                .font(.custom("SFPro-ExpandedBold", size: 13))
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.red)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 95) // Fixed height for info box
                .glassEffect(in: .rect(cornerRadius: 20))
                //.background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(1.0), lineWidth: 1.5)
                )
                .offset(y: 130)
            } else {
                // Fallback on earlier versions
                VStack(alignment: .leading, spacing: 5) {
                    // Top row with "Testing Round" and date
                    HStack {
                        Text(roundNumber)
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        Spacer()
                        Text(raceDate)
                            .font(.custom("SFPro-ExpandedRegular", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    
                    // Thin dashed line
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .foregroundColor(.white.opacity(0.4))
                        .frame(height: 1)
                    
                    // Second row with race name and button
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(.white)
                        
                        Text(raceNameFull)
                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Text("Race Info")
                                .font(.custom("SFPro-ExpandedBold", size: 13))
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 15)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.red)
                                )
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white.opacity(0.9), lineWidth: 1.2)
                                )
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 95) // Fixed height for info box
                //.glassEffect(in: .rect(cornerRadius: 20))
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(1.0), lineWidth: 1.5)
                )
                .offset(y: 130)
            }
            
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}

struct Experiment2Card: View {
    let backgroundImage: String
    let raceTitle: String       // Country
    let locality: String        // City or track region
    let roundNumber: String
    let raceDate: String
    let raceNameFull: String    // Full track name
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Flag Section
            ZStack(alignment: .topTrailing) {
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .cornerRadius(20)
                    .padding(15)
                    .clipped()
                    .overlay {
                        ReadabilityRoundedRectangle()
                    }
                    .shadow(radius: 3, y: 2)
                
                // Round badge
                if #available(iOS 26.0, *) {
                    Text("R\(roundNumber.replacingOccurrences(of: "Round ", with: ""))")
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .glassEffect()
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                } else {
                    Text("R\(roundNumber.replacingOccurrences(of: "Round ", with: ""))")
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Capsule().fill(Color.red.opacity(0.9)))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.9), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                }
            }
            
            // MARK: - Info Section
            VStack(alignment: .leading, spacing: 10) {
                
                // Country + locality
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(raceTitle.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 22))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(locality)
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                // Track info
                HStack(spacing: 6) {
                    Image(systemName: "mappin")
                        .foregroundColor(.white.opacity(0.9))
                        .imageScale(.small)
                    Text(raceNameFull)
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                        .foregroundColor(.white.opacity(0.95))
                        .lineLimit(2)
                    
                    Spacer()
                    
                    // Race date
                    Text(raceDate.uppercased())
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .foregroundColor(.red)
                        .padding(.top, 2)
                }
                
                // Weekend Info button
                HStack {
                    Spacer()
                    if #available(iOS 26.0, *) {
                        Button("Weekend Info") {}
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .padding(.horizontal, 115)
                            .buttonStyle(.glassProminent)
                            .tint(.red)
                    } else {
                        Button("Weekend Info") {}
                            .font(.custom("SFPro-ExpandedBold", size: 13))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 18)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.red)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.white.opacity(0.9), lineWidth: 1)
                            )
                    }
                }
                .padding(.top, 6)
            }
            .padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial.opacity(0.05))
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
