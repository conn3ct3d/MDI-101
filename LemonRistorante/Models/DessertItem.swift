//
//  DessertItem.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/21/25.
//

import Foundation

struct DessertItem: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var price: Double
    let imageName: String
}
