//
//  CheckoutView.swift
//  Dinner
//
//  Created by Anatolich Mixaill on 14.06.2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    var body: some View {
        let paymentTypes = ["Cash", "Credit Card", "Dinner Points"]
        let tipAmounts = [10, 15, 20, 25, 0]

        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                       
                    }
                    Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                    if addLoyaltyDetails {
                        TextField("Enter your iDine ID", text: $loyaltyNumber)
                    }
                }
            }
            Section {
                NavigationLink(destination: CheckoutView()) {

                    Text("Place Order")
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("TOTAL: \(totalPrice)")
            ) {
                Button("Confirm order") {
                    // place the order
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
       

    }
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
