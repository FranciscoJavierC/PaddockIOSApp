import SwiftUI

struct CircuitInfoView: View {
    let race: RaceSchedule

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Circuit Header Card
                VStack {
                    HStack {
                        Text(race.circuitName ?? "TBA")
                            .font(.custom("SFPro-ExpandedRegular", size: 22))
                    }
                    
                    Divider().background(Color.white.opacity(0.3))

                    Image("\(race.Location)Circuit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 10)
                        .colorInvert()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
                )
                
                // MARK: - Circuit Info Card
                VStack(alignment: .leading, spacing: 20) {
                    Text("Track Details")
                        .font(.custom("SFPro-ExpandedBold", size: 18))
                    HStack {
                        statBlock(title: "Track Length", value: "5.278 km", alignment: .leading)
                        Spacer()
                        statBlock(title: "First Grand Prix", value: "1996", alignment: .trailing)
                    }
                    
                    HStack {
                        statBlock(title: "Lap Record", value: "1:19.813", subtitle: "Leclerc, 2024", alignment: .leading)
                        Spacer()
                        statBlock(title: "Number of Laps", value: "58", alignment: .trailing)
                    }
                    
                    HStack {
                        statBlock(title: "Elevation", value: "2.45 m", alignment: .leading)
                        Spacer()
                        statBlock(title: "Top Speed", value: "339.9 km/h", alignment: .trailing)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white.opacity(0.5), lineWidth: 0.4)
                )
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

// MARK: - Reusable Block
@ViewBuilder
private func statBlock(title: String, value: String, subtitle: String? = nil, alignment: HorizontalAlignment) -> some View {
    VStack(alignment: alignment, spacing: 2) {
        Text(title)
            .font(.custom("SFPro-ExpandedRegular", size: 14))
            .foregroundColor(.gray)
        
        Text(value)
            .font(.custom("SFPro-ExpandedBold", size: 18))
            .multilineTextAlignment(alignment == .leading ? .leading : .trailing)
        
        if let subtitle = subtitle {
            Text(subtitle)
                .font(.custom("SFPro-ExpandedRegular", size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(alignment == .leading ? .leading : .trailing)
        }
    }
}


#Preview {
    CircuitInfoView(race: RaceSchedule.example)
}
