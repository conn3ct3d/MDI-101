//
//  MenuItem.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/21/25.
//

import Foundation

struct MenuItem: Identifiable {
    var id:UUID = UUID()
    var name: String
    var description:String
    var price:Double
}
