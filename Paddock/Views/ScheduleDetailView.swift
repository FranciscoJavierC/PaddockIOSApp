//
//  ScheduleDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 8/23/25.
//

import SwiftUI

struct ScheduleDetailView: View {
    // Example sessions, could later be model-driven
    let sessions = [
        ("Practice 1", "Fri 20 Mar, 11:00"),
        ("Practice 2", "Fri 20 Mar, 15:00"),
        ("Practice 3", "Sat 21 Mar, 12:00"),
        ("Qualifying", "Sat 21 Mar, 14:00"),
        ("Race", "Sun 22 Mar, 13:00")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Sessions list card
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(sessions, id: \.0) { session in
                        HStack {
                            Text(session.0)
                                .font(.custom("SFPro-ExpandedRegular", size: 16))
                            Spacer()
                            Text(session.1)
                                .font(.custom("SFPro-ExpandedBold", size: 16))
                        }
                        Divider().background(Color.white.opacity(0.3))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ScheduleDetailView()
}
