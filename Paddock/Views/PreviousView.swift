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
                        .frame(width: 400, height: 300)
                        .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Round 1")
                                .font(.headline)
                                .foregroundColor(.adaptiveText)
                            
                            HStack {
                                Image("AustrailianFlag")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 24)
                                    .cornerRadius(8)
                                Text("Australia")
                                    .foregroundColor(.adaptiveText)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            
                            Text("FORMULA 1 LOUIS VUITTON AUSTRALIAN GRAND PRIX 2025")
                                .foregroundColor(.adaptiveText)
                                .font(.headline)
                            
                            Text("13-15 Mar")
                                .foregroundColor(.adaptiveText)
                        }
                        Image("AustrailianGP")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 100)
                    }
                    
                    HStack(alignment: .bottom, spacing: 20) {
                        PodiumCard(number: 2, code: "VER", imageName: "Verstappen", isDark: true)
                            .frame(height: 150)
                        PodiumCard(number: 1, code: "NOR", imageName: "Verstappen", isDark: true)
                            .frame(height: 180)
                        PodiumCard(number: 3, code: "LEC", imageName: "Verstappen", isDark: true)
                            .frame(height: 130)
                    }
                    .padding(.horizontal, 50)
                    .padding(.top, 60)
                    .frame(maxHeight: .infinity, alignment: .center)
                }

                ForEach(0..<2) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .frame(width: 400, height: 140)
                            .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

                        VStack(spacing: 8) {
                            HStack(spacing: 12) {
                                Image("AustrailianFlag")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                    .padding(.leading, 30)

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Round 1")
                                        .font(.caption)
                                        .foregroundColor(.adaptiveText)
                                    Text("Australian GP")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.adaptiveText)
                                    Text("Melbourne")
                                        .font(.caption)
                                        .foregroundColor(.adaptiveText)
                                }

                                Spacer()

                                VStack(spacing: 1) {
                                    Text("13-15")
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    Text("MAR")
                                        .font(.caption2)
                                }
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.red)
                                .cornerRadius(6)
                            }
                            .padding(.horizontal, 16)
                            .padding(.trailing, 30)

                            HStack(spacing: 16) {
                                PodiumMini(position: "1", imageName: "Verstappen", code: "VER", time: "1:29:15.211", isDark: true)
                                PodiumMini(position: "2", imageName: "Verstappen", code: "NOR", time: "+5.221", isDark: true)
                                PodiumMini(position: "3", imageName: "Verstappen", code: "LEC", time: "+12.407", isDark: true)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.red) // <- BLACK background
                                    .frame(width: 370)
                            )
                            .frame(width: 380)
                        }
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
    let imageName: String
    var isDark: Bool = false

    var textColor: Color {
        isDark ? .white : .adaptiveText
    }

    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                    
                    HStack {
                        Text("\(number)")
                            .font(.caption2)
                            .fontWeight(.bold)
                        Text(code)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct PodiumMini: View {
    let position: String
    let imageName: String
    let code: String
    let time: String
    var isDark: Bool = false  // <- new flag

    var textColor: Color {
        isDark ? .white : .adaptiveText
    }

    var body: some View {
        HStack(spacing: 4) {
            Text(position)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .padding(.horizontal, 5)

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .background(Circle().fill(Color.adaptiveBackground))

            VStack {
                Text(code)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(textColor)

                Text(time)
                    .font(.caption2)
                    .foregroundColor(textColor)
            }
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
