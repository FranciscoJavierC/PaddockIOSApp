//
//  RacePosterCard.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/6/25.
//

import SwiftUI

// Race Poster Card Model
struct RacePosterCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var image: String
}

// Sample Cards
var racePosterCards: [RacePosterCard] = [
    .init(title: "Monaco Grand Prix", image: "MonacoGP"),
    .init(title: "British Grand Prix", image: "BritishGP"),
    .init(title: "Las Vegas Grand Prix", image: "LasVegasGP"),
]

