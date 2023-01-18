//
//  TamagotchiClass.swift
//  TamagotchiApp
//
//  Created by Tummuru, Sritej (Coll) on 14/01/2023.
//

import Foundation

struct Tamagotchi {
    
    var hunger: Int
    var health: Int
    var happiness: Int
    var age: Int
    var sickness: Int
    var name: String
    var weight: Int
    
    init(hunger: Int, health: Int, happiness: Int, age: Int, sickness: Int, name: String, weight: Int) {
        self.hunger = hunger
        self.health = health
        self.happiness = happiness
        self.age = age
        self.sickness = sickness
        self.name = name
        self.weight = weight
    }
    
    func displayStats() -> String {
        return """
               Hunger: \(self.hunger)
               Health: \(self.health)
               Happiness: \(self.happiness)
               Age: \(self.age)
               Sickness: \(self.sickness)
               Name: \(self.name)
               Weight: \(self.weight)
               """
    }
    
    mutating func eatSnack() {
        if self.hunger >= 10 {
            self.hunger -= 10
        }
    }
    
    mutating func eatMeal() {
        if self.hunger >= 25 {
            self.hunger -= 25
        }
        self.weight += 3
    }
}
