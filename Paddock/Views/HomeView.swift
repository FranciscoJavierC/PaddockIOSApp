//
//  HomeView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
                    // Scrollable Tabs
                    ScrollTabView()
                    
                    // Driver Standings
                    VStack(alignment: .leading, spacing: 15) {
                        Text("2025 Driver Standings")
                            .font(.title2)
                            .bold()
                        Text("1: Oscar Piastri")
                        Text("2: Lando Norris")
                        Text("3: Max Verstappen")
                    }
                    
                    // Constructor Standings
                    VStack(alignment: .leading, spacing: 15) {
                        Text("2025 Constructor Standings")
                            .font(.title2)
                            .bold()
                        Text("1: Mercedes")
                        Text("2: Red Bull Racing")
                        Text("3: McLaren")
                    }
                }
                .padding()
            }
    }

#Preview {
    HomeView()
}
