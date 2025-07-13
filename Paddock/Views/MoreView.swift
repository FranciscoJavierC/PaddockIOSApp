//
//  MoreView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("More")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.red)
                    .padding(.leading)
                Spacer()
            }
            
            ScrollView {
                Text("More content")
            }
        }
    }
}

#Preview {
    MoreView()
}
