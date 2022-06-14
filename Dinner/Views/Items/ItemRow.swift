//
//  ItemRow.swift
//  Bullseye_try
//
//  Created by Anatolich Mixaill on 07.06.2022.
// gjghj

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    

    var body: some View {
        let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
        HStack {
              Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))

            VStack (alignment: .leading){
                    Text(item.name)
                    .font(.headline)
                    Text(String("$\(item.price)"))
                }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
            }
          }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)        }
}
