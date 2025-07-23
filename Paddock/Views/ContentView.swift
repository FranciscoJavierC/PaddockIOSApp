import SwiftUI

struct ContentView: View {
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    @State private var searchText: String = ""

    var body: some View {
        ThemeSwitcher {
            if #available(iOS 26, *) {
                TabView {
                    Tab("Schedule", systemImage: "calendar") {
                        ScheduleView()
                    }

                    Tab("Standings", systemImage: "trophy") {
                        StandingsView()
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
                LegacyTabView()
            }
        }
    }

    @ViewBuilder
    func LegacyTabView() -> some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }

            StandingsView()
                .tabItem {
                    Label("Standings", systemImage: "trophy")
                }

            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }

            SettingsView(appTheme: $appTheme)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }

           SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
}
