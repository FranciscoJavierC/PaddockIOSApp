import SwiftUI

struct OverlayDebugFile: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - Header
                    ZStack(alignment: .bottom) {
                        Image("AustrailianFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 220)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                        
                        // Subtle top gradient for legibility over the image
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.35), .clear]),
                            startPoint: .top,
                            endPoint: .center
                        )
                        .ignoresSafeArea(edges: .top)
                        
                        Text("AUSTRALIA")
                            .font(.custom("SFPro-ExpandedBold", size: 28))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(.bottom, 90)
                    }

                    
                    VStack {
                        Spacer()
                        
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.clear, for: .navigationBar)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
    }
}

struct SongRow: View {
    var songTitle: String
    var albumTitle: String

    var body: some View {
        HStack {
            Image("albumArtPlaceholder") // Placeholder image
                .resizable()
                .frame(width: 44, height: 44)
                .cornerRadius(4)
            VStack(alignment: .leading) {
                Text(songTitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(albumTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

// Preview Provider
struct CentralCeeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayDebugFile()
    }
}
