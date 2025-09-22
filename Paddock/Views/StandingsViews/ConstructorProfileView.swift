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
    let drivers = [
        Driver(name: "Lando Norris", image: "Norris", number: "4"),
        Driver(name: "Oscar Piastri", image: "Piastri", number: "81")
    ]
    
    let car = [
        Car(name: "MCL39", image: "MclarenCar")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                VStack(alignment: .leading, spacing: 20) {
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
                    
                    ForEach(car) { chassis in
                        CarChasisCard(car: chassis)
                            .frame(height: 200)
                    }
                    
                    ForEach(car) { chassis in
                        CarChasisCard(car: chassis)
                            .frame(height: 200)
                    }
                    
                    ForEach(car) { chassis in
                        CarChasisCard(car: chassis)
                            .frame(height: 200)
                    }
                }
            }
            .padding()
            //.padding(.bottom, 80)
        }
    }
}

struct DriverCard: View {
    let driver: Driver
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Orange background
            Rectangle()
                .fill(Color.orange)
                .cornerRadius(20)
            
            // Dark gradient overlay at bottom
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 200)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            // Faded McLaren logo in background
            Image("McLaren")
                .resizable()
                .scaledToFit()
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            // Driver image cropped (head → stomach)
            Image(driver.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200, alignment: .top) // adjust height for crop
                .clipped()
            
            // Dark gradient overlay at bottom
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 100)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            // Driver info
            VStack(alignment: .leading, spacing: 4) {
                Text(driver.name)
                    .font(.custom("SFPro-ExpandedBold", size: 14))
                    .foregroundColor(.white)
                Text("#\(driver.number)")
                    .font(.custom("SFPro-ExpandedRegular", size: 12))
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

struct CarChasisCard: View {
    let car: Car
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Orange background
            Rectangle()
                .fill(Color.orange)
                .cornerRadius(20)
            
            // Dark gradient overlay at bottom
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 200)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            // Faded McLaren logo in background
            Image("McLaren")
                .resizable()
                .scaledToFit()
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            // Driver image cropped (head → stomach)
            Image(car.image)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .clipped()
            
            // Dark gradient overlay at bottom
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 100)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            // Driver info
            VStack(alignment: .leading, spacing: 4) {
                Text(car.name)
                    .font(.custom("SFPro-ExpandedBold", size: 15))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .foregroundColor(.white)
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

struct InfoCard: View {
    var body: some View {
        // MARK: - Top Card with 3x2 Layout
        VStack(spacing: 20) {
            // Top row with 3 data points
            HStack(spacing: 0) {
                // Column 1: Country
                VStack(spacing: 5) {
                    HStack(spacing: 5) {
                        Image("UKFlag")
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
                }
                .frame(maxWidth: .infinity)
                
                // Column 2: Team
                VStack(spacing: 5) {
                    Text("Mercedes")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("Power Unit")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)

                // Column 3: Number
                VStack(spacing: 5) {
                    Text("1966") // Placeholder, assuming this is the number
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("First Team Entry")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
            
            // Bottom row with 2 data points
            HStack(spacing: 0) {
                // Column 1: Height
                VStack(spacing: 5) {
                    Text("Andres Stella")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("Team Chief")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                
                // Column 2: Date of Birth
                VStack(spacing: 5) {
                    Text("1963")
                        .font(.custom("SFPro-ExpandedRegular", size: 18))
                    Text("Founded")
                        .font(.custom("SFPro-ExpandedRegular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white) // Apply a consistent text color
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.8), lineWidth: 1)
        )
    }
}

struct Driver: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let number: String
}
    
struct Car: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

#Preview {
    ConstructorProfileView()
}
