//
//  Address.swift
//  CupcakeCorner
//
//  Created by Grace couch on 01/10/2024.
//
import SwiftUI


struct Address: Codable, Hashable {
    var name = ""
    var streetAddress = ""
    var city = ""
    var postcode = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || postcode.isEmpty || postcode.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        return true
    }
}
