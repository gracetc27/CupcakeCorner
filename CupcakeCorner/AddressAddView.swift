//
//  AddressAddView.swift
//  CupcakeCorner
//
//  Created by Grace couch on 24/09/2024.
//

import SwiftUI

struct AddressAddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var address = Address()
    var addresses: AddressBook

    var body: some View {
        Form {
            Section {
                TextField("Enter name", text: $address.name)
                TextField("Enter Street Address", text: $address.streetAddress)
                TextField("Enter City", text: $address.city)
                TextField("Enter Postal Code", text: $address.postcode)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            Button("Add Address") {
                    let item = Address(name: address.name, streetAddress: address.streetAddress, city: address.city, postcode: address.postcode)
                    addresses.items.append(item)
                dismiss()
            }
            .disabled(address.hasValidAddress == false)
            }
        }
    }


#Preview {
    AddressAddView(addresses: AddressBook())
}
