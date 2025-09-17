//
//  ReservationForm.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/14/25.
//

import SwiftUI

struct ReservationForm: View {
    
    // state variables
    @State private var userFirstName = ""
    @State private var guestCount = 1
    @State private var allergyNotes = ""
    @State private var showSummary = false
    @FocusState private var isNameFieldFocused:Bool
    @State private var reservationDate = Date()
    @State private var dateIsValid:Bool = false
    
    
    // computed properties
    private var reservationStatus: String {
        if !userFirstName.isEmpty {
            if guestCount > 1 {
                return "\(userFirstName)'s reservation for \(guestCount)"
            } else {
                return "\(userFirstName)'s reservation"
            }
        } else if guestCount > 1 {
            return "Reservation for \(guestCount)"
        } else {
            return "Appoint a Reservation"
        }
    }
    
    //body
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
                        if guestCount > 5 && guestCount < 8 {
                            Text("Large parties must arrive 10 minutes early.")
                                .foregroundColor(.orange)
                                .font(.caption)
                        }
                        if guestCount >= 8 {
                            Text("For parties larger than 8, we will call to confirm")
                                .foregroundColor(.orange)
                                .font(.caption)
                        }
                        
                        DatePicker("Date", selection:$reservationDate, displayedComponents: [.date, .hourAndMinute])
                        
                        if dateIsValid {
                            Text("Date is available")
                                .foregroundColor(.green)
                                .font(.caption)
                        }
                        else {
                            Text("Please choose a valid future date")
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                        
                        TextField("Allergy Notes", text: $allergyNotes)
                        
                        Button("Confirm reservation") {
                            if !userFirstName.isEmpty && dateIsValid {
                                showSummary = true
                            }
                        }
                        .disabled(userFirstName.isEmpty || !dateIsValid)
                    }
                }
                .navigationDestination(isPresented: $showSummary) {
                    ReservationSummaryView(name: $userFirstName, guests: $guestCount, date: $reservationDate, allergies: $allergyNotes)
                    // send date, allergies to summaryview
                }
            }
            .onAppear{
                self.isNameFieldFocused = true
                // ensure initial validation state is correct
                self.dateIsValid = Self.isDateInFuture(reservationDate)
            }
            .onChange(of: reservationDate) {
                newValue in self.dateIsValid = Self.isDateInFuture(newValue)
            }
            .onChange(of: userFirstName) {
                _ in
            }
        }
    }
    // helper
    private static func isDateInFuture(_ date: Date) -> Bool{
        return date >= Date()
    }
}
        #Preview {
            ReservationForm()
        }
