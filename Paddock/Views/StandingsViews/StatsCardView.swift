//
//  StatsCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/31/25.
//

import SwiftUI

struct StatsCardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                VStack {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
            }
            .padding()
            .padding(.bottom, 80) // so it doesn’t get cut off
        }
    }
}

#Preview {
    StatsCardView()
}
