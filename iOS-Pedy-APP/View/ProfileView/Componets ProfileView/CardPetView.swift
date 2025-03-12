//
//  CardPetView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 28/02/25.
//

import SwiftUI
import SwiftData

struct CardPetView: View {
    
//    struct dataPet {
//        let name: String
//        let type: String
//        let image: String
//        let petAtivo: Bool
//        
//    }
    
    @Query var listPets: [Pet] = []
    @ObservedObject var petManager: PetManager
    //    var namePet: String = ""
//    var type: String = ""
//    var breed: String = ""
//    var image: String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8) {
                // Nome do Pet
                Text(listPets.count > 0 ? "Nenhum pet adicionado" : listPets[0].name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .underline()
                
                
                Text(petManager.activePet.animalType.isEmpty || petManager.activePet.breed.isEmpty ? "Adcione um pet para começar" : "\(petManager.activePet.animalType) | \(petManager.activePet.breed)" )
                    .font(.subheadline)
                    .underline()
                    .foregroundColor(.white)
            }
            
            VStack{
                Image(petManager.activePet.icon.isEmpty ? "NonePetIcon" : petManager.activePet.icon)
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
            }
        }.frame(maxWidth: .infinity)
            .background(Color("primaryColor"))
            .cornerRadius(14)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .onAppear{
                petManager.getPet()
            }
    }
}

//#Preview {
//    CardPetView()
//}
