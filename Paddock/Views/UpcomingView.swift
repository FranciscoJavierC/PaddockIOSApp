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
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 400)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)
                        .overlay(
                            Image("AustrailianGP")
                        )
                    
                    Text("Race Starts in")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 170)
                        .padding(.top, 170)
                    
                    Text("01 16 46")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 240)
                        .padding(.top, 250)
                    
                    Text("Days Hours Minutes")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 90)
                        .padding(.top, 320)

                    HStack {
                        // Text content on the left
                        VStack(alignment: .leading) {
                            Text("Round 1")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text("Australian GP")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Melbourne")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .padding(.leading, 150)
                        .padding(.bottom, 280)

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
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 120)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                    HStack(spacing: 12) {
                        // 1. Flag Circle
                        Image("AustrailianFlag")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .padding(.leading, 40)

                        // 2. Race Info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Round 1")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                            Text("Australian GP")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Melbourne")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        // 3. Circuit Image
                        Image("AustrailianGP")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)

                        // 4. Date Box
                        VStack(spacing: 2) {
                            Text("13-15")
                                .font(.caption)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.caption)
                        }
                        .foregroundColor(.red)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.trailing, 40)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 120)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                    HStack(spacing: 12) {
                        // 1. Flag Circle
                        Image("AustrailianFlag")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .padding(.leading, 40)

                        // 2. Race Info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Round 1")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                            Text("Australian GP")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Melbourne")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        // 3. Circuit Image
                        Image("AustrailianGP")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)

                        // 4. Date Box
                        VStack(spacing: 2) {
                            Text("13-15")
                                .font(.caption)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.caption)
                        }
                        .foregroundColor(.red)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.trailing, 40)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 120)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 3)

                    HStack(spacing: 12) {
                        // 1. Flag Circle
                        Image("AustrailianFlag")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .padding(.leading, 40)

                        // 2. Race Info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Round 1")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                            Text("Australian GP")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Melbourne")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        // 3. Circuit Image
                        Image("AustrailianGP")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)

                        // 4. Date Box
                        VStack(spacing: 2) {
                            Text("13-15")
                                .font(.caption)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.caption)
                        }
                        .foregroundColor(.red)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.trailing, 40)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 400, height: 120)
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)

                    HStack(spacing: 12) {
                        // 1. Flag Circle
                        Image("AustrailianFlag")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .padding(.leading, 40)

                        // 2. Race Info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Round 1")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                            Text("Australian GP")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Melbourne")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        // 3. Circuit Image
                        Image("AustrailianGP")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)

                        // 4. Date Box
                        VStack(spacing: 2) {
                            Text("13-15")
                                .font(.caption)
                                .fontWeight(.bold)
                            Text("MAR")
                                .font(.caption)
                        }
                        .foregroundColor(.red)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.trailing, 40)
                    }
                }
            }
        }
        .padding(.vertical, -10)
        .safeAreaInset(edge: .top, spacing: 0) {
                    Color.clear.frame(height: 10)
                }
        .safeAreaPadding(.bottom, 60)
    }
}

#Preview {
    UpcomingView()
}
