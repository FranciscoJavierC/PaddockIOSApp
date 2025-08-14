//
//  UpcomingView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct UpcomingView: View {
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
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                            .frame(width: 400, height: 500)
                        
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
                            
                            VStack {
                                Image("AustrailianGP")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 350, height: 200)
                                
                                Text("Albert Park Circuit")
                                    .foregroundColor(.adaptiveText)
                                    .font(.custom("SFPro-ExpandedRegular", size: 20))
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(.red))
                                    .frame(width: 380, height: 140)
                                
                                VStack(spacing: 8) {
                                    Text("Practice 1")
                                        .font(.custom("SFPro-ExpandedBold", size: 20))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    
                                    HStack(spacing: 8) {
                                        TimeUnitBox(label: "DAYS", value: "02")
                                        TimeUnitBox(label: "HRS", value: "13")
                                        TimeUnitBox(label: "MIN", value: "45")
                                    }
                                }
                            }
                        }
                    }
                }
                .buttonStyle(.plain)
                
                ForEach(0..<6) { _ in
                    MiniRaceCard(
                        round: "Round 1",
                        country: "AUSTRALIA",
                        flagImage: "AustrailianFlag",
                        circuitImage: "AustrailianGP",
                        shortDate: "13–15",
                        shortMonth: "Mar"
                    )
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 115 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
                   Color.clear.frame(height: 10)
               }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct TimeUnitBox: View {
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.custom("SFPro-ExpandedBold", size: 35))
                .foregroundStyle(.white)
            Text(label)
                .font(.custom("SFPro-ExpandedRegular", size: 13))
                .foregroundColor(.white)
        }
        .frame(width: 115, height: 80)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0.8, green: 0, blue: 0)))
    }
}

struct MiniRaceCard: View {
    let round: String
    let country: String
    let flagImage: String
    let circuitImage: String
    let shortDate: String
    let shortMonth: String

    @Environment(\.colorScheme) var colorScheme

    var cardBackground: Color {
        colorScheme == .dark ? Color(.systemGray6) : .white
    }

    var cardShadow: Color {
        colorScheme == .dark ? .white.opacity(0.2) : .black.opacity(0.2)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cardBackground)
                .frame(height: 120)
                .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(round)
                        .font(.custom("SFPro-ExpandedRegular", size: 17))
                        .foregroundColor(.adaptiveText)

                    HStack(spacing: 8) {
                        Text(country)
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                            .foregroundColor(.adaptiveText)
                        
                        Image(flagImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35, height: 25)
                            .cornerRadius(8)
                    }
                    
                    HStack {
                        Text(shortDate)
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                        Text(shortMonth)
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                    }
                }

                Spacer()

                Image(circuitImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 100)
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal)
    }
}


#Preview {
    UpcomingView(hasFloatingTabBar: true)
}
