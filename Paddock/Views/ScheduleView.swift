//
//  ScheduleView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI

struct ScheduleView: View {
    @State private var activeTab1: TabBar = .previous
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 20) {
            // Title
            HStack {
                Text("Schedule")
                    .font(.custom("SFPro-ExpandedBold", size: 35))
                    .foregroundColor(.adaptiveText)
                    .padding(.leading)
                Spacer()
            }

            // Tab Bar with red capsule animation
            Tabbar(.gray)
                .overlay {
                    GeometryReader { geo in
                        let width = geo.size.width
                        let tabCount = CGFloat(TabBar.allCases.count)
                        let capsuleWidth = width / tabCount
                        let index = CGFloat(TabBar.allCases.firstIndex(of: activeTab1) ?? 0)

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
                .background(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding([.horizontal, .top], 15)

            // Tab View (Content)
            TabView(selection: $activeTab1) {
                ForEach(TabBar.allCases, id: \.self) { tab in
                    tab.view
                        .tag(tab)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .ignoresSafeArea(edges: .bottom)
    }

    @ViewBuilder
    func Tabbar(_ tint: Color, _ weight: Font.Weight = .regular) -> some View {
        HStack(spacing: 0) {
            ForEach(TabBar.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .font(.callout)
                    .fontWeight(weight)
                    .foregroundStyle(tint)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                            activeTab1 = tab
                        }
                    }
            }
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
    
    deinit {
        remove()
    }
    
    func observe() {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return
        }

        guard let collectionView, !isObserving else { return }
        collectionView.addObserver(self, forKeyPath: "contentOffset", context: nil)
        isObserving = true
    }
    
    func remove() {
        isObserving = false
        collectionView?.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset",
           let collectionView = object as? UICollectionView {
            offset = collectionView.contentOffset.x
        }
    }
}

struct FindCollectionView: UIViewRepresentable {
    var result: (UICollectionView) -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if let collectionView = view.collectionSuperView {
                result(collectionView)
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension UIView {
    // Finding the CollectionView by traversing the superview
    var collectionSuperView: UICollectionView? {
        if let collectionView = superview as? UICollectionView {
            return collectionView
        }
        
        return superview?.collectionSuperView
    }
}
