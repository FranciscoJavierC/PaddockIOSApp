//
//  ScheduleView.swift
//  Paddock
//
//  Created by Francisco Cortez on 7/7/25.
//

import SwiftUI

struct ScheduleView: View {
    @State private var activeTab1: TabBar = .upcoming
    @Environment(\.colorScheme) var colorScheme
    @State private var showSearch: Bool = false
    
    // ✅ Keep track of page offset for legacy custom implementation
    @State private var pageObserver = PageOffsetObserver()
    
    init() {
        // Selected segment color
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
                
        let font = UIFont(name: "SFPro-ExpandedBold", size: 13)!
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font, .foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: font, .foregroundColor: UIColor.gray], for: .normal)
    }

    var body: some View {
        if #available(iOS 26, *) {
            // iOS 26+ native segmented top tab bar
            VStack(spacing: 0) {
                // Title
                HStack {
                    Text("Schedule")
                        .font(.custom("SFPro-ExpandedBold", size: 35))
                        .foregroundColor(.adaptiveText)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.vertical, 10)
                
                // Segmented Picker for top tabs
                Picker("", selection: $activeTab1) {
                    ForEach(TabBar.allCases, id: \.self) { tab in
                        Text(tab.rawValue)
                            .tag(tab)
                    }
                }
                .pickerStyle(.segmented)
                .controlSize(.large)
                .padding(.horizontal, 15)
                Spacer()
                
                // Swipeable pages
                TabView(selection: $activeTab1) {
                    UpcomingView()
                        .tag(TabBar.upcoming)
                    PreviousView()
                        .tag(TabBar.previous)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            .ignoresSafeArea(edges: .bottom)
        } else {
            // ✅ Legacy capsule-based implementation
            LegacyScheduleView(
                activeTab1: $activeTab1,
                pageObserver: pageObserver
            )
        }
    }
}

#Preview {
    ContentView()
}

/// Legacy capsule tab bar implementation
struct LegacyScheduleView: View {
    @Binding var activeTab1: TabBar
    @State var pageObserver: PageOffsetObserver
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 15) {
            // Title
            HStack {
                Text("Schedule")
                    .font(.custom("SFPro-ExpandedBold", size: 35))
                    .foregroundColor(.adaptiveText)
                    .padding(.leading)
                Spacer()
            }
            
            // Custom Tab Bar
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
                .background(.ultraThickMaterial)
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding([.horizontal, .top], 15)
            
            // Tab View (Swipeable)
            TabView(selection: $activeTab1) {
                ForEach(TabBar.allCases, id: \.self) { tab in
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
                    if let safeIndex = TabBar.allCases[safe: pageIndex] {
                        if activeTab1 != safeIndex {
                            activeTab1 = safeIndex
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea(edges: .bottom)
    }
    
    // Custom Capsule Tab Bar
    @ViewBuilder
    func Tabbar(_ tint: Color, _ weight: Font.Weight = .regular) -> some View {
        HStack(spacing: 0) {
            ForEach(TabBar.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
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

// MARK: - Supporting Types

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
    
    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?
    ) {
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
    func updateUIView(_ uiView: UIView, context: Context) {}
}

extension UIView {
    // Traverses up the view hierarchy to find the UICollectionView
    var collectionSuperView: UICollectionView? {
        if let collectionView = superview as? UICollectionView {
            return collectionView
        }
        return superview?.collectionSuperView
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
