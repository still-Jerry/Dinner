//
//  ItemDetail.swift
//  Bullseye_try
//
//  Created by Anatolich Mixaill on 14.06.2022.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    var body: some View {
        
        VStack {
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            ZStack(alignment: .bottom) {
                Image(item.mainImage)
                    .resizable()
//                    .scaledToFill()
                    .scaledToFit()
                    
                Text("Photo: \(item.photoCredit)")
                    .background(Color.black)
                    .padding(4)
                    .font(.caption)
                    .foregroundColor(.white)
            }

            Text(item.description)
                .padding()
            Spacer()
            }
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)

    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                   ItemDetail(item: MenuItem.example).environmentObject(Order())               }

    }
}
