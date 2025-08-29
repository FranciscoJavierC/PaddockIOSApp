//
//  ProfileCardView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/31/25.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            // Top section: Name & Team Logo
            HStack(alignment: .center, spacing: 8) {
                Text("Oscar Piastri")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .foregroundColor(.white)
                
                Image("AustrailianFlag")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 25)
                    .cornerRadius(20)
            }
            .padding(.top, 10)
            
            // Thin dashed line
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                .foregroundColor(.white.opacity(0.4))
                .frame(height: 1)
            
            // Bottom section: Position & Points
            HStack {
                Text("Pos. 1")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("284 pts")
                    .font(.custom("SFPro-ExpandedBold", size: 16))
                    .foregroundColor(.white)
            }
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
}

#Preview {
    ProfileCardView()
}
