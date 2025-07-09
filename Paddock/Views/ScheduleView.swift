//
//  ScheduleView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI

struct ScheduleView: View {
    // Tab Bar View properties
    @State private var activeTab1: TabBar = .previous
    
    var body: some View {
        VStack(spacing: 20) {
            // Tab Bar
            TabView(selection: $activeTab1) {
                ForEach(TabBar.allCases, id: \.self) { tab in
                    tab.view
                        .tag(tab)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

#Preview {
    ContentView()
}

@Observable
class PageOffsetObserver: NSObject {
    var collectionView: UICollectionView?
    var offset: CGFloat = 0
    private(set) var isObserving: Bool = false
    
    func observe() {
        
    }
    
    func remove() {
        
    }
}

struct FindCollectionView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
