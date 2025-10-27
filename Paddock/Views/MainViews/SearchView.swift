import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
        }
        .navigationTitle("Search")
        .searchable(text: .constant(""))
    }
}

#Preview {
    // For preview, just pass a constant binding
    SearchView()
}
