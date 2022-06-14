//
//  ContentView.swift
//  Dinner
//
//  Created by Anatolich Mixaill on 14.06.2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        
        

            NavigationView{
            List {
                ForEach(menu){section in
                    Section(header: Text(section.name)) {
                               ForEach(section.items) { item in
                                   Text(item.name)
                                   NavigationLink(destination: ItemDetail(item: item)) {
                                   ItemRow(item: item)
                                   }
                               }

                          }
                }
                
                    
            }
                .navigationTitle("List")

                .listStyle(GroupedListStyle())
            }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
