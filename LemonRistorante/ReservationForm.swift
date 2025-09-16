//
//  ReservationForm.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/14/25.
//

import SwiftUI

struct ReservationForm: View {
    
    @State var userFirstName = ""
    @State var guestCount = 1
    @State var allergyNotes = ""
    @State var showSummary = false
    @FocusState private var isNameFieldFocused:Bool
    
    var reservationStatus: String {
        if !userFirstName.isEmpty {
            if guestCount > 1 {
                return "\(userFirstName)'s reservation for \(guestCount)"
            } else {
                return "\(userFirstName)'s reservation"
            }
        } else if guestCount > 1 {
            return "Reservation for \(guestCount)"
        } else {
            return ""
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(reservationStatus)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                Form {
                    Section(header: Text("Reservation Details")) {
                        TextField("Name: ", text: $userFirstName)
                            .focused($isNameFieldFocused)
                        
                        if userFirstName.isEmpty && !isNameFieldFocused {
                            Text("Please enter your name")
                                .foregroundColor(.orange)
                                .font(.caption)
                        }
                        Stepper("Number of Guests: \(guestCount)", value: $guestCount, in: 1 ... 10)
                        if guestCount > 5 {
                            Text("We will call you to confirm availability")
                                .foregroundColor(.orange)
                                .font(.caption)
                        }
                        
                        TextField("Allergy Notes", text: $allergyNotes)
                        
                        Button("Confirm reservation") {
                            if !userFirstName.isEmpty {
                                showSummary = true
                            }
                        }
                        .disabled(userFirstName.isEmpty)
                    }
                }
                .navigationDestination(isPresented: $showSummary) {
                    ReservationSummaryView(name: $userFirstName, guests: $guestCount)
                }
            }
            .onAppear{
                self.isNameFieldFocused = true
            }
        }
    }
}
        #Preview {
            ReservationForm()
        }
