//
//  OverviewView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 8/23/25.
//

import SwiftUI

struct OverviewView: View {
    
    let sessions = [
        ("Practice 1", "Fri 13 Mar, 20:30 - 21:30"),
        ("Practice 2", "Fri 14 Mar, 00:00 - 01:00"),
        ("Practice 3", "Sat 14 Mar, 20:30 - 21:30"),
        ("Qualifying", "Sat 15 Mar, 00:00 - 01:00"),
        ("Race", "Sun 15 Mar, 23:00")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image("F1Logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("Formula 1 - Round 1")
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                    }
                    
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(.white)
                        Text("Albert Park Circuit, Melbourne, Australia")
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                    }
                    
                    HStack {
                        Image(systemName: "tv")
                            .foregroundColor(.white)
                        Text("F1 TV Pro / ESPN")
                            .font(.custom("SFPro-ExpandedRegular", size: 14))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
                
                // MARK: - Schedule Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Weekend Schedule")
                        .font(.custom("SFPro-ExpandedBold", size: 18))
                    
                    ForEach(sessions, id: \.0) { session in
                        VStack(alignment: .leading) {
                            Text(session.1)
                                .font(.custom("SFPro-ExpandedRegular", size: 15))
                            Spacer()
                            HStack {
                                Image(systemName: iconForSession(session.0))
                                    .foregroundColor(.white)
                                    .frame(width: 20)
                                
                                Text(session.0)
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                            }
                        }
                        Divider().background(Color.white.opacity(0.3))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
                
                // MARK: - Circuit Header Card
                VStack {
                    HStack {
                        Image("AustrailianFlag")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 1)
                            )
                        Text("Albert Park Circuit")
                            .font(.custom("SFPro-ExpandedRegular", size: 22))
                    }
                    
                    Divider().background(Color.white.opacity(0.3))

                    Image("AustrailianGP")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 10)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
                
                // MARK: - Circuit Info Card
                VStack(alignment: .leading, spacing: 20) {
                    Text("Track Details")
                        .font(.custom("SFPro-ExpandedBold", size: 18))
                    HStack {
                        statBlock(title: "Track Length", value: "5.278 km", alignment: .leading)
                        Spacer()
                        statBlock(title: "First Grand Prix", value: "1996", alignment: .trailing)
                    }
                    
                    HStack {
                        statBlock(title: "Lap Record", value: "1:19.813", subtitle: "Leclerc, 2024", alignment: .leading)
                        Spacer()
                        statBlock(title: "Number of Laps", value: "58", alignment: .trailing)
                    }
                    
                    HStack {
                        statBlock(title: "Elevation", value: "2.45 m", alignment: .leading)
                        Spacer()
                        statBlock(title: "Top Speed", value: "339.9 km/h", alignment: .trailing)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )

                
                // MARK: - Weekend Facts
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weekend Facts")
                        .font(.custom("SFPro-ExpandedBold", size: 18))
                    HStack {
                        statBlock(title: "Most Driver Wins", value: "M.Schumacher", subtitle: "(4)", alignment: .leading)
                        Spacer()
                        statBlock(title: "Most Constructor Wins", value: "Ferrari", subtitle: "(11)", alignment: .trailing)
                    }
                    
                    HStack {
                        statBlock(title: "Most Poles", value: "L.Hamilton", subtitle: "(8)", alignment: .leading)
                        Spacer()
                        statBlock(title: "Most Recent Winner", value: "C. Leclerc", subtitle: "2024", alignment: .trailing)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
            }
            .padding()
            .padding(.bottom, 80) // so it doesn’t get cut off
        }
    }
}

// MARK: - Reusable Block
@ViewBuilder
private func statBlock(title: String, value: String, subtitle: String? = nil, alignment: HorizontalAlignment) -> some View {
    VStack(alignment: alignment, spacing: 2) {
        Text(title)
            .font(.custom("SFPro-ExpandedRegular", size: 14))
            .foregroundColor(.gray)
        
        Text(value)
            .font(.custom("SFPro-ExpandedBold", size: 18))
            .multilineTextAlignment(alignment == .leading ? .leading : .trailing)
        
        if let subtitle = subtitle {
            Text(subtitle)
                .font(.custom("SFPro-ExpandedRegular", size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(alignment == .leading ? .leading : .trailing)
        }
    }
}

private func iconForSession(_ session: String) -> String {
    switch session {
    case "Practice 1", "Practice 2", "Practice 3":
        return "wrench.adjustable" // practice = car speed icon
    case "Qualifying":
        return "stopwatch" // qualifying = checkered flag
    case "Race":
        return "flag.pattern.checkered" // race = car
    default:
        return "calendar"
    }
}

#Preview {
    OverviewView()
}
