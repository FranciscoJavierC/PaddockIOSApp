//
//  StandingsView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/10/25.
//

import SwiftUI

struct StandingsView: View {
    @State private var activeTab: StandingsBar = .drivers
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Standings")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.red)
                    .padding(.leading)
                Spacer()
            }
            
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
                .background(.white)
                .clipShape(.capsule)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding([.horizontal, .top], 15)

            // Tab View
            TabView(selection: $activeTab) {
                ForEach(StandingsBar.allCases, id: \.self) { tab in
                    tab.view
                        .tag(tab)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }

    @ViewBuilder
    func Tabbar(_ tint: Color, _ weight: Font.Weight = .regular) -> some View {
        HStack(spacing: 0) {
            ForEach(StandingsBar.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .font(.callout)
                    .fontWeight(weight)
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

#Preview {
    StandingsView()
}
