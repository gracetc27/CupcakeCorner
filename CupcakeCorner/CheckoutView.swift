//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Grace couch on 24/09/2024.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertShown = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(order.cost, format: .currency(code: "GBP"))")
                    .font(.title)
                    .padding()

                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(alertTitle, isPresented: $alertShown) {
        } message: {
            Text(alertMessage)
        }

    }

    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            alertTitle = "Thank you!"
            alertMessage = "Your order for \(decodedOrder.quantity)x \(Order.flavours[decodedOrder.flavourIndex].lowercased()) cupcakes is on its way!"
            alertShown = true

        } catch {
            alertTitle = "Uh oh!"
            alertMessage = "Error placing order: \(error.localizedDescription)"
            alertShown = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
