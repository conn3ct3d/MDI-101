//
//  ReservationSummaryView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/15/25.
//

import SwiftUI

struct ReservationSummaryView: View {
    @Binding var name: String
    @Binding var guests:Int
    var body: some View {
        VStack(alignment:.leading, spacing:10){
            Text("Reservation Summary").font(.title)
            Text("Name: \(name)" )
            Text("Number of guests: \(guests)")
        }
    }
}

//#Preview {
 //   ReservationSummaryView()
//}
