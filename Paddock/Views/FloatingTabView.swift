//
//  FloatingTabView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI


struct FloatingTabView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var activeTab: FloatingTab
    
    // For matched geometry effect
    @Namespace private var animation
    
    // View properties
    @State private var tabLocation: CGRect = .zero
    
    // Adaptive colors
    var activeForeground: Color {
        colorScheme == .dark ? .white : .white
    }
    
    var activeBackground: Color {
        colorScheme == .dark ? .red.opacity(0.9) : .red
    }
    
    var inactiveColor: Color {
        colorScheme == .dark ? .gray.opacity(0.7) : .gray
    }
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(FloatingTab.allCases, id: \.rawValue) { tab in
                Button {
                    activeTab = tab
                } label: {
                    HStack(spacing: 0) {
                        Image(systemName: tab.rawValue)
                            .font(.title3)
                            .frame(width: 30, height: 30)
                        
                        if activeTab == tab {
                            Text(tab.title)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(activeForeground)
                                .lineLimit(1)
                        }
                    }
                    .foregroundStyle(activeTab == tab ? activeForeground : inactiveColor)
                    .padding(.vertical, 2)
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                    .contentShape(.rect)
                    .background {
                        if activeTab == tab {
                            Capsule()
                                .fill(activeBackground.gradient)
                                .onGeometryChange(for: CGRect.self, of: {
                                    $0.frame(in: .named("TABBARVIEW"))
                                }, action: { newValue in
                                    tabLocation = newValue
                                })
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .background(alignment: .leading) {
            Capsule()
                .fill(activeBackground.gradient)
                .frame(width: tabLocation.width, height: tabLocation.height)
                .offset(x: tabLocation.minX)
        }
        .coordinateSpace(.named("TABBARVIEW"))
        .padding(.horizontal, 5)
        .frame(height: 45)
        .background(
            (colorScheme == .dark ? Color(.systemGray6) : Color(.systemBackground))
                .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
            in: .capsule
        )
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    ContentView()
}
