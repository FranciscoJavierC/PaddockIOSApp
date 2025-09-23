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
            NavigationLink(destination: ConstructorDetailView()) {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 100) {
                        ConstructorStandingsCard(constructorName: "McLaren", position: 1, points: 559, constructorLogo: "McLaren", constructorColor: .orange, driver1Name: "Lando Norris", driver1Points: 284, driver2Name: "Oscar Piastri", driver2Points: 275)
                        ConstructorStandingsCard(constructorName: "Ferrari", position: 2, points: 260, constructorLogo: "Ferrari", constructorColor: .red, driver1Name: "Charles Leclerc", driver1Points: 151, driver2Name: "Lewis Hamilton", driver2Points: 109)
                        ConstructorStandingsCard(constructorName: "Mercedes", position: 3, points: 236, constructorLogo: "Mercedes", constructorColor: .teal, driver1Name: "George Russell", driver1Points: 172, driver2Name: "Kimi Antonelli", driver2Points: 64)
                        ConstructorStandingsCard(constructorName: "Red Bull", position: 4, points: 194, constructorLogo: "RedBull", constructorColor: .blue, driver1Name: "Max Verstappen", driver1Points: 187, driver2Name: "Yuki Tsunoda", driver2Points: 10)
                    }
                    Spacer().frame(height: 80)
                }
            }
            .buttonStyle(.plain) // 👈 add this line
        }
    }
}

struct ConstructorStandingsCard: View {
    let constructorName: String
    let position: Int
    let points: Int
    let constructorLogo: String
    let constructorColor: Color
    let driver1Name: String
    let driver1Points: Int
    let driver2Name: String
    let driver2Points: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Image
            Rectangle()
                .fill(constructorColor)
                .frame(maxWidth: .infinity, maxHeight: 170)
                .cornerRadius(20)

            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .frame(maxWidth: .infinity)
                .frame(height: 170)
            
            Image(constructorLogo)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            // Bottom Info Box
            VStack(alignment: .center, spacing: 5) {
                // Top section: Name & Team Logo
                HStack(alignment: .center, spacing: 8) {
                    Text(constructorName.uppercased())
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)
                }
                .padding(.top, 10)
                
                // Thin dashed line
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .foregroundColor(.white.opacity(0.4))
                    .frame(height: 1)
                
                // Bottom section: Position & Points
                HStack(alignment: .top) {
                     VStack(alignment: .leading, spacing: 5) {
                         // Driver 1
                         VStack(alignment: .leading) {
                             Text(driver1Name)
                                 .font(.custom("SFPro-ExpandedRegular", size: 14))
                                 .foregroundColor(.white)
                             Text("\(driver1Points) pts")
                                 .font(.custom("SFPro-ExpandedRegular", size: 12))
                                 .foregroundColor(.gray)
                         }
                         
                         // Driver 2
                         VStack(alignment: .leading) {
                             Text(driver2Name)
                                 .font(.custom("SFPro-ExpandedRegular", size: 14))
                                 .foregroundColor(.white)
                             Text("\(driver2Points) pts")
                                 .font(.custom("SFPro-ExpandedRegular", size: 12))
                                 .foregroundColor(.gray)
                         }
                     }
                     
                     Spacer()
                     
                     // Total Position & Points
                     VStack(alignment: .trailing, spacing: 20) {
                         Text("Pos. \(position)")
                             .font(.custom("SFPro-ExpandedBold", size: 16))
                             .foregroundColor(.white)
                         
                         Text("\(points) pts")
                             .font(.custom("SFPro-ExpandedBold", size: 16))
                             .foregroundColor(.white)
                     }
                 }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 125) // Fixed height for info box
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay( // This adds the thin border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(constructorColor.opacity(1.0), lineWidth: 1.5)
            )
            .offset(y: 150) // Adjust position to appear at the bottom of the card
            
        }
        .frame(height: 200) // Total height of the card
        .padding(.horizontal)
    }
}

#Preview {
    ConstructorStandingsView()
}
