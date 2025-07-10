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
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Paddock")
                        .font(.system(size: 30, weight: .bold))
                }

                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        // To do
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                    Button(action: {
                        // To do
                    }) {
                        Image(systemName: "line.3.horizontal.decrease")
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
