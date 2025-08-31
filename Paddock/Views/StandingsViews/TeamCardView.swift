//
//  TeamCardView.swift
//  Paddock
//
//  Created by Francisco Cortez on 8/29/25.
//

import SwiftUI

struct TeamCardView: View {
    // Consistent stat layout settings
    private let statW: CGFloat = 35      // width of each stat column
    private let statSpacing: CGFloat = 12 // spacing between stat columns
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                VStack(alignment: .leading, spacing: 12) {
                    
                    // ---------- Header ----------
                    HStack {
                        Text("Senior Career")
                            .font(.custom("SFPro-ExpandedBold", size: 14))
                        
                        Spacer()
                        
                        HStack(spacing: statSpacing) {
                            Image(systemName: "flag.checkered")
                                .font(.system(size: 13))
                                .frame(width: statW, alignment: .center)
                            
                            Image(systemName: "medal")
                                .font(.system(size: 13))
                                .frame(width: statW, alignment: .center)
                        }
                    }
                    
                    // ---------- Content Row ----------
                    HStack {
                        // Left: Team info
                        HStack(spacing: 12) {
                            Image("McLaren")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("McLaren")
                                    .font(.custom("SFPro-ExpandedBold", size: 13))
                                
                                Text("2023 - now")
                                    .font(.custom("SFPro-ExpandedRegular", size: 11))
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        Spacer()
                        
                        // Right: Numbers in the same grid as header icons
                        HStack(spacing: statSpacing) {
                            Text("60")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .frame(width: statW, alignment: .center)
                            
                            Text("673")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .monospacedDigit()
                                .frame(width: statW, alignment: .center)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
            }
            .padding()
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    TeamCardView()
}
