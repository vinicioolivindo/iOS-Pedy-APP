//
//  HeaderView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 12/03/25.
//
import SwiftUI

struct Header: View {
    let pet: Pet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(pet.name.isEmpty ? "Nenhum pet adicionado" : pet.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .underline()
            
            
            Text(pet.animalType.isEmpty || pet.breed.isEmpty ? "Adicione um pet para começar" : "\(pet.animalType) | \(pet.breed)" )
                .font(.subheadline)
                .underline()
                .foregroundColor(.white)
        }.padding(.horizontal, 20)
        
        Spacer()
        
        VStack{
            Image(pet.icon.isEmpty ? "NonePetIcon" : pet.icon)
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
        }
    }
}
