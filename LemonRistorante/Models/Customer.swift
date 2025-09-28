//
//  Customer.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/27/25.
//

import Foundation

struct Customer:Identifiable{
    let id = UUID()
    var name:String
    var isPremium:Bool
    var email:String
}
