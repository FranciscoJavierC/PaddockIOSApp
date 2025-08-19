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
    
    var hasFloatingTabBar: Bool


    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                NavigationLink(destination: PreviousRaceDetailView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                            .frame(width: 400, height: 310)// Without circuit image 280
                        
                        VStack(spacing: 12) {
                            VStack(spacing: 8) {
                                HStack(spacing: 8) {
                                    Text("AUSTRALIA")
                                        .foregroundColor(.adaptiveText)
                                        .font(.custom("SFPro-ExpandedBold", size: 30))

                                    Image("AustrailianFlag")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 30)
                                        .cornerRadius(8)
                                }
                               
                                HStack(spacing: 30) {
                                    Text("Round 1")
                                        .font(.custom("SFPro-ExpandedRegular", size: 18))

                                    Text("13-15 Mar")
                                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                                }
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity)
                            }
                            
                            HStack(alignment: .bottom, spacing: 20) {
                                PodiumCard(
                                    position: 2,
                                    points: 18,
                                    driverName: "Verstappen",
                                    driverImage: "Verstappen",
                                    teamColor: .blue,
                                    cardHeight: 200
                                )
                                
                                PodiumCard(
                                    position: 1,
                                    points: 25,
                                    driverName: "Verstappen",
                                    driverImage: "Verstappen",
                                    teamColor: .red,
                                    cardHeight: 210
                                )
                                
                                PodiumCard(
                                    position: 3,
                                    points: 15,
                                    driverName: "Verstappen",
                                    driverImage: "Verstappen",
                                    teamColor: .orange,
                                    cardHeight: 190
                                )
                            }
                        }
                        .frame(width: 400)
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain) // 👈 add this line
                
                ForEach(0..<6) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                            .frame(width: 400, height: 190)
                        
                        VStack(spacing: 13) {
                            VStack(spacing: 8) {
                                HStack(spacing: 8) {
                                    Text("AUSTRALIA")
                                        .foregroundColor(.adaptiveText)
                                        .font(.custom("SFPro-ExpandedBold", size: 30))

                                    Image("AustrailianFlag")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 30)
                                        .cornerRadius(8)
                                }
                               
                                HStack(spacing: 30) {
                                    Text("Round 1")
                                        .font(.custom("SFPro-ExpandedRegular", size: 18))

                                    Text("13-15 Mar")
                                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                                }
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity)
                            }
                            
                            HStack(alignment: .bottom, spacing: 20) {
                                PodiumCardMini(
                                    position: 1,
                                    points: 25,
                                    driverCodeName: "Ver",
                                    driverImage: "Verstappen",
                                    teamColor: .blue,
                                )
                                
                                PodiumCardMini(
                                    position: 2,
                                    points: 18,
                                    driverCodeName: "Ver",
                                    driverImage: "Verstappen",
                                    teamColor: .red,
                                )
                                
                                PodiumCardMini(
                                    position: 3,
                                    points: 15,
                                    driverCodeName: "Ver",
                                    driverImage: "Verstappen",
                                    teamColor: .orange,
                                )
                            }
                        }
                        .frame(width: 400)
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 110 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
                   Color.clear.frame(height: 10)
               }
    }
}

struct PodiumCard: View {
    let position: Int
    let points: Int
    let driverName: String
    let driverImage: String
    let teamColor: Color
    let cardHeight: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            // Top Bar
            Text("P\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(.white)
                .frame(height: 35)
            
            // Driver Image
            Image(driverImage)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 100, alignment: .top) // Set your desired size
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.9), radius: 5, x: 0, y: 3) 
            
            // Name & Logo
            VStack(spacing: 4) {
                Text(driverName.uppercased())
                    .font(.custom("SFPro-ExpandedBold", size: 11))
                    .foregroundColor(.white)
                
                Text("\(points) PTS")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .foregroundColor(.white)
                
            }
            .padding(.vertical, 10)
        }
        .frame(width: 110, height: cardHeight)
        .background(teamColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct PodiumCardMini: View {
    let position: Int
    let points: Int
    let driverCodeName: String
    let driverImage: String
    let teamColor: Color
    var body: some View {
        HStack(spacing: 5) {
            // Top Bar
            Text("P\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 20))
                .foregroundColor(.white)
            
            // Driver Image
            Image(driverImage)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .top)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.9), radius: 5, x: 0, y: 3)
            
            // Name & Logo
            VStack(spacing: 4) {
                Text(driverCodeName.uppercased())
                    .font(.custom("SFPro-ExpandedBold", size: 11))
                    .foregroundColor(.white)
                
                Text("\(points) PTS")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .foregroundColor(.white)
                
            }
            .padding(.vertical, 10)
        }
        .frame(width: 110, height: 50)
        .background(teamColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
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
    PreviousView(hasFloatingTabBar: true)
}
