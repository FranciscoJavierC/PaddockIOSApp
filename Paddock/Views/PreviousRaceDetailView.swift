import SwiftUI

struct PreviousRaceDetailView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                
                // Race header
                VStack(alignment: .leading, spacing: 19) {
                    HStack {
                        Text("Round 1")
                            .font(.custom("SFPro-ExpandedRegular", size: 17))
                            .foregroundColor(.adaptiveText)
                    }

                    HStack(spacing: 8) {
                        Image("AustrailianFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 30)
                            .cornerRadius(8)
                        Text("AUSTRALIA")
                            .foregroundColor(.adaptiveText)
                            .font(.custom("SFPro-ExpandedBold", size: 20))
                    }

                    Text("13-15 March 2025")
                        .foregroundColor(.adaptiveText)
                        .font(.custom("SFPro-ExpandedRegular", size: 17))
                }
                .padding()

                // Circuit and Schedule section
                VStack(spacing: 50) {
                    Text("Albert Park Circuit")
                        .foregroundColor(.adaptiveText)
                        .font(.custom("SFPro-ExpandedRegular", size: 25))

                    Image("AustrailianGP")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 410, height: 200)
                        .padding(.horizontal)

                    HStack(spacing: 25) {
                        VStack {
                            Text("Circuit Length")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("5.278km")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }

                        VStack {
                            Text("First Grand Prix")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("1996")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                    }

                    HStack(spacing: 25) {
                        VStack {
                            Text("Number of Laps")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("58")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }

                        VStack {
                            Text("Fastest lap time")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("1:19:813")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                            Text("Charles Leclerc (2024)")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedRegular", size: 13))
                        }
                    }

                    HStack {
                        VStack {
                            Text("Race Distance")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedRegular", size: 20))
                            Text("306.124km")
                                .foregroundColor(.adaptiveText)
                                .font(.custom("SFPro-ExpandedBold", size: 18))
                        }
                    }

                    // Schedule card
                    VStack(spacing: 0) {
                        ZStack {
                            Color.red
                                .frame(height: 70)
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))

                            HStack(spacing: 4) {
                                Text("Friday March 13, 2025")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                    .foregroundStyle(.white)
                            }
                        }

                        VStack(alignment: .leading) {
                            HStack(spacing: 150) {
                                Text("Practice 1")
                                    .font(.custom("SFPro-ExpandedBold", size: 15))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.adaptiveText)

                                Text("12:30 - 1:30")
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                                    .foregroundColor(.adaptiveText)
                            }
                            Spacer()
                            
                            HStack(spacing: 150) {
                                Text("Practice 2")
                                    .font(.custom("SFPro-ExpandedBold", size: 15))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.adaptiveText)

                                Text("16:00 - 17:00")
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                                    .foregroundColor(.adaptiveText)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .frame(height: 75)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                    }
                    .frame(width: 400, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                    
                    // Schedule card
                    VStack(spacing: 0) {
                        ZStack {
                            Color.red
                                .frame(height: 70)
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))

                            HStack(spacing: 4) {
                                Text("Saturday March 14, 2025")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                    .foregroundStyle(.white)
                            }
                        }

                        VStack(alignment: .leading) {
                            HStack(spacing: 150) {
                                Text("Practice 3")
                                    .font(.custom("SFPro-ExpandedBold", size: 15))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.adaptiveText)

                                Text("11:30 - 12:30")
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                                    .foregroundColor(.adaptiveText)
                            }
                            Spacer()
                            
                            HStack(spacing: 150) {
                                Text("Qualifying")
                                    .font(.custom("SFPro-ExpandedBold", size: 15))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.adaptiveText)

                                Text("15:00 - 16:00")
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                                    .foregroundColor(.adaptiveText)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .frame(height: 75)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                    }
                    .frame(width: 400, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                    
                    // Schedule card
                    VStack(spacing: 0) {
                        ZStack {
                            Color.red
                                .frame(height: 70)
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))

                            HStack(spacing: 4) {
                                Text("Sunday March 15, 2025")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                    .foregroundStyle(.white)
                            }
                        }

                        VStack(alignment: .leading) {
                            HStack(spacing: 150) {
                                Text("Race")
                                    .font(.custom("SFPro-ExpandedBold", size: 15))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.adaptiveText)

                                Text("13:00 - 15:00")
                                    .font(.custom("SFPro-ExpandedRegular", size: 15))
                                    .foregroundColor(.adaptiveText)
                            }
                        }
                        .padding(.vertical, 8)
                        .frame(height: 75)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                    }
                    .frame(width: 400, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                }
            }
            .padding(.bottom, 40) // Optional: safe spacing
        }
    }
}

#Preview {
    PreviousRaceDetailView()
}
