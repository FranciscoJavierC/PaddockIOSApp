//
//  StandingsTab.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/12/25.
//

import SwiftUI

enum StandingsBar: String, CaseIterable, Hashable {
    case drivers = "Drivers"
    case constructors = "Constructors"
    
    @ViewBuilder
    func view(hasFloatingTabBar: Bool) -> some View {
        switch self {
        case .drivers:
            DriverStandingsView(hasFloatingTabBar: hasFloatingTabBar)
        case .constructors:
            ConstructorStandingsView(hasFloatingTabBar: hasFloatingTabBar)
        }
    }
}
