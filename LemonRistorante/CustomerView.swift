//
//  CustomerView.swift
//  LemonRistorante
//
//  Created by mbair on 9/27/25.
//

import SwiftUI

struct CustomerView: View {
    // array of customers
    let customers = [
        Customer(name:"Ane", isPremium:true),
        Customer(name:"John", isPremium:false),
        Customer(name:"Kate", isPremium:false),
        Customer(name:"Kevin", isPremium:true)
    ]
    // show premium variable
    @State private var showPremium = false
    // user filter
    var filteredCustomer: [Customer]{
        showPremium ? customers.filter(\.isPremium) : customers
    }
    
    var body: some View {
        Text("Customer list")
        List(filteredCustomer) {
            customer in
            HStack{
                Text(customer.name)
                Spacer()
                if customer.isPremium{
                    Image(systemName:"star.fill")
                        .imageScale(.small)
                        .foregroundStyle(.yellow)
                    
                }
            }
        }
    }
}

#Preview {
    CustomerView()
}
