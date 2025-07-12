//
//  UpcomingView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/8/25.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 270)
                        .overlay(
                            Image("AustrailianGP")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 230, alignment: .leading)
                        )
                    Text("Australian Grand Prix")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.leading, 100)
                        .padding(.top, 25)
    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 50, height: 50)

                        Text("R1")
                            .foregroundStyle(.red)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(20)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 150)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 150)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 150)
                }
            }
        }
    }
}

#Preview {
    UpcomingView()
}
