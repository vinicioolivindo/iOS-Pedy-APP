
//
//  PetManager.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 03/03/25.
//

import Foundation
import SwiftData
import SwiftUI

class PetManager: ObservableObject {
    
    static var shared = PetManager()
    @Query var pets: [Pet] = []
    @Published var activePet: Pet
    
    private init() {
        self.activePet = Pet(name: "" , icon: "", animalType: "", breed: "", age: 0, gender: "")
    }

//    func addPet(_ pet: Pet) {
//        pets.append(pet)
//        activePet = pet
//    }
    
    func getPet(){
        if(pets.count > 0){
            activePet = pets[0]
        }
    }
}
