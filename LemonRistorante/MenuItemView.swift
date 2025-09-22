//
//  MenuItemView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/21/25.
//

import SwiftUI

struct MenuItemView: View {
    var item: MenuItem
    
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                
                Text("# \(item.price, specifier:"%.2f")")
                    .foregroundColor(Color.secondary)
                
            }
            
            Spacer()
            if item.price > 10{
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Premium")
                    .font(.caption)
                
            }
            .font(.caption)
            .foregroundColor(.orange)
            .padding(6)
            .background(.orange.opacity(0.2))
            .cornerRadius(6)
            }
            else if item.price < 7{
                Text("$\(item.price, specifier: "%.2f")")
                    .foregroundColor(.green)
            }
        }
    }
}

//#Preview {
//    MenuItemView()
//}
