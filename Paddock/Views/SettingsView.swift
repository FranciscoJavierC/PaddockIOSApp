import SwiftUI

// Your existing ThemeSwitcher and AppTheme enums remain the same
// --- (ThemeSwitcher and AppTheme definition from your previous code) ---
struct ThemeSwitcher<Content: View>: View {
    @ViewBuilder var content: Content
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        content
            .preferredColorScheme(appTheme.colorScheme)
    }
}

enum AppTheme: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case systemDefault = "Default"
    
    var colorScheme: ColorScheme? {
        switch self {
        case .light: .light
        case .dark: .dark
        case .systemDefault: nil
        }
    }
}
// --- End of ThemeSwitcher and AppTheme definition ---

struct SettingsView: View {
    @Binding var appTheme: AppTheme

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Settings")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.red)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 40)

            ScrollView {
                VStack(spacing: 16) {
                    menuItem(title: "Theme", icon: "moonphase.first.quarter")
                    menuItem(title: "Notifications", icon: "bell.fill")
                    menuItem(title: "My Garage", icon: "car.fill")
                    menuItem(title: "Contact", icon: "ellipsis.message.fill")
                }
                .padding(.horizontal)
            }
            // The NavigationStack around the List containing the Picker is fine here.
            NavigationStack {
                List {
                    // Use the binding for the Picker's selection
                    Picker("App Theme", selection: $appTheme) {
                        ForEach(AppTheme.allCases, id: \.rawValue) { theme in
                            Text(theme.rawValue)
                                .tag(theme)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .navigationTitle("Theme Switcher")
            }
        }
    }

    @ViewBuilder
    func menuItem(title: String, icon: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
                .frame(height: 70)

            HStack {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: icon)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
