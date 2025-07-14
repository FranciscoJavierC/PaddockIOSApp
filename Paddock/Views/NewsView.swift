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
                LazyVStack(spacing: 12) {
                    Image("NewsHulk")
                        .resizable()
                        .frame(width: 400, height: 250)
                        .cornerRadius(20)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                            .foregroundStyle(.red)
                            .font(.headline)
                            .padding(.horizontal, 20)
                        
                        HStack(spacing: 8) {
                            Image("F1Logo")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Formula 1 • 18 min ago")
                                .foregroundStyle(.red)
                                .font(.subheadline)
                        }
                        .padding(.horizontal, 20)
                    }
                    HStack(alignment: .top, spacing: 12) {
                        // Left: News Image
                        Image("NewsHulk")
                            .resizable()
                            .frame(width: 150, height: 120)
                            .cornerRadius(12)
                        
                        // Right: Headline and source info
                        VStack(alignment: .leading, spacing: 35) {
                            Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                .foregroundStyle(.red)
                                .font(.headline)
                                .lineLimit(3)

                            HStack(spacing: 10) {
                                Image("F1Logo")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())

                                Text("Formula 1 • 18 min ago")
                                    .foregroundStyle(.red)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack(alignment: .top, spacing: 12) {
                        // Left: News Image
                        Image("NewsHulk")
                            .resizable()
                            .frame(width: 150, height: 120)
                            .cornerRadius(12)
                        
                        // Right: Headline and source info
                        VStack(alignment: .leading, spacing: 35) {
                            Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                .foregroundStyle(.red)
                                .font(.headline)
                                .lineLimit(3)

                            HStack(spacing: 10) {
                                Image("F1Logo")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())

                                Text("Formula 1 • 18 min ago")
                                    .foregroundStyle(.red)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack(alignment: .top, spacing: 12) {
                        // Left: News Image
                        Image("NewsHulk")
                            .resizable()
                            .frame(width: 150, height: 120)
                            .cornerRadius(12)
                        
                        // Right: Headline and source info
                        VStack(alignment: .leading, spacing: 35) {
                            Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                .foregroundStyle(.red)
                                .font(.headline)
                                .lineLimit(3)

                            HStack(spacing: 10) {
                                Image("F1Logo")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())

                                Text("Formula 1 • 18 min ago")
                                    .foregroundStyle(.red)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack(alignment: .top, spacing: 12) {
                        // Left: News Image
                        Image("NewsHulk")
                            .resizable()
                            .frame(width: 150, height: 120)
                            .cornerRadius(12)
                        
                        // Right: Headline and source info
                        VStack(alignment: .leading, spacing: 35) {
                            Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                .foregroundStyle(.red)
                                .font(.headline)
                                .lineLimit(3)

                            HStack(spacing: 10) {
                                Image("F1Logo")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())

                                Text("Formula 1 • 18 min ago")
                                    .foregroundStyle(.red)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack(alignment: .top, spacing: 12) {
                        // Left: News Image
                        Image("NewsHulk")
                            .resizable()
                            .frame(width: 150, height: 120)
                            .cornerRadius(12)
                        
                        // Right: Headline and source info
                        VStack(alignment: .leading, spacing: 35) {
                            Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                .foregroundStyle(.red)
                                .font(.headline)
                                .lineLimit(3)

                            HStack(spacing: 10) {
                                Image("F1Logo")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())

                                Text("Formula 1 • 18 min ago")
                                    .foregroundStyle(.red)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    NewsView()
}
