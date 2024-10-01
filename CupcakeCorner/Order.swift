//
//  Order.swift
//  CupcakeCorner
//
//  Created by Grace couch on 24/09/2024.
//
import SwiftUI


@Observable
class Order: Codable {

    enum CodingKeys: String, CodingKey {
        case _flavourIndex = "flavourIndex"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraIcing = "extraIcing"
        case _extraSprinkles = "extraSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _postcode = "postcode"
    }

    static let flavours = ["Vanilla", "Chocolate", "Strawberry", "Lemon", "Salted Caramel"]

    var flavourIndex = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraIcing = false
                extraSprinkles = false
            }
        }
    }
    var extraSprinkles = false
    var extraIcing = false

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

    var cost: Decimal {
        var cost = Decimal(quantity) * 2

        cost += Decimal(flavourIndex) / 2

        if extraIcing {
             cost += Decimal(quantity)
         }

        if extraSprinkles {
             cost += Decimal(quantity) / 2
         }
        return cost
    }
}
