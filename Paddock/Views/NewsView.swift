import SwiftUI

struct NewsView: View {
    // 1. Read the environment color scheme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("News")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.adaptiveText)
                    .padding(.leading)
                Spacer()
            }

            ScrollView {
                LazyVStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            // 2. Change the fill color based on the colorScheme
                            .fill(colorScheme == .dark ? Color.black : Color.white)
                            .shadow(color: colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
                        VStack(alignment: .leading, spacing: 12) {
                            Image("NewsHulk")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 220)
                                .clipped()
                                .cornerRadius(16)

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Nico Hulkenberg celebrates his maiden F1 podium at British Grand Prix at Silverstone")
                                    .foregroundStyle(.red) // This remains red
                                    .font(.headline)

                                HStack(spacing: 8) {
                                    Image("F1Logo")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .clipShape(Circle())
                                    Text("Formula 1 • 18 min ago")
                                        .font(.caption)
                                        // 3. Use .primary or .secondary for adaptive text colors
                                        .foregroundStyle(.secondary) // .gray might be too light/dark depending on mode
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                        .padding()
                    }
                    .padding(.horizontal)

                    // 📰 Smaller News Cards
                    ForEach(0..<4) { _ in
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                // 4. Change the fill color for smaller cards too
                                .fill(colorScheme == .dark ? Color.black : Color.white)
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
                                        .foregroundStyle(.red) // This remains red
                                        .lineLimit(3)

                                    HStack(spacing: 8) {
                                        Image("F1Logo")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .clipShape(Circle())
                                        Text("Formula 1 • 18 min ago")
                                            .font(.caption)
                                            // 5. Use .primary or .secondary for adaptive text colors
                                            .foregroundStyle(.secondary) // .gray might be too light/dark depending on mode
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
            .safeAreaPadding(.bottom, 30)
        }
    }
}

#Preview {
    ContentView()
}
