//
//  ContentView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

enum AppTab: String, CaseIterable, FloatingTabProtocol {
    case schedule = "Schedule"
    case news = "News"
    case garage = "Garage"
    case more = "More"
    
    var symbolImage: String {
        switch self {
        case .schedule: "calendar"
        case .news: "newspaper"
        case .garage: "door.garage.double.bay.closed"
        case .more: "line.3.horizontal"
        }
    }
}

struct ContentView: View {
    @State private var activeTab: AppTab = .schedule
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Tab Bar
                FloatingTabView(selection: $activeTab) { tab, tabBarHeight in
                    // TabViwes
                    switch tab {
                    case .schedule: ScheduleView()
                    case .news: NewsView()
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
                ToolbarItem(placement: .topBarTrailing) {
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
