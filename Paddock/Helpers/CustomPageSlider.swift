//
//  CustomPageSlider.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/6/25.
//

import SwiftUI

// Paging Slider Data Model
struct RacingPoster: Identifiable {
    private(set) var id: UUID = .init()
    var image: String
}

// Custom View
struct CustomPageSlider<Content: View, TitleContent: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    // Customizaion properties
    var showsIndicator: ScrollIndicatorVisibility = .hidden
    var showPagingControl: Bool = true
    var pagingControlSpacing: CGFloat = 20
    var spacing: CGFloat = 10
    
    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    @ViewBuilder var titleContent: (Binding<Item.Element>) -> TitleContent
    
    var body: some View {
        VStack(spacing: pagingControlSpacing) {
            ScrollView(.horizontal) {
                HStack(spacing: spacing) {
                    ForEach($data) { item in
                        VStack(spacing: 0) {
                            titleContent(item)
                            
                            content(item)
                        }
                    }
                }
                // Adding Paging
                .scrollTargetLayout()
            }
            .scrollIndicators(showsIndicator)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    ContentView()
}
