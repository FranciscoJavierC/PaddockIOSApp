import SwiftUI

// MARK: - AppTheme & ThemeSwitcher

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

struct ThemeSwitcher<Content: View>: View {
    @ViewBuilder var content: Content
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        content
            .preferredColorScheme(appTheme.colorScheme)
    }
}

// MARK: - Settings View

struct SettingsView: View {
    @AppStorage("AppTheme") var appTheme: AppTheme = .systemDefault
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Settings")
                        .font(.custom("SFPro-ExpandedBold", size: 35))
                        .foregroundColor(.adaptiveText)
                        .padding(.horizontal)
                    
                    SettingsSection(header: "App Preferences") {
                        NavigationLink(destination: ThemePickerView(appTheme: $appTheme)) {
                            SettingsRow(title: "Theme", icon: "moonphase.first.quarter")
                        }
                        SettingsRow(title: "Notifications", icon: "bell.fill")
                        SettingsRow(title: "My Garage", icon: "car.fill")
                    }

                    SettingsSection(header: "Support") {
                        SettingsRow(title: "Contact", icon: "ellipsis.message.fill")
                        SettingsRow(title: "Version 1.0", icon: "info.circle.fill", isInteractive: false)
                    }
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Theme Picker View

struct ThemePickerView: View {
    @Binding var appTheme: AppTheme
    
    var body: some View {
        List {
            Picker("App Theme", selection: $appTheme) {
                ForEach(AppTheme.allCases, id: \.rawValue) { theme in
                    Text(theme.rawValue).tag(theme)
                }
            }
            .pickerStyle(.segmented)
        }
        .navigationTitle("Theme")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Settings Row

struct SettingsRow: View {
    var title: String
    var icon: String
    var isInteractive: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
                .frame(height: 65)
            
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
                
                if isInteractive {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white.opacity(0.5))
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Settings Section

struct SettingsSection<Content: View>: View {
    let header: String
    let content: Content
    
    init(header: String, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(header.uppercased())
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            VStack(spacing: 12) {
                content
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Preview

#Preview {
    SettingsView()
}
