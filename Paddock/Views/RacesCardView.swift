//
//  RacesCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/31/25.
//

import SwiftUI

struct RacesCardView: View {
    var raceFlag: String = ""
    var raceName: String = ""
    var raceDate: String = ""
    var placeFinished: Int = 0
    var rating: Double = 0
    var teamLogo: String = ""
    var teamName: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(teamLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 42)
                    
                    Text(teamName)
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                }
                
                Divider()
                
                HStack {
                    Image(raceFlag)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack {
                        Text(raceName)
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                        
                        Text(raceDate)
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(placeFinished)st")
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                        
                        Text(String(format: "%.1f", rating))
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                            .padding(.horizontal, 9)
                            .padding(.vertical, 8)
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
                    }
                }
            }
            .padding()
            .frame(width: 400)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
            .fixedSize(horizontal: false, vertical: true)

            // Capsule Label
            Text("RACES")
                .font(.custom("SFPro-ExpandedRegular", size: 15))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.red)
                .clipShape(Capsule())
                .offset(y: -18)
        }
        .padding(.top, 20)
    }
}

#Preview {
    RacesCardView()
}
