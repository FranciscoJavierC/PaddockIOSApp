//
//  ConstructorDetailView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 7/18/25.
//

import SwiftUI

struct ConstructorDetailView: View {
    @State private var activeTab: ConstructorDetailTab = .profile
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            header
            
            VStack(spacing: 0) {
                tabBar
                tabContent
            }
            .frame(maxWidth: 450, minHeight: UIScreen.main.bounds.height - 400)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white.opacity(0.8), lineWidth: 1)
            )
            .offset(y: -30)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { // 2. Adds a custom button to the left
                Button(action: {
                    dismiss() // 3. The action to go back
                }) {
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial) // The ultraThinMaterial background
                            .frame(width: 40, height: 40) // Adjust size as needed

                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.custom("SFPro-ExpandedBold", size: 16))

                    }
                }
            }
        }
    }

    // MARK: - Header
    private var header: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(.orange)
                .frame(maxWidth: .infinity, maxHeight: 500)
                .cornerRadius(20)
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .frame(maxWidth: .infinity)
                .frame(height: 450)
            
            Image("McLaren")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 450)
                .clipped()
                .cornerRadius(20)
            
            VStack(alignment: .leading) { // Added spacing for better layout
                // Player name
                Text("McLaren")
                    .font(.custom("SFPro-ExpandedBold", size: 28))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 60)
        }
        .frame(height: 450)
    }

    // MARK: - Tab Bar
    private var tabBar: some View {
        HStack {
            ForEach(ConstructorDetailTab.allCases, id: \.self) { tab in
                Button(action: { activeTab = tab }) {
                    Text(tab.rawValue)
                        .font(.custom("SFPro-ExpandedBold", size: 14))
                        .foregroundColor(activeTab == tab ? .white : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if activeTab == tab {
                                    Rectangle()
                                        .fill(Color.red)
                                        .frame(height: 3)
                                        .offset(y: 20)
                                }
                            }
                        )
                }
            }
        }
        .padding()
    }

    // MARK: - Tab Content
    @ViewBuilder
    private var tabContent: some View {
        switch activeTab {
        case .profile:
            ConstructorProfileView()
        case .races:
            ConstructorRacesView()

        }
    }
}

// MARK: - Tabs enum
enum ConstructorDetailTab: String, CaseIterable {
    case profile = "Profile"
    case races = "Races"
}

#Preview {
    ConstructorDetailView()
}
