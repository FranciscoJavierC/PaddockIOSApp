//
//  TabView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

struct TabView: View {
    // View Properties
    @State private var tabs: [TabModel] = [
        .init(id: TabModel.Tab.Previous),
        .init(id: TabModel.Tab.Upcoming)
    ]
    
    @State private var activeTab: TabModel.Tab = .Previous
    @State private var tabBarScrollState: TabModel.Tab?
    @State private var mainViewScrollState: TabModel.Tab?
    @State private var progress: CGFloat = .zero
    var body: some View {
        VStack(spacing: 0) {
            CustomTabBar()
            
            // Main View
            GeometryReader {
                let size = $0.size
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        // Individual Tab Views
                        ForEach(tabs) { tab in
                            Group {
                                switch tab.id {
                                case .Previous:
                                    RaceCardView() // This could be your previous races card view
                                case .Upcoming:
                                    RaceCardView() // You can also create another view like `UpcomingCardView()` if needed
                                }
                            }
                            .frame(width: size.width, height: size.height)
                            .contentShape(.rect)
                        }
                    }
                    .scrollTargetLayout()
                    .rect { rect in
                        progress = -rect.minX / size.width
                    }
                }
                .scrollPosition(id: $mainViewScrollState)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .onChange(of: mainViewScrollState) { oldValue, newValue in
                    if let newValue {
                        withAnimation(.snappy) {
                            tabBarScrollState = newValue
                            activeTab = newValue
                        }
                    }
                }
            }
        }
    }
    @ViewBuilder
    func CustomTabBar() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach($tabs) { $tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            activeTab = tab.id
                            tabBarScrollState = tab.id
                            mainViewScrollState = tab.id
                        }
                    }) {
                        Text(tab.id.rawValue)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 50)
                            .foregroundStyle(activeTab == tab.id ? Color.primary : Color.gray)
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .rect { rect in
                        tab.size = rect.size
                        tab.minX = rect.minX
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: .init(get: {
            return tabBarScrollState
        }, set: { _ in
            
        }), anchor: .center)
        .safeAreaPadding(.horizontal, 15)
        .overlay(alignment: .bottom) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 1)
                
                let inputRange = tabs.indices.compactMap { return CGFloat($0) }
                let outputRange = tabs.compactMap { return $0.size.width }
                let outputPositionRange = tabs.compactMap { return $0.minX }
                let indicatorWidth = progress.interpolate(inputRange: inputRange, outputRange: outputRange)
                let indicatorPosition = progress.interpolate(inputRange: inputRange, outputRange: outputPositionRange)
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: indicatorWidth, height: 1.5)
                    .offset(x: indicatorPosition)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
