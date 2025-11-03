//
//  FloatingTab.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/10/25.
//

import SwiftUI

enum FloatingTab: String, CaseIterable {
    case home = "house"
    case schedule = "calendar"
    case standings = "trophy"
    case news = "newspaper"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home: "Home"
        case .schedule: "Schedule"
        case .standings: "Standings"
        case .news: "News"
        case .settings: "Settings"
        }
    }
}
