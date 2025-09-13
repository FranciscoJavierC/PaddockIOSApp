//
//  PaddockApp.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

@main
struct PaddockApp: App {
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear
            appearance.shadowColor = .clear

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        }

    var body: some Scene {
        WindowGroup {
            ThemeSwitcher {
                ContentView()
            }
        }
    }
}
