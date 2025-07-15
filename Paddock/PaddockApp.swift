//
//  PaddockApp.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/5/25.
//

import SwiftUI

@main
struct PaddockApp: App {
    var body: some Scene {
        WindowGroup {
            ThemeSwitcher {
                ContentView()
            }
        }
    }
}
