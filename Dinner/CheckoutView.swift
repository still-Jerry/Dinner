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
    var body: some View {
        let paymentTypes = ["Cash", "Credit Card", "Dinner Points"]

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
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
       

    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
