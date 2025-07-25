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
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(cardBackground)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        .frame(width: 400, height: 300)// Old height with old design was 310 for large schedule
                    
                    VStack(spacing: 13) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 19) {
                                HStack {
                                    Text("Round 1")
                                        .font(.custom("SFPro-ExpandedRegular", size: 17))
                                        .foregroundColor(.adaptiveText)
                                }
                                
                                HStack(spacing: 8) {
                                    Image("AustrailianFlag")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 30)
                                        .cornerRadius(8)
                                    Text("AUSTRALIA")
                                        .foregroundColor(.adaptiveText)
                                        .font(.custom("SFPro-ExpandedBold", size: 20))
                                }
                                
                                Text("13-15 Mar")
                                    .foregroundColor(.adaptiveText)
                                    .font(.custom("SFPro-ExpandedRegular", size: 17))
                            }
                            
                            VStack(spacing: -30) {
                                Image("AustrailianGP")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 100)
                                    .padding(.bottom, 20)
                                
                                Text("Albert Park Circuit")
                                    .foregroundColor(.adaptiveText)
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                            }
                        }
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .bottom, spacing: 20) {
                            PodiumCard(position: 1, code: "VER",teamColor: .blue, driverImage: "Verstappen", lapTime: "1:42:06.304")
                            PodiumCard(position: 2, code: "VER",teamColor: .red, driverImage: "Verstappen", lapTime: "+0.895")
                            PodiumCard(position: 3, code: "VER",teamColor: .orange, driverImage: "Verstappen", lapTime: "+8.481")
                        }
                    }
                    .frame(width: 400)
                }
                
                ForEach(0..<6) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                            .frame(width: 400, height: 300)
                        
                        VStack(spacing: 13) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 19) {
                                    HStack {
                                        Text("Round 1")
                                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                                            .foregroundColor(.adaptiveText)
                                    }
                                    
                                    HStack(spacing: 8) {
                                        Image("AustrailianFlag")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 30)
                                            .cornerRadius(8)
                                        Text("AUSTRALIA")
                                            .foregroundColor(.adaptiveText)
                                            .font(.custom("SFPro-ExpandedBold", size: 20))
                                    }
                                    
                                    Text("13-15 Mar")
                                        .foregroundColor(.adaptiveText)
                                        .font(.custom("SFPro-ExpandedRegular", size: 17))
                                }
                                
                                VStack(spacing: -30) {
                                    Image("AustrailianGP")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 100)
                                        .padding(.bottom, 20)
                                    
                                    Text("Albert Park Circuit")
                                        .foregroundColor(.adaptiveText)
                                        .font(.custom("SFPro-ExpandedRegular", size: 15))
                                }
                            }
                            .padding(.leading, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(alignment: .bottom, spacing: 20) {
                                PodiumCard(position: 1, code: "VER",teamColor: .blue, driverImage: "Verstappen", lapTime: "1:42:06.304")
                                PodiumCard(position: 2, code: "VER",teamColor: .red, driverImage: "Verstappen", lapTime: "+0.895")
                                PodiumCard(position: 3, code: "VER",teamColor: .orange, driverImage: "Verstappen", lapTime: "+8.481")
                            }
                        }
                        .frame(width: 400)
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 60 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
                   Color.clear.frame(height: 5)
               }
    }
}

struct PodiumCard: View {
    let position: Int
    let code: String // Driver code like "VER"
    let teamColor: Color
    let driverImage: String // Image asset name
    let lapTime: String

    var body: some View {
        VStack(spacing: 0) {
            // Header
            ZStack {
                teamColor
                    .frame(height: 30)
                    .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))

                Text("\(position) \(code)")
                    .font(.custom("SFPro-ExpandedBold", size: 13))
                    .foregroundStyle(.white)
            }

            VStack(spacing: 6) {
                Image(driverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 70)
                    .clipShape(Circle())

                Text(lapTime)
                    .font(.custom("SFPro-ExpandedRegular", size: 12))
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(Color(.systemBackground))
        }
        .frame(width: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 1)
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
