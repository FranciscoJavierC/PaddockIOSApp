//
//  ContentView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    // View properties
    @State private var items: [RacingPoster] = [
        .init(image: "/images/BritishGP.jpeg")
    ]
    var body: some View {
        
        NavigationStack {
            Text("")
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
            TabView()
                .preferredColorScheme(.light)
            CustomPageSlider(data: $items) { item in
                // Content View
                RoundedRectangle(cornerRadius: 15)
                    .fill(item.image)
                    .frame(width: 300, height: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}
