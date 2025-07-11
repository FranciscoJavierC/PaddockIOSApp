//
//  FloatingTab.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/10/25.
//

import SwiftUI

enum FloatingTab: String, CaseIterable {
    case schedule = "calendar"
    case standings = "trophy"
    case news = "newspaper"
    case more = "line.3.horizontal"
    
    var title: String {
        switch self {
        case .schedule: "Schedule"
        case .standings: "Standings"
        case .news: "News"
        case .more: "More"
        }
    }
}
