import SwiftUI

struct ConditionalTitleWithVisibility: View {
    // State to track if the content title is visible.
    @State private var isContentTitleVisible: Bool = true
    
    // A separate, visible title view that is not the top-most item
    private var contentTitle: some View {
        Text("Content Title Here")
            .font(.largeTitle)
            .bold()
            .padding(.vertical, 50)
            .onScrollVisibilityChange { visibility in
                isContentTitleVisible = visibility
            }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    // Placeholder item to ensure the content title is not the top-most
                    Text("Header Space")
                        .padding(.top, 1)
                        .padding(.bottom, 20)
                        .opacity(0.001) // Make it nearly invisible
                    
                    contentTitle // Our content title to be tracked
                    
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .id("item_\(i)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    // Show the toolbar title only when the content title is NOT visible.
                    if !isContentTitleVisible {
                        Text("Content Title Is Hidden")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    ConditionalTitleWithVisibility()
}
