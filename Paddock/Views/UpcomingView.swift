//
//  UpcomingView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct Session {
    let title: String
    let day: String
    let time: String
}

let scheduleData: [Session] = [
    .init(title: "Practice 1", day: "FRI", time: "12:30 - 13:30"),
    .init(title: "Practice 2", day: "FRI", time: "16:00 - 17:00"),
    .init(title: "Practice 3", day: "SAT", time: "12:30 - 13:30"),
    .init(title: "Qualifying", day: "SAT", time: "16:00 - 17:00"),
    .init(title: "Race",       day: "SUN", time: "15:00")
]

struct UpcomingView: View {
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
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        .frame(width: 400, height: 400)// Old height with old design was 310 for large schedule


                    VStack {
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
                                    .padding(.leading, 10)
                                    .padding(.bottom, 20)
                                
                                Text("Albert Park Circuit")
                                    .foregroundColor(.adaptiveText)
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                            }
                        }
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 8) {
                            WeekendDayCard(
                                day: "FRI",
                                date: "MAR 13",
                                sessions: [
                                    ("Practice 1", "12:30 - 13:30"),
                                    ("Practice 2", "16:00 - 17:00")
                                ]
                            )

                            WeekendDayCard(
                                day: "SAT",
                                date: "MAR 14",
                                sessions: [
                                    ("Practice 3", "11:30 - 12:30"),
                                    ("Qualifying", "15:00 - 16:00")
                                ]
                            )

                            WeekendDayCard(
                                day: "SUN",
                                date: "MAR 15",
                                sessions: [
                                    ("Race", "13:00 - 15:00")
                                ]
                            )
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

                ForEach(0..<4) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(cardBackground)
                            .frame(width: 400, height: 120)
                            .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                        HStack(spacing: 12) {
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                .padding(.leading, 40)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Round 1")
                                    .font(.subheadline)
                                    .foregroundColor(.adaptiveText)
                                Text("Australian GP")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.adaptiveText)
                                Text("Melbourne")
                                    .font(.subheadline)
                                    .foregroundColor(.adaptiveText)
                            }

                            Spacer()

                            Image("AustrailianGP")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .cornerRadius(10)

                            VStack(spacing: 2) {
                                Text("13-15")
                                    .font(.custom("SFPro-ExpandedBold", size: 12))
                                Text("MAR")
                                    .font(.custom("SFPro-ExpandedBold", size: 10))
                            }
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.trailing, 40)
                        }
                    }
                }
            }
        }
        .padding(.vertical, -10)
        .safeAreaInset(edge: .top, spacing: 0) {
            Color.clear.frame(height: 10)
        }
        .safeAreaPadding(.bottom, 70)
    }
}

struct WeekendDayCard: View {
    let day: String
    let date: String
    let sessions: [(title: String, time: String)]

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.red
                    .frame(height: 35)
                    .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                
                HStack(spacing: 4) {
                    Text(day)
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundStyle(.white)
                    Text(date)
                        .font(.custom("SFPro-ExpandedBold", size: 13))
                        .foregroundStyle(.white)
                }
            }

            VStack {
                ForEach(sessions.indices, id: \.self) { index in
                    VStack(spacing: 4) {
                        Text(sessions[index].title)
                            .font(.custom("SFPro-ExpandedBold", size: 11))
                            .multilineTextAlignment(.center)

                        Text(sessions[index].time)
                            .font(.custom("SFPro-ExpandedRegular", size: 10))
                            .foregroundColor(Color.black)
                    }
                }
                Spacer()
            }
            .padding(.vertical, 8)
            .frame(height: 75)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
        }
        .frame(width: 120, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 2)
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


#Preview {
    UpcomingView()
}
