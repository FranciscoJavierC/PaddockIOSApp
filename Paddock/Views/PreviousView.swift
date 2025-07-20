//
//  PreviousView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct PreviousView: View {
    @Environment(\.colorScheme) var colorScheme

    var cardBackground: Color {
        colorScheme == .dark ? Color(.systemGray6) : .white
    }

    var cardShadow: Color {
        colorScheme == .dark ? .white.opacity(0.2) : .black.opacity(0.3)
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(cardBackground)
                        .frame(width: 400, height: 240)
                        .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Round 1")
                                .font(.headline)
                                .foregroundColor(.adaptiveText)
                            
                            HStack(spacing: 8) {
                                Image("AustrailianFlag")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 24)
                                    .cornerRadius(8)
                                Text("AUSTRALIA")
                                    .foregroundColor(.adaptiveText)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        
                            Text("13-15 Mar")
                                .foregroundColor(.adaptiveText)
                                .font(.title3)
                        }
                        Image("AustrailianGP")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 100)
                            .padding(.leading, 50)
                    }
                    .padding(.leading, 30)
                    .padding(.bottom, 110)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .bottom, spacing: 20) {
                        PodiumCard(number: 2, code: "VER", imageName: "Verstappen", gradientColors: [.blue, .purple], teamColor: .blue)
                        PodiumCard(number: 1, code: "NOR", imageName: "Verstappen", gradientColors: [.orange, .red], teamColor: .orange)
                        PodiumCard(number: 3, code: "LEC", imageName: "Verstappen", gradientColors: [.red, .pink], teamColor: .red)
                    }
                    .padding(.top, 90)
                    .frame(width: 400)
                }

                ForEach(0..<2) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .frame(width: 400, height: 240)
                            .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Round 1")
                                    .font(.headline)
                                    .foregroundColor(.adaptiveText)
                                
                                HStack(spacing: 8) {
                                    Image("AustrailianFlag")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 24)
                                        .cornerRadius(8)
                                    Text("AUSTRALIA")
                                        .foregroundColor(.adaptiveText)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                
                                Text("13-15 Mar")
                                    .foregroundColor(.adaptiveText)
                                    .font(.title3)
                            }
                            Image("AustrailianGP")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                                .padding(.leading, 50)
                        }
                        .padding(.leading, 30)
                        .padding(.bottom, 110)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .bottom, spacing: 20) {
                            PodiumCard(number: 2, code: "VER", imageName: "Verstappen", gradientColors: [.blue, .purple], teamColor: .blue)
                            PodiumCard(number: 1, code: "NOR", imageName: "Verstappen", gradientColors: [.orange, .red], teamColor: .orange)
                            PodiumCard(number: 3, code: "LEC", imageName: "Verstappen", gradientColors: [.red, .pink], teamColor: .red)
                        }
                        .padding(.top, 90)
                        .frame(width: 400)
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
    let imageName: String // Assumes you have images like "Verstappen", "Norris", "Leclerc"
    let gradientColors: [Color] // Colors for the background gradient
    let teamColor: Color // Color for the small bar next to number/code

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .trailing, endPoint: .leading))
                    .frame(width: 100, height: imageHeight(for: number))
                    .offset(y: 20)
                    .clipShape(
                            .rect(cornerRadii: .init(topTrailing: 20))
                        )
                    .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .clear, location: 0.0),  // fully transparent on left
                                    .init(color: .black, location: 0.8),  // fully opaque starting at 30%
                                    .init(color: .black, location: 1.0)   // opaque on right
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                
                // Driver Image
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: imageHeight(for: number))
                    .clipShape(Rectangle())
            }
            .frame(width: 100, height: 100)
            .clipped()


            HStack(spacing: 8) {
                Text("\(number)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.adaptiveText)
                
                Rectangle()
                    .fill(teamColor)
                    .frame(width: 3, height: 12)

                Text(code)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.adaptiveText)
            }
        }
        .frame(width: 120)
    }
    
    private func imageHeight(for position: Int) -> CGFloat {
        switch position {
        case 1:
            return 100 // biggest
        case 2:
            return 85  // slightly smaller
        case 3:
            return 75  // even smaller
        default:
            return 80
        }
    }
}

extension Color {
    static var adaptiveText: Color {
        Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .white : .black
        })
    }
}

extension Color {
    static var adaptiveBackground: Color {
        Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .light ? .white : .systemGray6
        })
    }
}

#Preview {
    PreviousView()
}
