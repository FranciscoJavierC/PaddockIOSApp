//
//  ContentView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    // View properties
    @State private var activeTab: FloatingTab = .schedule
    
    @State private var isTabBarHidden: Bool = false
    var body: some View {
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
                                SettingsView()
                                    .toolbarVisibility(.hidden, for: .tabBar)
                            }
                        }
                    } else {
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
                            
                            SettingsView()
                                .tag(FloatingTab.settings)
                        }
                    }
                }
                FloatingTabView(activeTab: $activeTab)
            }
    }
}

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
