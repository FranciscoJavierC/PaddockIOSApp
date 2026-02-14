//
//  ConstructorStandings.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/12/25.
//

import SwiftUI

// MARK: - Table Mode Enum
enum ConstructorTableMode: String, CaseIterable {
    case short = "Short"
    case full = "Full"
    case form = "Form"
}

struct ConstructorStandingsView: View {
    
    @StateObject private var viewModel = ConstructorStandingsModel()
    @State private var selectedConstructor: ConstructorStandings? = nil
    @State private var showDetail = false
    @State private var tableMode: ConstructorTableMode = .short
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                tableFilter
                
                tableHeader
                
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.constructors) { constructor in
                        ConstructorStandingsRow(
                            constructorName: constructor.ConstructorName,
                            position: constructor.Position,
                            points: Int(constructor.Points),
                            constructorLogo: constructor.ConstructorName,
                            constructorColor: constructor.TeamColor,
                            mode: tableMode
                        )
                        .onTapGesture {
                            selectedConstructor = constructor
                            showDetail = true
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationDestination(isPresented: $showDetail) {
            if let constructor = selectedConstructor {
                ConstructorDetailView(constructor: constructor)
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
            Text("Constructor")
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
            .clipShape(RoundedRectangle(cornerRadius: 10))
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
            ForEach(ConstructorTableMode.allCases, id: \.self) { mode in
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

struct ConstructorStandingsRow: View {
    let constructorName: String
    let position: Int
    let points: Int
    let constructorLogo: String
    let constructorColor: Color
    let mode: ConstructorTableMode
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Position
            Text("\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(.white)
                .frame(width: 45)
                .padding(.leading, 8)
            
            // Logo
            Image(constructorLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .frame(width: 50)
                .padding(.trailing, 8)
            
            // Name / Code
            VStack(alignment: .leading, spacing: -2) {
                
                if mode == .short {
                    Text(constructorName)
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .foregroundColor(.white)
                        .lineLimit(1)
                } else {
                    Text(constructorCode)
                        .font(.custom("SFPro-ExpandedBold", size: 15))
                        .foregroundColor(.white)
                        .tracking(1.5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer(minLength: 8)

        }
        .frame(height: rowHeight)
        .background(rowBackground)
        .padding(.horizontal, 10)
        .animation(.easeInOut(duration: 0.25), value: mode)
    }
    
    // MARK: - Constructor Code
    private var constructorCode: String {
        let cleaned = constructorName
            .replacingOccurrences(of: "Racing", with: "")
            .replacingOccurrences(of: "Team", with: "")
        
        return cleaned
            .split(separator: " ")
            .first?
            .prefix(3)
            .uppercased() ?? ""
    }
        
    // MARK: - Background
        private var rowBackground: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                UnevenRoundedRectangle(topLeadingRadius: 12, bottomLeadingRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [constructorColor, constructorColor.opacity(0.7), .clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: mode == .full ? geo.size.width : geo.size.width * 0.85)
            }
        }
    }
    
    private var rowHeight: CGFloat {
        switch mode {
        case .short: return 60
        case .full: return 60
        case .form: return 60
        }
    }
}

#Preview {
    ConstructorStandingsView()
}
