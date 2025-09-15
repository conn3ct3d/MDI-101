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
    var body: some View {
        VStack{
            Text("\(userFirstName) reservation for \(guestCount) people")
        }
        Form{
            Section(header: Text("Reservation Details")){
                TextField("Name: ", text: $userFirstName)
                    
                Stepper("Number of Guests: \(guestCount)", value: $guestCount, in: 1 ... 5)
            }
        }
        
    }
}

#Preview {
    ReservationForm()
}
