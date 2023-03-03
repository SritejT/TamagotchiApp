//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Tummuru, Sritej (Coll) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var tamagotchi: Tamagotchi
    
    @State private var remainingTime: Int = 30
    @State private var sicknessTimer = 0
    @State private var gameOpacity = 0.0
    @State private var userMove = ""
    @State private var isDead = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Form {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Section {
                        TextField("Please enter your tamagotchi's name: ",
                                  text: $tamagotchi.name
                        ).border(.secondary)
                        Text("Time left until \(tamagotchi.name) grows up: \(remainingTime)")
                            .onReceive(timer, perform: { _ in
                                if self.remainingTime > 0 {
                                    self.remainingTime -= 1
                                } else if self.remainingTime == 0 {
                                    self.remainingTime = 30
                                    tamagotchi.increaseAge()
                                }
                                
                                var i = Int.random(in: 0...50)
                                if i == 50 {
                                    tamagotchi.makeSick()
                                    sicknessTimer = 30
                                }
                                
                                if sicknessTimer > 0 {
                                    tamagotchi.sicknessTick()
                                    sicknessTimer -= 1
                                } else {
                                    tamagotchi.cureSickness()
                                }
                                
                                isDead = tamagotchi.checkIfDead()
                                
                                if isDead {
                                    timer.upstream.connect().cancel()
                                }
                            })
                    }
                    
                    Text("""
                       Hunger: \(tamagotchi.hunger)
                       Health: \(tamagotchi.health)
                       Happiness: \(tamagotchi.happiness)
                       Age: \(tamagotchi.age)
                       Sickness: \(String(tamagotchi.isSick))
                       Name: \(tamagotchi.name)
                       Weight: \(tamagotchi.weight)
                       """)
                    .padding()
                    .onReceive(timer, perform: { _ in
                        tamagotchi.increaseHunger()
                    })
                    
                    Button("Feed A Snack", action: {
                        tamagotchi.eatSnack()
                    }).disabled(isDead)
                    
                    Button("Feed a Meal", action: {
                        tamagotchi.eatMeal()
                    }).disabled(isDead)
                    
                    Button ("Give Medicine", action: {
                        tamagotchi.giveMedicine()
                    }).disabled(isDead)
                    
                    Button ("Play Game",  action: {
                        gameOpacity = 1.0
                    }).disabled(isDead)
                    
                    
                    Text("Higher Or Lower").opacity(gameOpacity)
                    TextField("Enter Move", text: $userMove)
                        .opacity(gameOpacity)
                    Button("Submit Move", action: {
                        tamagotchi.playGame(move: Int(userMove)!)
                        gameOpacity = 0.0
                    }).opacity(gameOpacity)
                    
                }
                Text("\(tamagotchi.name) is dead.").opacity({ () -> Double in
                    if isDead {
                        return 1.0
                    } else {
                        return 0.0
                    }
                }())
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Tamagotchi(hunger: 50, health: 100, happiness: 50, age: 0, name: "", weight: 10))
    }
}
