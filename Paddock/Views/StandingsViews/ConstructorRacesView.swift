//
//  ConstructorRacesView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 9/1/25.
//

import SwiftUI

struct ConstructorRacesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                VStack(alignment: .leading) {
                    HStack {
                        Image("McLaren")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        Text("McLaren")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sun, Mar 15")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                        
                        Spacer()
                        
                        Text("F1 Race")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .padding(.horizontal, 7)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color.gray.opacity(0.7), Color.gray.opacity(0.3)],
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            )
                    }
                    
                    HStack {
                        Image("AustrailianFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                        
                        Text("Australia GP")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            HStack(spacing: 6) {
                                Text("P5")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                                Text("P9")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                            }
                            
                            Text("20 PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sun, Mar 23")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                        
                        Spacer()
                        
                        Text("F1 Race")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .padding(.horizontal, 7)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color.gray.opacity(0.7), Color.gray.opacity(0.3)],
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            )
                    }
                    
                    HStack {
                        Image("ChinaFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                        
                        Text("China GP")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            HStack(spacing: 6) {
                                Text("P5")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                                Text("P9")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                            }
                            
                            Text("20 PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sun, Mar 23")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                        
                        Spacer()
                        
                        Text("F1 Sprint")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .padding(.horizontal, 7)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color.gray.opacity(0.7), Color.gray.opacity(0.3)],
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            )
                    }
                    
                    HStack {
                        Image("ChinaFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                        
                        Text("China GP")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            HStack(spacing: 6) {
                                Text("P5")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                                Text("P9")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                            }
                            
                            Text("20 PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sun, Apr 6")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                        
                        Spacer()
                        
                        Text("F1 Race")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .padding(.horizontal, 7)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color.gray.opacity(0.7), Color.gray.opacity(0.3)],
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            )
                    }
                    
                    HStack {
                        Image("JapanFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                        
                        Text("Japan GP")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            HStack(spacing: 6) {
                                Text("P5")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                                Text("P9")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                            }
                            
                            Text("20 PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sun, Apr 13")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                        
                        Spacer()
                        
                        Text("F1 Race")
                            .font(.custom("SFPro-ExpandedRegular", size: 12))
                            .padding(.horizontal, 7)
                            .background(
                                Capsule()
                                    .fill(LinearGradient(
                                        colors: [Color.gray.opacity(0.7), Color.gray.opacity(0.3)],
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            )
                    }
                    
                    HStack {
                        Image("BahrainFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 25)
                            .cornerRadius(20)
                        
                        Text("Bahrain GP")
                            .font(.custom("SFPro-ExpandedBold", size: 18))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            HStack(spacing: 6) {
                                Text("P5")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                                Text("P9")
                                    .font(.custom("SFPro-ExpandedRegular", size: 13))
                            }
                            
                            Text("20 PTS")
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                                .foregroundColor(.white)
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
        }
    }
}

#Preview {
    ConstructorRacesView()
}
