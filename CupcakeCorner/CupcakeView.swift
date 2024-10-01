//
//  CupcakeView.swift
//  CupcakeCorner
//
//  Created by Grace couch on 24/09/2024.
//

import SwiftUI

struct CupcakeView: View {
    @State private var order = Order()
    @State private var address: Address?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Cupcake Flavour", selection: $order.flavourIndex) {
                        ForEach(Order.flavours.indices, id: \.self) {
                            Text(Order.flavours[$0])
                        }
                    }
                    Stepper("Cupcake Quantity:  \(order.quantity)", value: $order.quantity, in: 3...24)
                    }
                Section {
                    Toggle("Special Requests", isOn: $order.specialRequestEnabled)
                    if order.specialRequestEnabled {
                        Toggle("Extra Sprinkles", isOn: $order.extraSprinkles)
                        Toggle("Extra Icing", isOn: $order.extraIcing)
                    }
                }
                Section {
                    NavigationLink("Address Details") {
                        AddressView(selectedAddress: $address)
                            .onChange(of: address) {
                                if let address {
                                    order.name = address.name
                                    order.streetAddress = address.streetAddress
                                    order.city = address.city
                                    order.postcode = address.postcode
                                }
                            }
                    }
                    if let address {
                        ListView(address: address)
                    }
                }
                Section {
                    NavigationLink("Checkout") {
                        CheckoutView(order: order)
                    }
                    .disabled(address == nil)
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}


#Preview {
    CupcakeView()
}
