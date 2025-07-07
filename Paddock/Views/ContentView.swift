//
//  ContentView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Scrollble Tabs
                TabView()
                
                // Driver Standings Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("2025 Driver Standings")
                        .font(.title2)
                        .bold()
                    Text("1: Oscar Piastri")
                    Text("2: Lando Norris")
                    Text("3: Max Verstappen")
                }
                
                // Constructor Standings Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("2025 Constructor Standings")
                        .font(.title2)
                        .bold()
                    Text("1: Mercedes")
                    Text("2: Red Bull Racing")
                    Text("3: McLaren")
                }
                
                // 
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Paddock")
                        .font(.system(size: 30, weight: .bold))
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // To do
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
