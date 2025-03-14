
//
//  ProfileView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//
import SwiftUI
import _SwiftData_SwiftUI

struct ProfileView: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @Query var listPets: [Pet] = []
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                if let pet = listPets.first {
                    CardPetView(pet: pet)
                } else {
                    CardPetView(pet: Pet(name: "", icon: "", animalType: "", breed: "", age: 0, gender: ""))
                }
                
                // Cards de ações
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            // Condicional para exibir RegisterView apenas se não houver pet
                            if listPets.isEmpty {
                                CardView(
                                    title: "Adicionar perfil",
                                    subtitle: "Adicione o perfil de um novo pet.",
                                    iconName: "arrow.right",
                                    destination: RegisterView()
                                )
                            } else {
                                CardView(title: "Voce ja possui um pet adicionado!", subtitle: "Caso queria mudar de pet, remova o atual clicando no card!", destination: ProfileView())
                                
                            }
                            
                            CardView(
                                title: "Histórico",
                                subtitle: "",
                                imageName: "historicoIcon",
                                destination: TasksView(initialFilter: "Concluídas")
                            )
                            
                            CardView(
                                title: "Atividades",
                                subtitle: "",
                                imageName: "atividadesIcon",
                                destination: TasksView()
                            )
                        }
                    }
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ProfileView()
}
