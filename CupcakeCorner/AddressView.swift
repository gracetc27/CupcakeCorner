//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Grace couch on 01/10/2024.
//

import SwiftUI

struct AddressView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var addresses = AddressBook()
    @Binding var selectedAddress: Address?

    var body: some View {
        NavigationStack {
            List {
                ForEach(addresses.items, id: \.self) { address in
                    Button {
                        selectedAddress = address
                        dismiss()
                    } label: {
                        ListView(address: address)
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationTitle("Shipping Address")
            .toolbar {
                NavigationLink("Add New Address") {
                    AddressAddView(addresses: addresses)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedAddress: Address?
    AddressView(selectedAddress: $selectedAddress)
}
