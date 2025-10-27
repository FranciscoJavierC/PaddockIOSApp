import SwiftUI

/// A view that adds a gradient over an image to improve legibility for a text overlay.
struct ReadabilityRoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .black.opacity(0.45), location: 0.0),
                        .init(color: .black.opacity(0.25), location: 0.35),
                        .init(color: .black.opacity(0.10), location: 0.65),
                        .init(color: .clear, location: 1.0)
                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .frame(maxHeight: .infinity)
            .clipped()
    }
}

