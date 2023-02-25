//
//  TamagotchiAppApp.swift
//  TamagotchiApp
//
//  Created by Tummuru, Sritej (Coll) on 14/01/2023.
//

import SwiftUI

@main
struct TamagotchiAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Tamagotchi(hunger: 50, health: 100, happiness: 50, age: 0, name: "", weight: 10))
        }
    }
}
