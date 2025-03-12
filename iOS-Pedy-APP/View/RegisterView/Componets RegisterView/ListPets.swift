//
//  ListPetsView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 27/02/25.
//

import Foundation

struct ListPets{
    let name: String
    let icon: String
}

let listPets: [ListPets] = [
    ListPets(name: "Gato", icon: "IconCat"),
    ListPets(name: "Cachorro", icon: "IconDog"),
    ListPets(name: "Coelho", icon: "IconRabbit"),
    ListPets(name: "Pássaro", icon: "IconBird"),
    ListPets(name: "Peixe", icon: "IconFish"),
    ListPets(name: "Pato", icon: "IconDuck")
]
