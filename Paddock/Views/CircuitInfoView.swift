import SwiftUI

struct CircuitInfoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // MARK: - Circuit Header Card
                VStack {
                    HStack {
                        Image("AustrailianFlag")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 1)
                            )
                        Text("Albert Park Circuit")
                            .font(.custom("SFPro-ExpandedRegular", size: 22))
                    }
                    
                    Divider().background(Color.white.opacity(0.3))

                    Image("AustrailianGP")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 10)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                )
                
                // MARK: - Circuit Info Card
                VStack(spacing: 16) {
                    HStack {
                        VStack {
                            Text("Circuit Length")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                            Text("5.278 km")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                        Spacer()
                        VStack {
                            Text("Race Distance")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                            Text("306.124 km")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                    }
                    
                    HStack {
                        VStack {
                            Text("Number of Laps")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                            Text("58")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                        Spacer()
                        VStack {
                            Text("First GP")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                            Text("1996")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                    }
                    
                    HStack {
                        VStack {
                            Text("Lap Record")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                            Text("1:20.235 (2022)")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                        Spacer()
                        VStack {
                            Text("Turns")
                                .font(.custom("SFPro-ExpandedRegular", size: 14))
                                .foregroundColor(.gray)
                            Text("14")
                                .font(.custom("SFPro-ExpandedBold", size: 18))
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
            .foregroundColor(.white)
            .padding()
        }
    }
}

#Preview {
    CircuitInfoView()
}
