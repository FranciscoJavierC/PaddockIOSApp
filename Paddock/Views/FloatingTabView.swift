//
//  FloatingTabView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case schedule = "Schedule"
    case standings = "Standings"
    case news = "News"
    case settings = "Settings"
    case search = "Search"
    
    var symbol: String {
        switch self {
        case .schedule:
            return "calendar"
        case .standings:
            return "trophy"
        case .news:
            return "newspaper"
        case .settings:
            return "gearshape"
        case .search:
            return ""
        }
    }
    
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
}

struct FloatingTabView: View {
    var showSearchBar: Bool = false
    @Binding var activeTab: TabItem
    var onSearchBarExpanded: (Bool) -> ()
    var onSearchTextChanged: (String) -> ()
    @Binding var showSearch: Bool
    // View properties
    @GestureState private var isActive: Bool = false
    @State private var isInitialOffsetSet: Bool = false
    @State private var dragOffset: CGFloat = 0
    @State private var lastDragOffset: CGFloat?
    // Search Bar properties
    @State private var searchText: String = ""
    @State private var isSearchExpanded: Bool = false
    @FocusState private var isKeyboardActive: Bool
    var body: some View {
        GeometryReader {
            let size = $0.size
            let tabs = TabItem.allCases.prefix(showSearchBar ? 4 : 5)
            let tabItemWidth = max(min(size.width / CGFloat(tabs.count + (showSearchBar ? 1 : 0)),
                                      90), 60)
            let tabItemHeight: CGFloat = 56
            
            ZStack {
                if isInitialOffsetSet {
                    let mainLayout = isKeyboardActive ? AnyLayout(ZStackLayout()) : AnyLayout(HStackLayout(spacing: 12))
                    
                    mainLayout {
                        let tabLayout = isSearchExpanded ? AnyLayout(ZStackLayout()) : AnyLayout(HStackLayout(spacing: 0))
                        
                        tabLayout {
                            ForEach(tabs, id: \.rawValue) { tab in
                                TabItemView(tab,
                                            width: isSearchExpanded ? 45 : tabItemWidth,
                                            height: isSearchExpanded ? 45 : tabItemHeight
                                )
                                    .opacity(isSearchExpanded ? (activeTab == tab ? 1 : 0) : 1)
                            }
                        }
                        // Draggable active tab
                        .background(alignment: .leading) {
                            ZStack {
                                Capsule(style: .continuous)
                                    .stroke(.gray.opacity(0.25), lineWidth: 3)
                                    .opacity(isActive ? 1 : 0)
                                
                                Capsule(style: .continuous)
                                    .fill(.background)
                            }
                            .compositingGroup()
                            .frame(width: tabItemWidth, height: tabItemHeight)
                            // Scalling when drag gesture becomes active
                            .scaleEffect(isActive ? 1.3 : 1)
                            .offset(x: isSearchExpanded ? 0 : dragOffset)
                            .opacity(isSearchExpanded ? 0 : 1)
                        }
                        .padding(3)
                        .background(TabBarBackground())
                        .overlay{
                            if isSearchExpanded {
                                Capsule()
                                    .foregroundStyle(.clear)
                                    .contentShape(.capsule)
                                    .onTapGesture {
                                        withAnimation(.bouncy) {
                                            isSearchExpanded = false
                                            showSearch = false
                                        }
                                    }
                            }
                        }
                        // Hiding when keyboard is active
                        .opacity(isKeyboardActive ? 0 : 1)
                        
                        if showSearchBar {
                            ExpandableSearchBar(height: isSearchExpanded ? 45: tabItemHeight)
                        }
                    }
                    .geometryGroup()
                }
            }
            // Centering tab bar
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                guard !isInitialOffsetSet else { return }
                dragOffset = CGFloat(activeTab.index) * tabItemWidth
                isInitialOffsetSet = true
            }
        }
        .frame(height: 56)
        .padding(.horizontal, 25)
        .padding(.bottom, isKeyboardActive ? 10 : 0)
        // Animations (customize per your needs)
        .animation(.bouncy, value: dragOffset)
        .animation(.bouncy, value: isActive)
        .animation(.bouncy, value: activeTab)
        .animation(.easeInOut(duration: 0.25), value: isKeyboardActive)
        .onChange(of: isKeyboardActive) { oldValue, newValue in
            onSearchBarExpanded(newValue)
        }
        
    }
    
    // Tab item view
    @ViewBuilder
    private func TabItemView(_ tab: TabItem, width: CGFloat, height: CGFloat) -> some View {
        let tabs = TabItem.allCases.prefix(showSearchBar ? 4 : 5)
        let tabCount = tabs.count - 1

        VStack(spacing: 6) {
            Image(systemName: tab.symbol)
                .font(.title2)
                .symbolVariant(.fill)
            
            if !isSearchExpanded {
                Text(tab.rawValue)
                    .font(.caption2)
                    .lineLimit(1)
            }
        }
        .foregroundStyle(activeTab == tab ? accentColor : Color.primary)
        .frame(width: width, height: height)
        .contentShape(.capsule)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .updating($isActive, body: { _, out, _ in
                    out = true
                })
                .onChanged { value in
                    let xOffset = value.translation.width
                    if let lastDragOffset {
                        let newDragOffset = xOffset + lastDragOffset
                        dragOffset = max(min(newDragOffset, CGFloat(tabCount) * width), 0)
                    } else {
                        lastDragOffset = dragOffset
                    }
                }
                .onEnded({ value in
                    lastDragOffset = nil
                    // Identifying the landing index
                    let landingIndex = Int((dragOffset / width).rounded())
                    // Safe check
                    if tabs.indices.contains(landingIndex) {
                        dragOffset = CGFloat(landingIndex) * width
                        activeTab = tabs[landingIndex]
                    }
                })
        )
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    activeTab = tab
                    dragOffset = CGFloat(tab.index) * width
                }
        )
        .geometryGroup()
    }
    
    // Tab Bar Background View
    @ViewBuilder
    private func TabBarBackground() -> some View {
        ZStack {
            Capsule(style: .continuous)
                       .fill(.ultraThinMaterial)

           Capsule(style: .continuous)
               .stroke(Color.white.opacity(0.15), lineWidth: 1)
            
        }
        .compositingGroup()
    }
    
    // Expandable search bar
    @ViewBuilder
    private func ExpandableSearchBar(height: CGFloat) -> some View {
        let searchLayout = isKeyboardActive ? AnyLayout(HStackLayout(spacing: 12)) : AnyLayout(ZStackLayout(alignment: .trailing))
        
        searchLayout {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(isSearchExpanded ? .body : .title2)
                    .foregroundStyle(isSearchExpanded ? .gray : Color.primary)
                    .frame(width: isSearchExpanded ? nil: height, height: height)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            isSearchExpanded = true
                            showSearch = true
                        }
                    }
                    .allowsHitTesting(!isSearchExpanded)
                if isSearchExpanded {
                    TextField("Search...", text: $searchText)
                        .focused($isKeyboardActive)
                }
            }
            .padding(.horizontal, isSearchExpanded ? 15 : 0)
            .background(TabBarBackground())
            .geometryGroup()
            .zIndex(1)
            
            // Close button
            Button {
                isKeyboardActive = false
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(Color.primary)
                    .frame(width: height, height: height)
                    .background(TabBarBackground())
            }
            // Only showing when keyboard is active
            .opacity(isKeyboardActive ? 1 : 0)
        }
    }
    
    var accentColor: Color {
        .red
    }
}

#Preview {
    ContentView()
}
