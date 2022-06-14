//
//  OrderView.swift
//  Dinner
//
//  Created by Anatolich Mixaill on 14.06.2022.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @State private var tipAmount = 15
    var body: some View {
            NavigationView {
                List {
                    let tipAmounts = [10, 15, 20, 25, 0]

                    Section {
                        ForEach(order.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("$\(item.price)")
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
                        Text("TOTAL: $100")
                    ) {
                        Button("Confirm order") {
                            // place the order
                        }
                    }
                }
                .navigationTitle("Order")
                .listStyle(InsetGroupedListStyle())
            }
        }}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())

    }
}
