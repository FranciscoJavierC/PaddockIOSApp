//
//  ConstructorStandings.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/12/25.
//

import SwiftUI

struct ConstructorStandingsView: View {
    @StateObject private var viewModel = ConstructorStandingsModel()
    @State private var selectedConstructor: ConstructorStandings? = nil
    @State private var showDetail = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) { // Tighter timing tower spacing
                ForEach(viewModel.constructors) { constructor in
                    ConstructorStandingsRow(
                        constructorName: constructor.ConstructorName,
                        position: constructor.Position,
                        points: Int(constructor.Points),
                        constructorLogo: "\(constructor.ConstructorName)",
                        constructorColor: constructor.TeamColor
                    )
                    .onTapGesture {
                        selectedConstructor = constructor
                        showDetail = true
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
}

struct ConstructorStandingsRow: View {
    let constructorName: String
    let position: Int
    let points: Int
    let constructorLogo: String
    let constructorColor: Color

    var body: some View {
        HStack(spacing: 0) {
            // 1. Position Block
            Text("\(position)")
                .font(.custom("SFPro-ExpandedBold", size: 18))
                .foregroundColor(.white)
                .frame(width: 45) // Slightly wider for double-digits
                .padding(.leading, 8)
            
            // 2. Team Logo (Transparent background, sits on row gradient)
            ZStack {
                Image(constructorLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
            .frame(width: 50)
            .padding(.trailing, 12)
            
            // 3. Team Name
            Text(constructorName)
                .font(.custom("SFPro-ExpandedBold", size: 15))
                .foregroundColor(.white)
            
            Spacer()
            
            // 4. Points
            Text("\(points)")
                .font(.custom("SFPro-ExpandedBold", size: 17))
                .foregroundColor(.white)
                .padding(.trailing, 16)
        }
        .frame(height: 70)
        .background(
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    // 🏎️ 30% Team Color Gradient
                    UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [constructorColor, constructorColor.opacity(0.7), .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * 0.8) // Exactly 30% of the row width
                }
            }
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    ConstructorStandingsView()
}
