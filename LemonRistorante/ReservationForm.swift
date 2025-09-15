//
//  ReservationForm.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/14/25.
//

import SwiftUI

struct ReservationForm: View {
    @State var userFirstName = ""
    @State var guestCount = 0
    
    // A computed property to generate the reservation status text
    var reservationStatus: String {
        if !userFirstName.isEmpty && guestCount > 0 {
            return "\(userFirstName)'s reservation for \(guestCount) people"
        } else if !userFirstName.isEmpty {
            return "\(userFirstName)'s reservation"
        } else if guestCount > 0 {
            return "Reservation for \(guestCount) people"
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(reservationStatus)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .padding(.horizontal)
                .padding(.top, 20)
        }
        
        Form {
            Section(header: Text("Reservation Details")) {
                TextField("Name: ", text: $userFirstName)
                
                Stepper("Number of Guests: \(guestCount)", value: $guestCount, in: 1 ... 5)
            }
        }
    }
}
#Preview {
    ReservationForm()
}
