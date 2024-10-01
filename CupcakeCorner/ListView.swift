//
//  ListView.swift
//  CupcakeCorner
//
//  Created by Grace couch on 01/10/2024.
//

import SwiftUI

struct ListView: View {
    var address: Address

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(address.name)")
            Text("\(address.streetAddress)")
            Text("\(address.city)")
            Text("\(address.postcode)")
        }
        .font(.headline)
    }
}

#Preview {
    ListView(address: Address())
}
