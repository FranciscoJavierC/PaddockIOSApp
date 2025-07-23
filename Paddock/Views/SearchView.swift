import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
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
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search...")
        .navigationTitle("Search")
    }
}
