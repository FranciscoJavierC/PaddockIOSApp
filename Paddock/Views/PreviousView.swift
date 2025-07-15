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
                        .overlay(
                            Image("AustrailianGP")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding(.top, 300)
                                .padding(.leading, 200)
                        )
                    
                    HStack {
                        VStack {
                            Text("2nd")
                                .foregroundStyle(.white)
                            Text("Lando")
                                .foregroundStyle(.white)
                            Text("Norris")
                                .foregroundStyle(.white)
                            Text("McLaren")
                                .foregroundStyle(.white)
                        }
                        VStack {
                            Text("1st")
                                .foregroundStyle(.white)
                            Text("Lando")
                                .foregroundStyle(.white)
                            Text("Norris")
                                .foregroundStyle(.white)
                            Text("McLaren")
                                .foregroundStyle(.white)
                        }
                        VStack {
                            Text("3rd")
                                .foregroundStyle(.white)
                            Text("Lando")
                                .foregroundStyle(.white)
                            Text("Norris")
                                .foregroundStyle(.white)
                            Text("McLaren")
                                .foregroundStyle(.white)
                        }
                    }

                    HStack {
                        // Text content on the left
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Round 1")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Text("Austrailian GP")
                                .foregroundStyle(.white)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Melbourne")
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        .padding(.leading, 50)
                        .padding(.top, 260)

                        Spacer()

                        // Date box on the right
                        VStack(spacing: 4) {
                            Text("13-15")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.title2)
                        }
                        .foregroundColor(.red)
                        .frame(width: 80, height: 80)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.trailing, 30)
                        .padding(.bottom, 280)
                        
                        VStack(spacing: 4) {
                            Image("AustrailianFlag")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, style: StrokeStyle(lineWidth: 4)))
                        }
                        .padding(.leading, -400)
                        .padding(.top, -180)
                    }
                }            }
        }
        .safeAreaPadding(.bottom, 60)
    }
}

#Preview {
    PreviousView()
}
