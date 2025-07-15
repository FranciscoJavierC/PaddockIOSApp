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
                LazyVStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)

                        VStack(alignment: .leading, spacing: 12) {
                            Image("NewsHulk")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 220)
                                .clipped()
                                .cornerRadius(16)

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                    .foregroundStyle(.red)
                                    .font(.headline)

                                HStack(spacing: 8) {
                                    Image("F1Logo")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .clipShape(Circle())
                                    Text("Formula 1 • 18 min ago")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                        .padding()
                    }
                    .padding(.horizontal)

                    // 📰 Smaller News Cards
                    ForEach(0..<5) { _ in
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)

                            HStack(alignment: .top, spacing: 12) {
                                // Left image
                                Image("NewsHulk")
                                    .resizable()
                                    .frame(width: 120, height: 90)
                                    .cornerRadius(10)

                                // Right text
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Hulkenberg gets his maiden podium at Silverstone")
                                        .font(.headline)
                                        .foregroundStyle(.red)
                                        .lineLimit(3)

                                    HStack(spacing: 8) {
                                        Image("F1Logo")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .clipShape(Circle())
                                        Text("Formula 1 • 18 min ago")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                }

                                Spacer()
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    NewsView()
}
