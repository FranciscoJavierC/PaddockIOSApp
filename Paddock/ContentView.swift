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
            Text("Hello")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Paddock")
                            .font(.system(size: 30, weight: .bold))
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // To do
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .font(.headline)
                        })
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
