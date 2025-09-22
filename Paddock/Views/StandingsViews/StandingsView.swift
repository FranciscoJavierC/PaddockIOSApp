//
//  StandingsView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/10/25.
//

import SwiftUI

struct StandingsView: View {
    @State private var activeTab: StandingsBar = .drivers
    @Environment(\.colorScheme) var colorScheme
    
    // For legacy swipeable capsule implementation
    @State private var pageObserver = PageOffsetObserver()
    
    init() {
        // Selected segment color for iOS 26+
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        
        // Custom font
        let font = UIFont(name: "SFPro-ExpandedBold", size: 13)!
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font, .foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font, .foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        if #available(iOS 26, *) {
            VStack(spacing: 0) {
                // Title
                HStack {
                    Text("Standings")
                        .font(.custom("SFPro-ExpandedBold", size: 35))
                        .foregroundColor(.adaptiveText)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.vertical, 10)
                
                // Segmented Picker for top tabs
                Picker("", selection: $activeTab) {
                    ForEach(StandingsBar.allCases, id: \.self) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 15)
                
                Spacer()
                
                // Swipeable pages
                TabView(selection: $activeTab) {
                    DriverStandingsView()
                        .tag(StandingsBar.drivers)
                    ConstructorStandingsView()
                        .tag(StandingsBar.constructors)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            .ignoresSafeArea(edges: .bottom)
        } else {
            // Legacy capsule-based implementation
            LegacyStandingsView(
                activeTab: $activeTab,
                pageObserver: pageObserver
            )
        }
    }
}

#Preview {
    StandingsView()
}

/// Legacy capsule tab bar implementation
struct LegacyStandingsView: View {
    @Binding var activeTab: StandingsBar
    @State var pageObserver: PageOffsetObserver
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 15) {
            // Title
            HStack {
                Text("Standings")
                    .font(.custom("SFPro-ExpandedBold", size: 35))
                    .foregroundColor(.adaptiveText)
                    .padding(.leading)
                Spacer()
            }
            
            // Custom Capsule Tab Bar
            Tabbar(.gray)
                .overlay {
                    GeometryReader { geo in
                        let width = geo.size.width
                        let tabCount = CGFloat(StandingsBar.allCases.count)
                        let capsuleWidth = width / tabCount
                        let index = CGFloat(StandingsBar.allCases.firstIndex(of: activeTab) ?? 0)
                        
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(.red)
                                .frame(width: capsuleWidth)
                                .offset(x: index * capsuleWidth)
                            
                            Tabbar(.white, .semibold)
                                .mask(alignment: .leading) {
                                    Capsule()
                                        .frame(width: capsuleWidth)
                                        .offset(x: index * capsuleWidth)
                                }
                        }
                    }
                }
                .background(.ultraThickMaterial)
                .clipShape(.capsule)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding([.horizontal, .top], 15)
            
            // Swipeable pages
            TabView(selection: $activeTab) {
                ForEach(StandingsBar.allCases, id: \.self) { tab in
                    tab.view()
                        .tag(tab)
                        .background(
                            FindCollectionView { collectionView in
                                pageObserver.collectionView = collectionView
                                pageObserver.observe()
                            }
                        )
                }
            }
            .tabViewStyle(.tabBarOnly)
            .onChange(of: pageObserver.offset) { _, newOffset in
                if let cv = pageObserver.collectionView {
                    let pageWidth = cv.bounds.width
                    guard pageWidth > 0 else { return }
                    
                    let pageIndex = Int((newOffset / pageWidth).rounded())
                    if let safeIndex = StandingsBar.allCases[safe: pageIndex] {
                        if activeTab != safeIndex {
                            activeTab = safeIndex
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    // Custom Capsule Tab Bar
    @ViewBuilder
    func Tabbar(_ tint: Color, _ weight: Font.Weight = .regular) -> some View {
        HStack(spacing: 0) {
            ForEach(StandingsBar.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .foregroundStyle(tint)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                            activeTab = tab
                        }
                    }
            }
        }
    }
}
