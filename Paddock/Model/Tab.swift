//
//  Tab.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

enum TabBar: String, CaseIterable, Hashable {
    case previous = "Previous"
    case today = "Today"
    case upcoming = "Upcoming"
    
    @ViewBuilder
        func view(hasFloatingTabBar: Bool) -> some View {
            switch self {
            case .previous:
                PreviousView(hasFloatingTabBar: hasFloatingTabBar)
            case .today:
                TodayView()
            case .upcoming:
                UpcomingView(hasFloatingTabBar: hasFloatingTabBar)
            }
        }
}
