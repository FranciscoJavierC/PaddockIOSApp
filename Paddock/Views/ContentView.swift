import SwiftUI

struct ContentView: View {
    // 1. Add @AppStorage for appTheme here. This will be the main source of truth.
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault

    // View properties (existing)
    @State private var activeTab: FloatingTab = .schedule
    @State private var isTabBarHidden: Bool = false

    var body: some View {
        // 2. Wrap your entire ZStack (which contains your TabView) with ThemeSwitcher
        ThemeSwitcher {
            ZStack(alignment: .bottom) {
                Group {
                    // Floating tab bar
                    if #available(iOS 18, *) {
                        TabView(selection: $activeTab) {
                            Tab.init(value: .schedule) {
                                ScheduleView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                            
                            Tab.init(value: .standings) {
                                StandingsView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                            
                            Tab.init(value: .news) {
                                NewsView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                            
                            Tab.init(value: .settings) {
                                // 3. Pass the appTheme binding to SettingsView
                                SettingsView(appTheme: $appTheme)
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                        }
                    } else {
                        // This block handles iOS versions before 18
                        TabView(selection: $activeTab) {
                            ScheduleView()
                                .tag(FloatingTab.schedule)
                                .background {
                                    if !isTabBarHidden {
                                        HideTabBar {
                                            print("Hidden")
                                            isTabBarHidden = true
                                        }
                                    }
                                }
                            
                            StandingsView()
                                .tag(FloatingTab.standings)
                            
                            NewsView()
                                .tag(FloatingTab.news)
                            
                            // 3. Pass the appTheme binding to SettingsView for iOS < 18
                            SettingsView(appTheme: $appTheme)
                                .tag(FloatingTab.settings)
                        }
                    }
                }
                FloatingTabView(activeTab: $activeTab)
            }
        } // End of ThemeSwitcher wrapper
    }
}

// Your existing HideTabBar and UIView extension
struct HideTabBar: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabController = view.tabController {
                tabController.tabBar.isHidden = true
                result()
            }
        }
        
        return view
    }
    
     func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: {$0 is UITabBarController }) as? UITabBarController {
            return controller
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}
