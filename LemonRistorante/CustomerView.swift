import SwiftUI

struct CustomerView: View {
    // array of customers
    let customers = [
        Customer(name: "Ane", isPremium: true, email: "ane@example.com"),
        Customer(name: "John", isPremium: false, email: "john@example.com"),
        Customer(name: "Kate", isPremium: false, email: "kate@example.com"),
        Customer(name: "Kevin", isPremium: true, email: "kevin@example.com"),
        Customer(name: "Maria", isPremium: true, email: "maria@example.com"),
        Customer(name: "David", isPremium: false, email: "david@example.com"),
        Customer(name: "Sophia", isPremium: true, email: "sophia@example.com"),
        Customer(name: "Chris", isPremium: false, email: "chris@example.com"),
        Customer(name: "Olivia", isPremium: false, email: "olivia@example.com"),
        Customer(name: "James", isPremium: true, email: "james@example.com"),
        Customer(name:"Rachel", isPremium: true, email:"rachel@rachel.com")
    ]
    
    // show premium variable
    @State private var showPremium = false
    @State private var selectedCustomer: Customer?
    // user filter
    var customersOnDisplay: [Customer]{
        showPremium ? customers.filter(\.isPremium) : customers
    }
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                Toggle("Show premium customers only", isOn:$showPremium)
                    .padding()
                Text("Customers are tappable")
                
                List(customersOnDisplay) {
                    customer in
                    HStack{
                        Text(customer.name)
                        Spacer()
                        Text(customer.email)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        if customer.isPremium{
                            Image(systemName:"star.fill")
                                .imageScale(.small)
                                .foregroundStyle(.yellow)
                            
                        }
                    }
                    .onTapGesture{
                        selectedCustomer = customer
                    }
                }
            }
            .navigationTitle("Customers")
            .sheet(item:$selectedCustomer){customer in
                CustomerSummaryView(customer:customer)
            }
        } 
    }
}

#Preview {
    CustomerView()
}
