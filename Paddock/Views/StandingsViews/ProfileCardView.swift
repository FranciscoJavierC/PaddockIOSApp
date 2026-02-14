//
//  ProfileCardView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/31/25.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                
                // MARK: - Player Info Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Driver Info")
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        .foregroundColor(.white)
                    
                    // 2x2 Grid Layout for Driver Details
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        DriverInfoCard(flagImage: nil, value: "24 years", label: "6 April 2001")
                        // Country Card (With Flag)
                        DriverInfoCard(flagImage: "AustraliaFlag", value: "AUS", label: "Country")
                        DriverInfoCard(flagImage: nil, value: "#81", label: "Driver Number")
                        DriverInfoCard(flagImage: nil, value: "185 cm", label: "Height")
                    }
                }
                
                // MARK: - Season Stats Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Season Stats")
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        .foregroundColor(.white)
                    
                    // Horizontal Stats Row
                    HStack(spacing: 0) {
                        StatItem(value: "14", label: "Races")
                        StatItem(value: "6", label: "Wins")
                        StatItem(value: "12", label: "Podiums")
                        StatItem(value: "284", label: "Points")
                        StatItem(value: "9.0", label: "Rating", isRating: true)
                    }
                    .padding(.vertical, 20)
                    .background(Color(white: 0.1).opacity(0.8))
                    .cornerRadius(16)
                }
            }
            .padding()
            .padding(.bottom, 80)
        }
        .background(Color.black.ignoresSafeArea()) // High-contrast backdrop
    }
}

// MARK: - Supporting Views

struct DriverInfoCard: View {
    let flagImage: String?
    let value: String
    let label: String
    var subLabel: Bool = false
    
    var body: some View {
        HStack(spacing: 15) {
            // 1. Conditional Flag Placement
            if let flag = flagImage {
                Image(flag)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 26, height: 18) // Standard 2026 broadcast ratio
                    .cornerRadius(5)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                Text(label)
                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .frame(height: 70)
        .background(Color(white: 0.09))
        .cornerRadius(16)
    }
}

struct TeamRow: View {
    var flag: String? = nil
    var logo: String? = nil
    let name: String
    
    var body: some View {
        HStack {
            if let flagName = flag {
                Image(flagName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 20)
                    .cornerRadius(4)
            } else if let logoName = logo {
                Image(logoName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
            
            Text(name)
                .font(.custom("SFPro-ExpandedMedium", size: 16))
            Spacer()
            Image(systemName: "star") // Favoriting capability
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(white: 0.15))
        .cornerRadius(16)
    }
}

struct StatItem: View {
    let value: String
    let label: String
    var isRating: Bool = false
    
    var body: some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(isRating ? .purple : .white)
            Text(label)
                .font(.custom("SFPro-ExpandedRegular", size: 10))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileCardView()
}
