//
//  RaceCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/6/25.
//

import SwiftUI

struct RaceCardView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                HStack(spacing: 12) {
                    
                }
                // Parallax Carousel
                GeometryReader(content: {geometry in
                    let size = geometry.size
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(racePosterCards) { card in
                                // In order to move cards in reverse direction
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    let minX = proxy.frame(in: .scrollView).minX
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                                })
                                .frame(width: size.width - 60, height: size.height - 50)
                                // Scroll Animation
                                .scrollTransition(.interactive, axis: .horizontal) {
                                    view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                })
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
