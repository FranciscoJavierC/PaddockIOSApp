//
//  PreviousView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct PreviousView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 400)
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 50, height: 50)
                            
                                Text("R1")
                                .foregroundStyle(.red)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.leading, -170)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 400)
                }

            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

#Preview {
    PreviousView()
}
