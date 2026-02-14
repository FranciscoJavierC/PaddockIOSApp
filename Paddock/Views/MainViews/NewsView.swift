import SwiftUI

struct NewsView: View {
    // 1. Read the environment color scheme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("News")
                    .font(.custom("SFPro-ExpandedBold", size: 35))
                    .foregroundColor(Color.white)
                    .padding(.leading)
                Spacer()
            }

            ScrollView {
                LazyVStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 160) {
                        NewsCard(newsThumbnail: "NewsHulk", newsContent: "Nico Hulkenberg celebrates his maiden F1 podium at Brtish Grand Prix.", newsSource: "Formula 1", newsSourceImage: "F1Logo")
                        
                        NewsCard(newsThumbnail: "NewsHulk", newsContent: "Nico Hulkenberg celebrates his maiden F1 podium at Brtish Grand Prix.", newsSource: "Formula 1", newsSourceImage: "F1Logo")
                        
                        NewsCard(newsThumbnail: "NewsHulk", newsContent: "Nico Hulkenberg celebrates his maiden F1 podium at Brtish Grand Prix.", newsSource: "Formula 1", newsSourceImage: "F1Logo")
                        
                        NewsCard(newsThumbnail: "NewsHulk", newsContent: "Nico Hulkenberg celebrates his maiden F1 podium at Brtish Grand Prix.", newsSource: "Formula 1", newsSourceImage: "F1Logo")
                    }
                }
            }
            .safeAreaInset(edge: .bottom, spacing: 230) {
                Color.clear.frame(height: 10)
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                Color.clear.frame(height: 10)
            }
        }
    }
}

struct NewsCard: View {
    let newsThumbnail: String
    let newsContent: String
    let newsSource: String
    let newsSourceImage: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Image
            Image(newsThumbnail)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(20)
            
            // Bottom Info Box
            VStack(alignment: .leading, spacing: 5) {
                // Top row with "Testing Round" and date
                HStack {
                    Text(newsContent)
                        .font(.custom("SFPro-ExpandedBold", size: 16))
                        .foregroundColor(.white)
                }
                .padding(.top, 10)
                
                HStack {
                    Image(newsSourceImage)
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("\(newsSource) - 18 min ago")
                        .font(.custom("SFPro-ExpandedRegular", size: 14))
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 150) // Fixed height for info box
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay( // This adds the thin border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(1.0), lineWidth: 0.5)
            )
            .offset(y: 180) // Adjust position to appear at the bottom of the card
            
        }
        .frame(height: 200) // Total height of the card
        .padding(.horizontal)
    }
}

#Preview {
    NewsView()
}
