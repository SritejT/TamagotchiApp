//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Tummuru, Sritej (Coll) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tamagotchi = Tamagotchi(hunger: 50, health: 100, happiness: 100, age: 0, sickness: 0, name: "First Tamagotchi", weight: 10)
    
    @State private var remainingTime: Int = 30 {
        didSet {
            
        }
    }
    
    var body: some View {

        VStack(alignment: .leading, spacing: 20) {
            
            Text(tamagotchi.displayStats())
                .padding()
            
            Button("Feed A Snack", action: {
                tamagotchi.eatSnack()
            })
            
            Button("Feed a Meal", action: {
                tamagotchi.eatMeal()
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
