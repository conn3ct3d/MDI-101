//
//  ReservationSummaryView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/15/25.
//

import SwiftUI

struct ReservationSummaryView: View {
    @Binding var name: String
    @Binding var guests: Int
    @Binding var date: Date
    @Binding var allergies: String
    
    // computed property handles formatting
    var formattedDate: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Reservation Summary")
                .font(.title)
                .bold()
            
            Text("Name: \(name)")
            
            Text("Number of guests: \(guests)")
            
            if !allergies.isEmpty { // this is more idiomatic #swift
                Text("Allergies: \(allergies)")
            }
            
            Text("Date of the reservation: \(formattedDate)")
        }
        .padding()
    }
}

//#Preview {
 //   ReservationSummaryView()
//}
