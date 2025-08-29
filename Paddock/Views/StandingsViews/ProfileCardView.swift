//
//  ProfileCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/31/25.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                // MARK: - Top Card with 3x2 Layout
                                VStack(spacing: 20) {
                                    // Top row with 3 data points
                                    HStack(spacing: 0) {
                                        // Column 1: Country
                                        VStack(spacing: 5) {
                                            HStack(spacing: 5) {
                                                Image("AustrailianFlag")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 25, height: 20)
                                                    .cornerRadius(20)

                                                Text("AUS")
                                                    .font(.custom("SFPro-ExpandedRegular", size: 18))
                                            }
                                            Text("Country")
                                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                                .foregroundStyle(.secondary)
                                        }
                                        .frame(maxWidth: .infinity)
                                        
                                        // Column 2: Team
                                        VStack(spacing: 5) {
                                            Text("McLaren")
                                                .font(.custom("SFPro-ExpandedRegular", size: 18))

                                            Text("Team")
                                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                                .foregroundStyle(.secondary)
                                        }
                                        .frame(maxWidth: .infinity)

                                        // Column 3: Number
                                        VStack(spacing: 5) {
                                            Text("81") // Placeholder, assuming this is the number
                                                .font(.custom("SFPro-ExpandedRegular", size: 18))
                                            Text("Number")
                                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                                .foregroundStyle(.secondary)
                                        }
                                        .frame(maxWidth: .infinity)
                                    }
                                    
                                    // Bottom row with 2 data points
                                    HStack(spacing: 0) {
                                        // Column 1: Height
                                        VStack(spacing: 5) {
                                            Text("5.8 ft")
                                                .font(.custom("SFPro-ExpandedRegular", size: 18))
                                            Text("Height")
                                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                                .foregroundStyle(.secondary)
                                        }
                                        .frame(maxWidth: .infinity)
                                        
                                        // Column 2: Date of Birth
                                        VStack(spacing: 5) {
                                            Text("Apr 6, 2001")
                                                .font(.custom("SFPro-ExpandedRegular", size: 18))
                                            Text("Birthday")
                                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                                .foregroundStyle(.secondary)
                                        }
                                        .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white) // Apply a consistent text color
                                .background(.ultraThinMaterial)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                                )
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 8) {
                        Image("F1Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 25)
                        Text("2025 Season")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack(alignment: .top) {
                        // Each VStack is a column
                        VStack(spacing: 5) {
                            Text("14")
                                .font(.custom("SFPro-ExpandedRegular", size: 22))
                                .foregroundColor(.white)
                            Text("Race Starts")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 5) {
                            Text("6")
                                .font(.custom("SFPro-ExpandedRegular", size: 22))
                                .foregroundColor(.white)
                            Text("Wins")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 5) {
                            Text("12")
                                .font(.custom("SFPro-ExpandedRegular", size: 22))
                                .foregroundColor(.white)
                            Text("Podiums")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 5) {
                            Text("284")
                                .font(.custom("SFPro-ExpandedRegular", size: 22))
                                .foregroundColor(.white)
                            Text("Points")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 5) {
                            Text("9.0")
                                .font(.custom("SFPro-ExpandedRegular", size: 22))
                                .foregroundColor(.white)
                                .padding(.horizontal, 7)
                                .background(
                                    Capsule()
                                        .fill(LinearGradient(
                                            colors: [Color.purple.opacity(0.7), Color.purple.opacity(0.3)],
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                        .overlay(
                                            Capsule()
                                                .stroke(Color.purple, lineWidth: 1)
                                        )
                                )
                            Text("Rating")
                                .font(.custom("SFPro-ExpandedRegular", size: 12))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
            }
            .padding()
            .padding(.bottom, 80) // so it doesn’t get cut off
        }
    }
}

#Preview {
    ProfileCardView()
}
