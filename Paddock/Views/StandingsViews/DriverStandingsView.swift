//
//  DriverStandings.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/12/25.
//

import SwiftUI

// MARK: - Table Mode Enum
enum DriverTableMode: String, CaseIterable {
    case short = "Short"
    case full = "Full"
    case form = "Form"
}

struct DriverStandingsView: View {
    @StateObject private var viewModel = DriverStandingsModel()
    @State private var selectedDriver: DriverStandings? = nil
    @State private var showDetail = false
    @State private var tableMode: DriverTableMode = .short
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // MARK: - Filter Bar
                tableFilter
                
                tableHeader
                
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.drivers, id: \.id) { driver in
                        DriverStandingsRow(
                            driverName: driver.FullName,
                            driverNumber: driver.DriverNumber,
                            position: driver.Position,
                            points: Int(driver.Points),
                            teamColor: Color(hex: driver.TeamColorHex),
                            mode: tableMode
                        )
                        .onTapGesture {
                            selectedDriver = driver
                            showDetail = true
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationDestination(isPresented: $showDetail) {
            if let driver = selectedDriver {
                DriverDetailView(driver: driver)
            }
        }
    }
    
    // MARK: - Trailing Content
    @ViewBuilder
    private var headerTrailingContent: some View {
        switch tableMode {
            
        case .short:
            HStack(spacing: 16) {
                headerStat("R")
                headerStat("W")
                headerStat("PTS")
            }
            
        case .full:
            HStack(spacing: 0) {
                headerStat("R", width: 42)
                headerStat("W", width: 42)
                headerStat("P", width: 42)
                headerStat("POD", width: 42)
                headerStat("PTS", width: 42)
            }
            
        case .form:
            HStack(spacing: 8) {
                formHeaderFlag("BahrainFlag")
                formHeaderFlag("Saudi ArabiaFlag")
                formHeaderFlag("AustraliaFlag")
                formHeaderFlag("JapanFlag")
                formHeaderFlag("ChinaFlag")
            }
            .frame(width: 180, alignment: .trailing)
        }
    }
    
    private var tableHeader: some View {
        HStack(spacing: 0) {
            
            // Position Column
            Text("#")
                .font(.custom("SFPro-ExpandedBold", size: 14))
                .foregroundColor(.white.opacity(0.6))
                .frame(width: 45)
                .padding(.leading, 8)
            
            // Driver Column
            Text("Driver")
                .font(.custom("SFPro-ExpandedBold", size: 14))
                .foregroundColor(.white.opacity(0.6))
                .padding(.leading, 4)
                .frame(width: 140, alignment: .leading)
            
            Spacer()
            
            headerTrailingContent
                .padding(.trailing, 12)
        }
        .padding(.horizontal, 10)
    }

    private func formHeaderFlag(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .frame(width: 32, height: 32)
            .clipShape(Circle())
    }
    
    private func headerStat(_ label: String, width: CGFloat? = nil) -> some View {
        Text(label)
            .font(.custom("SFPro-ExpandedBold", size: 12))
            .foregroundColor(.white.opacity(0.6))
            .frame(width: width, alignment: .center)
    }
    
    // MARK: - Filter UI
    private var tableFilter: some View {
        HStack(spacing: 0) {
            ForEach(DriverTableMode.allCases, id: \.self) { mode in
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        tableMode = mode
                    }
                } label: {
                    VStack(spacing: 6) {
                        Text(mode.rawValue.uppercased())
                            .font(.custom("SFPro-ExpandedMedium", size: 12))
                            .foregroundColor(tableMode == mode ? .white : .gray)
                        
                        Capsule()
                            .fill(tableMode == mode ? .white : .clear)
                            .frame(height: 2)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DriverStandingsRow: View {
    let driverName: String
    let driverNumber: Int
    let position: Int
    let points: Int
    let teamColor: Color
    let mode: DriverTableMode
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Position
            Text("\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(.white)
                .frame(width: 45)
                .padding(.leading, 8)
            
            // Driver Image
            Image(driverName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60, alignment: .top)
                .clipped()
                .cornerRadius(6)
                .padding(.leading, 4)
            
            // Name
            VStack(alignment: .leading, spacing: -2) {
                
                if mode == .short {
                    
                    Text(driverName.split(separator: " ").dropLast().joined(separator: " "))
                        .font(.custom("SFPro-ExpandedMedium", size: 10))
                        .foregroundColor(.white.opacity(0.7))
                        .lineLimit(1)
                    
                    Text(driverName.split(separator: " ").last?.uppercased() ?? "")
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                } else {
                    
                    // First Name
                    Text(driverName.split(separator: " ").first ?? "")
                        .font(.custom("SFPro-ExpandedMedium", size: 10))
                        .foregroundColor(.white.opacity(0.7))
                        .lineLimit(1)
                    
                    // 3-Letter Code
                    Text(driverCode)
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)
                        .tracking(1.5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .layoutPriority(0)
            
            Spacer(minLength: 8)
        }
        .frame(height: rowHeight)
        .background(rowBackground)
        .padding(.horizontal, 10)
        .animation(.easeInOut(duration: 0.25), value: mode)
    }
    
    private var driverCode: String {
        let components = driverName.split(separator: " ")
        guard let last = components.last else { return "" }
        return last.prefix(3).uppercased()
    }
    
    // MARK: - Background
    private var rowBackground: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                UnevenRoundedRectangle(topLeadingRadius: 12, bottomLeadingRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [teamColor, teamColor.opacity(0.7), .clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: mode == .full ? geo.size.width : geo.size.width * 0.85)
            }
        }
    }
    
    // MARK: - Row Height
    private var rowHeight: CGFloat {
        switch mode {
        case .short: return 60
        case .full: return 60
        case .form: return 60
        }
    }
}

#Preview {
    DriverStandingsView()
}
