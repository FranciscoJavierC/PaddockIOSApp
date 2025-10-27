//
//  WeekendTabView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 10/22/25.
//

import SwiftUI

struct WeekendTabView: View {
    let race: RaceSchedule

    private var raceDays: [Date] {
        let calendar = Calendar.current
        let dates = [
            race.Session1Date, race.Session2Date,
            race.Session3Date, race.Session4Date,
            race.Session5Date
        ]
        let uniqueDays = Set(dates.map { calendar.startOfDay(for: $0) })
        return Array(uniqueDays).sorted()
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 25) {
                ForEach(raceDays, id: \.self) { day in
                    VStack(alignment: .leading, spacing: 10) {
                        // MARK: - Day Header
                        HStack {
                            Text(day, formatter: dayNameFormatter)
                                .font(.custom("SFPro-ExpandedBold", size: 22))
                                .foregroundColor(.white)
                            Spacer()
                            Text(day, formatter: shortDateFormatter)
                                .font(.custom("SFPro-ExpandedRegular", size: 15))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.horizontal, 5)

                        // MARK: - Session Card
                        DayScheduleCard(race: race, selectedDay: day)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    // MARK: - Formatters
    private let dayNameFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "EEEE"
        return f
    }()

    private let shortDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MMM d"
        return f
    }()
}

// MARK: - Day Schedule Card
struct DayScheduleCard: View {
    struct SessionSelection: Identifiable {
        let id = UUID()
        let name: String
        let date: Date
    }

    @State private var selectedSession: SessionSelection? = nil
    let race: RaceSchedule
    let selectedDay: Date

    private var timeFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "h:mm a"
        return f
    }

    private var sessionsForSelectedDay: [(name: String, date: Date)] {
        let calendar = Calendar.current
        let sessions: [(String, Date)] = [
            (race.Session1, race.Session1Date),
            (race.Session2, race.Session2Date),
            (race.Session3, race.Session3Date),
            (race.Session4, race.Session4Date),
            (race.Session5, race.Session5Date)
        ]
        return sessions.filter { calendar.isDate($0.1, inSameDayAs: selectedDay) }
    }

    var body: some View {
        VStack(spacing: 10) {
            ForEach(sessionsForSelectedDay, id: \.0) { session in
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(session.0.uppercased())
                            .font(.custom("SFPro-ExpandedBold", size: 16))
                            .foregroundColor(.white)
                        Text(session.1, formatter: timeFormatter)
                            .font(.custom("SFPro-ExpandedRegular", size: 13))
                            .foregroundColor(.white.opacity(0.8))
                    }

                    Spacer()

                    Button("", systemImage: "chevron.right") {
                        selectedSession = SessionSelection(name: session.0, date: session.1)
                    }
                    .foregroundStyle(.white)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
            }
        }
        .padding(15)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.3), lineWidth: 0.4)
        )
        .sheet(item: $selectedSession, content: { session in
            SessionSheetView(
                sessionName: session.name,
                sessionDate: session.date,
                weather: ("cloud.sun.fill", "84°F", "Sunny"),
                results: nil
            )
            .presentationDetents([.medium, .large])
        })
    }
}

// MARK: - Preview
#Preview {
    WeekendTabView(race: RaceSchedule.example)
}
