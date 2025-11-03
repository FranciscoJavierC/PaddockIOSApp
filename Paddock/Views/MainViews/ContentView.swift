import SwiftUI 

struct ContentView: View {
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    @State private var searchText: String = ""
    @State private var activeTab: TabItem = .home
    @State private var standingsTab: StandingsBar = .drivers
    @State private var showSearch: Bool = false
    
    var body: some View {
        if #available(iOS 26, *) {
            TabView(selection: $activeTab) {   // 👈 Bind selection
                Tab("Home", systemImage: "house", value: TabItem.home) {
                    HomeView(activeTab: $activeTab)
                }
                
                Tab("Schedule", systemImage: "calendar", value: TabItem.schedule) {
                    NavigationStack {
                        ScheduleView()
                    }
                }

                Tab("Standings", systemImage: "trophy", value: TabItem.standings) {
                    NavigationStack {
                        StandingsView()
                    }
                }

                Tab("News", systemImage: "newspaper", value: TabItem.news) {
                    NavigationStack {
                        NewsView()
                    }
                }

                Tab("Search", systemImage: "magnifyingglass", value: TabItem.search, role: .search) {
                    SearchView()
                }
            }
            .tint(.red)
            .tabBarMinimizeBehavior(.onScrollDown)
        } else {
            NavigationStack {
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
                    ScheduleView()
                case .standings:
                    StandingsView()
                case .news:
                    NewsView()
                case .settings:
                    SettingsView(appTheme: appTheme)
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
    
    @ViewBuilder
    func CoutdownInfo(_ size: CGSize) -> some View {
        HStack(spacing: 12) {
            Image("AustrailianFlag")
            .resizable()
            .cornerRadius(5)
            .frame(width: size.width, height: size.height)
        

            VStack(alignment: .leading, spacing: 2) {
                Text("Australian GP")
                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                    .fontWeight(.semibold)

                HStack(spacing: 6) {
                    Circle()
                        .fill(.red)
                        .frame(width: 8, height: 8)
                        .overlay(
                            Circle()
                                .stroke(Color.red.opacity(0.6), lineWidth: 2)
                                .scaleEffect(1.5)
                                .opacity(0.6)
                        )
                        .animation(
                            .easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: UUID()
                        )

                    Text("Live • Practice 1")
                        .font(.custom("SFPro-ExpandedRegular", size: 13))
                        .foregroundColor(.red)
                        .bold()
                }
            }
        }
    }
    
    @ViewBuilder
    func MiniCoutdown() -> some View {
        HStack(spacing: 15) {
            CoutdownInfo(.init(width: 30, height: 30))
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ContentView()
}
