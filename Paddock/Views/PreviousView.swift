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
                        .frame(width: 400, height: 400)
                        .shadow(color: cardShadow, radius: 6, x: 0, y: 3)

                    HStack(alignment: .bottom, spacing: 20) {
                        PodiumCard(number: 2, code: "VER", imageName: "Verstappen", timeGap: "1:29:15.211", isDark: true)
                            .frame(height: 150)
                        PodiumCard(number: 1, code: "NOR", imageName: "Verstappen", timeGap: "+5.221s", isDark: true)
                            .frame(height: 180)
                        PodiumCard(number: 3, code: "LEC", imageName: "Verstappen", timeGap: "+12.407s", isDark: true)
                            .frame(height: 130)
                    }
                    .padding(.horizontal, 50)
                    .padding(.top, 60)
                    .frame(maxHeight: .infinity, alignment: .center)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Round 1")
                                .font(.headline)
                                .foregroundColor(.adaptiveText)
                            Text("Australian GP")
                                .foregroundColor(.adaptiveText)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Melbourne")
                                .foregroundColor(.adaptiveText)
                                .font(.headline)
                        }
                        .padding(.leading, 150)
                        .padding(.bottom, 280)

                        Spacer()

                        VStack(spacing: 4) {
                            Text("13-15")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.title2)
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.trailing, 30)
                        .padding(.bottom, 280)

                        VStack(spacing: 4) {
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, style: StrokeStyle(lineWidth: 4)))
                        }
                        .padding(.leading, -400)
                        .padding(.top, -180)
                    }
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
    let timeGap: String
    var isDark: Bool = false

    var textColor: Color {
        isDark ? .white : .adaptiveText
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text("\(number)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.adaptiveText)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                    .offset(y: -20)

                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.red)
                    .frame(width: 100, height: 150)
                    .shadow(radius: 2)
                    .overlay(
                        VStack(spacing: 10) {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .background(Circle().fill(Color.adaptiveBackground))

                            Text(code)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(textColor)

                            Text(timeGap)
                                .font(.caption)
                                .foregroundColor(textColor)
                        }
                    )
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
