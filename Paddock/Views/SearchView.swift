import SwiftUI

struct SearchView: View {
    @Binding var query: String
    let allDrivers = ["Verstappen", "Hamilton", "Leclerc", "Norris", "Alonso"]
    
    var filteredDrivers: [String] {
        if query.isEmpty {
            return allDrivers
        } else {
            return allDrivers.filter { $0.localizedCaseInsensitiveContains(query) }
        }
    }

    var body: some View {
        List(filteredDrivers, id: \.self) { driver in
            Text(driver)
        }
        .navigationTitle("Search")
        // no `.searchable` here
    }
}

#Preview {
    // For preview, just pass a constant binding
    SearchView(query: .constant(""))
}
