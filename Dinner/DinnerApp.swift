//
//  DinnerApp.swift
//  Dinner
//
//  Created by Anatolich Mixaill on 14.06.2022.
//

import SwiftUI

@main
struct DinnerApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
