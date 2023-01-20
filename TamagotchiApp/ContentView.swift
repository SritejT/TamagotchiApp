//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Tummuru, Sritej (Coll) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dummy = "" {
        willSet {
            tamagotchi.changeName(newName: newValue)
        }
    }
    
    @State private var tamagotchi = Tamagotchi(hunger: 50, health: 100, happiness: 50, age: 0, sickness: 0, name: "", weight: 10)
    
    @State private var remainingTime: Int = 30
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {
            TextField("Please enter your tamagotchi's name: ", text: $dummy)
            Text("Time left until \(tamagotchi.name) grows up: \(remainingTime)")
                .onReceive(timer, perform: { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    } else if self.remainingTime == 0 {
                        self.remainingTime = 30
                        tamagotchi.increaseAge()
                    }
                })
            
            Text(tamagotchi.displayStats())
                .padding()
                .onReceive(timer, perform: { _ in
                    tamagotchi.increaseHunger()
                })
            
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
