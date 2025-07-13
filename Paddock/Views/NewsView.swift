//
//  HomeView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/7/25.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("News")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.red)
                    .padding(.leading)
                Spacer()
            }
            
            ScrollView {
                Text("News content")
            }
        }
    }
}

#Preview {
    NewsView()
}
