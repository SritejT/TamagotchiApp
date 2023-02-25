//
//  TamagotchiClass.swift
//  TamagotchiApp
//
//  Created by Tummuru, Sritej (Coll) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    
    @Published var hunger: Int
    @Published var health: Int
    @Published var happiness: Int
    @Published var age: Int
    @Published var isSick: Bool
    @Published var name: String
    @Published var weight: Int
    
    init(hunger: Int, health: Int, happiness: Int, age: Int, name: String, weight: Int) {
        self.hunger = hunger
        self.health = health
        self.happiness = happiness
        self.age = age
        self.isSick = false
        self.name = name
        self.weight = weight
    }
    
    func eatSnack() {
        if self.hunger >= 10 {
            self.hunger -= 10
        }
    }
    
    func eatMeal() {
        if self.hunger >= 25 {
            self.hunger -= 25
        }
        self.weight += 3
        self.happiness += 10
    }
    
    func increaseAge() {
        self.age += 1
    }
    
    func increaseHunger() {
        self.hunger += 1
    }
    
    func changeName(newName: String) {
        self.name = newName
    }
    
    func makeSick() {
        self.isSick = true
        self.hunger = 10
        self.happiness = 10
    }
    
    func cureSickness() {
        self.isSick = false
    }
    
    func sicknessTick() {
        self.happiness -= 1
        self.hunger -= 1
        self.health -= 3
    }
    
    func giveMedicine() {
        self.happiness += 10
        self.hunger += 20
        self.health += 20
    }
    
    func playGame(move: Int) {
        
        let tamagotchiMove = Int.random(in: 1...50)
        if move > tamagotchiMove {
            self.happiness += 20
        } else if move < tamagotchiMove {
            self.happiness += 10
        } else {
            self.happiness += 30
        }
    }
    
    func checkIfDead() -> Bool {
        if hunger > 100 || health < 0 || age > 15 || happiness < 0 {
            return true
        } else {
            return false
        }
    }
}
