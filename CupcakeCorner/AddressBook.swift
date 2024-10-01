//
//  AddressBook.swift
//  CupcakeCorner
//
//  Created by Grace couch on 01/10/2024.
//

import SwiftUI

@Observable
class AddressBook {
    var items = [Address]() {
        didSet {
            if let encoded =  try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Address].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

