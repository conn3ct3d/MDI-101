//
//  CustomerSummaryView.swift
//  LemonRistorante
//
//  Created by mbair on 9/27/25.
//

import SwiftUI

struct CustomerSummaryView: View {
    @Environment(\.dismiss) var dismiss
    let customer: Customer
    
    var body: some View {
        VStack(spacing: 20) {
            Text(customer.name)
                .font(.largeTitle)
            
            Text(customer.email)
                .font(.headline)
                .foregroundStyle(.secondary)
            
            if customer.isPremium {
                HStack {
                    Image(systemName: "star.fill")
                    Text("Premium Member")
                }
                .foregroundStyle(.yellow)
            }
            
            Button("Done") {
                dismiss() 
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
    }
}

//#Preview {
//    CustomerSummaryView()
//}
