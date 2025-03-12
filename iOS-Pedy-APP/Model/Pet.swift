
//
//  DataPets.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 03/03/25.
//

import SwiftUI
import SwiftData

@Model
class Pet: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var animalType: String
    var breed: String
    var age: String
    var size: String
    var gender: String
    
    init(name: String, icon: String, animalType: String, breed: String, age: String, size: String, gender: String) {
        self.name = name
        self.icon = icon
        self.animalType = animalType
        self.breed = breed
        self.age = age
        self.size = size
        self.gender = gender
    }
}
