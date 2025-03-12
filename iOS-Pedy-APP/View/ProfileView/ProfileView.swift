
//
//  ProfileView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

//
//  ProfileView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

import SwiftUI

struct ProfileView: View {

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                
                CardPetView()
                
//                HStack {
//                    Text("Perfis ativos de Pets")
//                        .underline()
//                    Text("\(petManager.pets.count)")
//                        .fontWeight(.bold)
//                }
//                                   .font(.title2)
//                // Layout do perfil do pet (ou mensagem de "Nenhum pet adicionado")
//                HStack {
//                    VStack(alignment: .leading, spacing: 8) {
//                        // Nome do pet ou mensagem de "Nenhum pet adicionado"
//                        Text(petManager.activePet?.name ?? "Nenhum pet adicionado")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//
//                        // Tipo e raça do pet (ou espaço reservado)
//                        Text(petManager.activePet != nil ? "\(petManager.activePet!.animalType) | \(petManager.activePet!.breed)" : "Adicione um pet para começar")
//                            .font(.subheadline)
//                            .underline()
//                            .foregroundColor(.white)
//                    }.padding()
//
//                    Spacer()
//
//                    // Imagem do pet ou imagem padrão
//                    Image(petManager.activePet?.icon ?? "NonePetIcon") // Substitua "defaultPetIcon" pelo nome da sua imagem padrão
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 16)
//                }
//                .frame(maxWidth: .infinity)
//                .background(Color("primaryColor"))
//                .cornerRadius(14)
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                // Cards de ações
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            CardView(
                                title: "Adicionar perfil",
                                subtitle: "Adicione o perfil de um novo pet.",
                                iconName: "arrow.right",
                                destination: RegisterView()
                            )

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
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview{
    ProfileView()
}
