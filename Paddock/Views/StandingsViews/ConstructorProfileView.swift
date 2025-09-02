//
//  ConstructorProfileView.swift
//  Paddock
//
//  Created by Francisco  Cortez on 9/1/25.
//

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
                    Text("Drivers")
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        //.padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(drivers) { driver in
                            DriverCard(driver: driver)
                        }
                    }
                    //.padding(.horizontal)
                    
                    Text("Chasis")
                        .font(.custom("SFPro-ExpandedBold", size: 20))
                        //.padding(.horizontal)
                    
                    ForEach(car) { chassis in
                        CarChasisCard(car: chassis)
                            .frame(height: 200) // same height as driver cards
                            //.padding(.horizontal)
                    }
                }
            }
            .padding()
            .padding(.bottom, 80)
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
