//
//  ContentView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

enum AppTab: String, CaseIterable, FloatingTabProtocol {
    case home = "Home"
    case schedule = "Schedule"
    case garage = "Garage"
    case more = "More"
    
    var symbolImage: String {
        switch self {
        case .home: "house"
        case .schedule: "calendar"
        case .garage: "car.fill"
        case .more: "ellipsis"
        }
    }
}

struct ContentView: View {
    @State private var activeTab: AppTab = .home
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Tab Bar
                FloatingTabView(selection: $activeTab) { tab, tabBarHeight in
                    // TabViwes
                    switch tab {
                    case .home: HomeView()
                    case .schedule: ScheduleView()
                    case .garage: GarageView()
                    case .more: MoreView()
                    }
                }
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
