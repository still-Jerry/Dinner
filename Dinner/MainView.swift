//
//  MainView.swift
//  Dinner
//
//  Created by Anatolich Mixaill on 14.06.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }

                OrderView()
                    .tabItem {
                        Label("Order", systemImage: "square.and.pencil")
                    }
            }
        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
