import SwiftUI

struct SettingsView: View {
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
                    .font(.title)
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
    SettingsView()
}
