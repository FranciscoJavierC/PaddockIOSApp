//
//  Tab.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

enum TabBar: String, CaseIterable, Hashable {
    case previous = "Previous"
    case upcoming = "Upcoming"
    
    @ViewBuilder
        func view(hasFloatingTabBar: Bool) -> some View {
            switch self {
            case .upcoming:
                UpcomingView(hasFloatingTabBar: hasFloatingTabBar)
            case .previous:
                PreviousView(hasFloatingTabBar: hasFloatingTabBar)
            }
        }
}
