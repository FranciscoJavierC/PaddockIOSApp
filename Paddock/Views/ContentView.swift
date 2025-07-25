import SwiftUI

struct ContentView: View {
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    @State private var searchText: String = ""
    @State private var activeTab: TabItem = .schedule
    @State private var showSearch: Bool = false
    
    

    var body: some View {
        ThemeSwitcher {
            if #available(iOS 26, *) {
                TabView {
                    Tab("Schedule", systemImage: "calendar") {
                        ScheduleView(hasFloatingTabBar: false)
                    }

                    Tab("Standings", systemImage: "trophy") {
                        StandingsView(hasFloatingTabBar: false)
                    }

                    Tab("News", systemImage: "newspaper") {
                        NewsView()
                    }

                    Tab("Settings", systemImage: "gearshape") {
                        SettingsView(appTheme: $appTheme)
                    }

                    Tab("Search", systemImage: "magnifyingglass", role: .search) {
                        NavigationStack {
                                SearchView()
                            }
                    }
                }
                .tabBarMinimizeBehavior(.onScrollDown)
                .tint(.red)
            } else {
                // Use the old style for pre-iOS 26
                CloneTabView()
            }
        }
    }

    @ViewBuilder
    func CloneTabView() -> some View {
        ZStack(alignment: .bottom) {
            // Switch views normally
            Group {
                switch activeTab {
                case .schedule:
                    ScheduleView(hasFloatingTabBar: true)
                case .standings:
                    StandingsView(hasFloatingTabBar: true)
                case .news:
                    NewsView()
                case .settings:
                    SettingsView(appTheme: $appTheme)
                default:
                    EmptyView() // no .search here
                }
            }

            if showSearch {
                NavigationStack {
                    SearchView()
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                }
            }

            FloatingTabView(
                showSearchBar: true,
                activeTab: $activeTab,
                onSearchBarExpanded: { _ in },
                onSearchTextChanged: { searchText = $0 },
                showSearch: $showSearch  // ✅ Pass it down
            )
        }
    }
}

#Preview {
    ContentView()
}
