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
                    VStack(alignment: .leading, spacing: 140) {
                        PreviousRaceCard(
                            backgroundImage: "AustrailianFlag",
                            raceTitle: "Australia",
                            roundNumber: "Round 1",
                            raceDate: "13–15 Mar",
                        )
                        
                        PreviousRaceCard(
                            backgroundImage: "ChinaFlag",
                            raceTitle: "China",
                            roundNumber: "Round 2",
                            raceDate: "20–23 Mar",
                        )
                        
                        PreviousRaceCard(
                            backgroundImage: "JapanFlag",
                            raceTitle: "Japan",
                            roundNumber: "Round 3",
                            raceDate: "05–06 Apr",
                        )

                        PreviousRaceCard(
                            backgroundImage: "BahrainFlag",
                            raceTitle: "Bahrain",
                            roundNumber: "Round 4",
                            raceDate: "11–13 Apr",
                        )
                    }

                }
                .buttonStyle(.plain) // 👈 add this line
            }
        }
        .safeAreaInset(edge: .bottom, spacing: hasFloatingTabBar ? 200 : 0) {
            if hasFloatingTabBar {
                Color.clear.frame(height: 10)
            }
        }
        .safeAreaInset(edge: .top, spacing: 0) {
                   Color.clear.frame(height: 10)
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

struct PreviousRaceCard: View {
    let backgroundImage: String
    let raceTitle: String
    let roundNumber: String
    let raceDate: String
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Image
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            // Dark overlay for readability
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame(maxWidth: .infinity, maxHeight: 130)
                .cornerRadius(20)
            
            // Race Title at the top center
            Text(raceTitle.uppercased())
                .font(.custom("SFPro-ExpandedBold", size: 28))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .offset(y: 40)
            
            // Bottom Info Box
            VStack(spacing: 10) {
                // Top row with round + date
                HStack {
                    Text(roundNumber)
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)
                    Spacer()
                    Text(raceDate)
                        .font(.custom("SFPro-ExpandedRegular", size: 16))
                        .foregroundColor(.white)
                }
                
                // Thin dashed line
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .foregroundColor(.white.opacity(0.4))
                    .frame(height: 1)
                
                // Podium row
                VStack(spacing: 10) {
                    PodiumChip(position: 1, driver: "Max Verstappen", points: 25, gap: "1:36:49:904", image: "VerstappenStand")
                    PodiumChip(position: 2, driver: "Lewis Hamilton", points: 18, gap: "1:36:49:904", image: "VerstappenStand")
                    PodiumChip(position: 3, driver: "Charles Leclerc", points: 15, gap: "1:36:49:904", image: "VerstappenStand")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                // Full Results Button
                Button(action: {
                    // Navigate to full results
                }) {
                    Text("See Full Results")
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.red)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.9), lineWidth: 1.2)
                        )
                        .cornerRadius(16)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 5)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 400)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(1.0), lineWidth: 1.5)
            )
            .offset(y: 109)
        }
        //.frame(height: 200)
        .padding(.horizontal)
    }
}

struct PodiumChip: View {
    let position: Int
    let driver: String
    let points: Int
    let gap: String
    let image: String      // Driver headshot

    var body: some View {
        HStack(spacing: 12) {
            // Position
            Text("P\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(.white)
                .frame(width: 36)

            VStack(alignment: .leading, spacing: 2) {
                // Driver + Points
                HStack {
                    Text("\(driver)")
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)

                    Spacer()

                    Text("\(points) pts")
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundColor(.white)
                }

                // Gap (secondary info)
                Text(gap)
                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                    .foregroundColor(.white)
            }

            Spacer()

            // Driver Headshot
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .top)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1)
                )
                .background(
                    Circle()
                        .fill(Color.blue)
                )
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.9), lineWidth: 1.2)
        )
    }
}


#Preview {
    PreviousView(hasFloatingTabBar: true)
}
