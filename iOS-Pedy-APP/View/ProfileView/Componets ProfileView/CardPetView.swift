
//
//  PetManager.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 03/03/25.

import SwiftUI
import SwiftData

struct CardPetView: View {
    
    @Query var listPets: [Pet] = []
    
    var body: some View {
        HStack{
            
            if listPets.count > 0 {
                Header(pet: listPets[0])
            } else {
                Header(pet: Pet(name: "", icon: "", animalType: "", breed: "", age: 0, gender: ""))
            }
            
        }.frame(maxWidth: .infinity)
            .background(Color("primaryColor"))
            .cornerRadius(14)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
