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
                            .font(.custom("SFPro-ExpandedRegular", size: 20))
                            .foregroundColor(.adaptiveText)
                    }

                    HStack(spacing: 8) {
                        Image("AustrailianFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 40)
                            .cornerRadius(8)
                        Text("AUSTRALIA")
                            .foregroundColor(.adaptiveText)
                            .font(.custom("SFPro-ExpandedBold", size: 25))
                    }

                    Text("13-15 March 2025")
                        .foregroundColor(.adaptiveText)
                        .font(.custom("SFPro-ExpandedRegular", size: 20))
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

                    // Schedule card (This is your outer VStack)
                    VStack(spacing: 0) {
                        ZStack {
                            Color.red
                                .frame(height: 90) // Keep header height fixed or adjust slightly
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))

                            HStack(spacing: 4) {
                                Text("Friday March 13, 2025")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                    .foregroundStyle(.white)
                            }
                        }

                        // This is the content area of your card
                        VStack(alignment: .leading, spacing: 30) {
                            HStack { // Practice 1 row
                                Text("Practice 1")
                                    .font(.custom("SFPro-ExpandedBold", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                                Spacer()
                                
                                NavigationLink(destination: ResultsView()) {
                                Label("Results", systemImage: "flag.pattern.checkered")
                                        .font(.custom("SFPro-ExpandedSemibold", size: 20))
                                        .foregroundColor(.white) // Change text color to white for contrast
                                        .padding(.vertical, 10) // Add vertical padding
                                        .padding(.horizontal, 20) // Add horizontal padding
                                        .background(Color.red) // Set a solid background color
                                        .cornerRadius(8) // Rounded corners for a button look
                                }
                                /*
                                Text("12:30 - 1:30")
                                    .font(.custom("SFPro-ExpandedRegular", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)*/
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)

                            Divider()
                                .background(Color.adaptiveText.opacity(0.3))
                                .padding(.horizontal, 16)

                            HStack { // Practice 2 row
                                Text("Practice 2")
                                    .font(.custom("SFPro-ExpandedBold", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                                Spacer()
                                Text("16:00 - 17:00")
                                    .font(.custom("SFPro-ExpandedRegular", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                        .padding(.vertical, 40) // **THIS IS KEY for the content's overall vertical size**
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    }
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    // Schedule card (This is your outer VStack)
                    VStack(spacing: 0) {
                        ZStack {
                            Color.red
                                .frame(height: 90) // Keep header height fixed or adjust slightly
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))

                            HStack(spacing: 4) {
                                Text("Saturday March 14, 2025")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                    .foregroundStyle(.white)
                            }
                        }

                        // This is the content area of your card
                        VStack(alignment: .leading, spacing: 30) {
                            HStack { // Practice 1 row
                                Text("Practice 3")
                                    .font(.custom("SFPro-ExpandedBold", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                                Spacer()
                                Text("11:30 - 12:30")
                                    .font(.custom("SFPro-ExpandedRegular", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)

                            Divider()
                                .background(Color.adaptiveText.opacity(0.3))
                                .padding(.horizontal, 16)

                            HStack { // Practice 2 row
                                Text("Qualifying")
                                    .font(.custom("SFPro-ExpandedBold", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                                Spacer()
                                Text("15:00 - 16:00")
                                    .font(.custom("SFPro-ExpandedRegular", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                        .padding(.vertical, 40) // **THIS IS KEY for the content's overall vertical size**
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    }
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    // Schedule card (This is your outer VStack)
                    VStack(spacing: 0) {
                        ZStack {
                            Color.red
                                .frame(height: 90) // Keep header height fixed or adjust slightly
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))

                            HStack(spacing: 4) {
                                Text("Sunday March 15, 2025")
                                    .font(.custom("SFPro-ExpandedBold", size: 20))
                                    .foregroundStyle(.white)
                            }
                        }

                        // This is the content area of your card
                        VStack(alignment: .leading, spacing: 30) {
                            HStack { // Practice 1 row
                                Text("Race")
                                    .font(.custom("SFPro-ExpandedBold", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                                Spacer()
                                Text("12:30 - 1:30")
                                    .font(.custom("SFPro-ExpandedRegular", size: 20)) // Slightly larger font
                                    .foregroundColor(.adaptiveText)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                        .padding(.vertical, 40) // **THIS IS KEY for the content's overall vertical size**
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight]))
                    }
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 40) // Optional: safe spacing
        }
    }
}

#Preview {
    PreviousRaceDetailView()
}
