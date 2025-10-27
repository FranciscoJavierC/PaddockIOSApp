//
//  ConstructorProfileView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 9/1/25.
//

// MARK: - API Endpoints Needed
//
// ConstructorProfileView
//
// 1. Constructor Basic Info (InfoCard)
//    - Jolpica Endpoint: https://api.jolpi.ca/ergast/f1/constructors/{constructorID}
//    - Data Provided:
//         • constructorId
//         • name
//         • nationality
//         • url (Wikipedia link for reference)
//    - Missing / Extra Fields (must use static JSON, Wikipedia scraping, or Wikidata):
//         • Power Unit Supplier
//         • Team Principal
//         • First Team Entry
//         • Founded Year
//
// 2. Drivers (DriverCard)
//    - Jolpica Endpoint: https://api.jolpi.ca/ergast/f1/{season}/constructors/{constructorID}/drivers
//    - Data Provided:
//         • full name
//         • permanent number
//         • nationality
//    - Extra: Driver images must be provided locally or via asset mapping
//
// 3. Car / Chassis (CarChasisCard)
//    - Not available via Ergast/Jolpica
//    - Data Needed:
//         • Car Name (e.g., MCL39)
//         • Image asset
//    - Can use Wikidata to get car name.

import SwiftUI

struct ConstructorProfileView: View {
    let constructor: ConstructorStandings
    
    // Map constructor drivers to DriverStandings by matching names
    var drivers: [DriverStandings] {
        // Map Drivers and DriverPoints arrays to DriverStandings
        constructor.Drivers.enumerated().map { index, name in
            DriverStandings(
                driverId: name.lowercased().replacingOccurrences(of: " ", with: ""),
                Position: index + 1, // Or match real position if available
                DriverNumber: constructor.DriverPoints.indices.contains(index) ? constructor.DriverPoints[index] : 0,
                FullName: name,
                CountryName: "Unknown",
                ConstructorNames: [constructor.ConstructorName],
                TeamColorHex: constructor.TeamColorHex,
                Points: constructor.DriverPoints.indices.contains(index) ? constructor.DriverPoints[index] : 0
            )
        }
    }
    
    let car = [
        Car(name: "MCL39", image: "MclarenCar")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                InfoCard()
                
                Text("Drivers")
                    .font(.custom("SFPro-ExpandedBold", size: 20))
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(drivers) { driver in
                        DriverCard(driver: driver)
                    }
                }
                
                Text("Chassis")
                    .font(.custom("SFPro-ExpandedBold", size: 20))
                
                ForEach(car) { chassis in
                    CarChasisCard(car: chassis)
                        .frame(height: 200)
                }
            }
            .padding()
        }
    }
}

// MARK: - Driver Card
struct DriverCard: View {
    let driver: DriverStandings

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(driver.TeamColor)
                .cornerRadius(20)
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 200)
            
            Image(driver.FullName)
                .resizable()
                .scaledToFill()
                .frame(height: 200, alignment: .top)
                .clipped()
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(driver.FullName)
                    .font(.custom("SFPro-ExpandedBold", size: 14))
                    .foregroundColor(.white)
                Text("#\(driver.DriverNumber)")
                    .font(.custom("SFPro-ExpandedRegular", size: 12))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(driver.TeamColor, lineWidth: 1)
        )
    }
}

// MARK: - Car Chassis Card
struct CarChasisCard: View {
    let car: Car
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(Color.orange)
                .cornerRadius(20)
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 200)
            
            Image("McLaren")
                .resizable()
                .scaledToFit()
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            Image(car.image)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(car.name)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
            }
            .padding(10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.orange.opacity(0.5), lineWidth: 1)
        )
    }
}

// MARK: - InfoCard (unchanged)
struct InfoCard: View {
    var body: some View {
        VStack(spacing: 20) {
            // Top row
            HStack(spacing: 0) {
                VStack(spacing: 5) {
                    HStack(spacing: 5) {
                        Image("United KingdomFlag")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 20)
                            .cornerRadius(20)
                        Text("UK")
                            .font(.custom("SFPro-ExpandedRegular", size: 18))
                    }
                    Text("Country")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }.frame(maxWidth: .infinity)
                
                VStack(spacing: 5) {
                    Text("Mercedes")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("Power Unit")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }.frame(maxWidth: .infinity)

                VStack(spacing: 5) {
                    Text("1966")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("First Team Entry")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }.frame(maxWidth: .infinity)
            }
            
            // Bottom row
            HStack(spacing: 0) {
                VStack(spacing: 5) {
                    Text("Andres Stella")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("Team Chief")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }.frame(maxWidth: .infinity)
                
                VStack(spacing: 5) {
                    Text("1963")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("Founded")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }.frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.8), lineWidth: 1)
        )
    }
}

// MARK: - Car Model
struct Car: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

#Preview {
    ConstructorProfileView(constructor: ConstructorStandings(
            ConstructorName: "McLaren",
            Points: 150,
            Position: 1,
            Drivers: ["Oscar Piastri", "Lando Norris"],
            DriverPoints: [80, 70],
            TeamColorHex: "#FF9800",
            constructorId: "mclaren"
        ))
}
