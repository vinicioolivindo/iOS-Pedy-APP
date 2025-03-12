//
//  AvatarPetView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/01/25.
//

import SwiftUI


struct AvatarPetView: View {
    @Binding var selectedIcon: String // Agora o ícone é controlado pelo componente pai
    @Binding var selectedAnimalName: String // Agora o nome do animal também é controlado pelo pai
    @State private var showIconPicker = false // Controla a exibição da popup


    var body: some View {
        ZStack {
            // Exibe o ícone selecionado
            Image(selectedIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 115, height: 115)
            
            // Botão de edição
            Button(action: {
                showIconPicker.toggle() // Abre a popup
            }) {
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Circle().fill(Color("primaryColor")))
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .offset(x: 40, y: 40)
        }
        .padding(.vertical, 24)
        .onTapGesture {
            showIconPicker.toggle() // Abre a popup ao tocar no ícone todo
        }
        .sheet(isPresented: $showIconPicker) {
            IconPicker(
                selectedIcon: $selectedIcon,
                selectedAnimalName: $selectedAnimalName,
                animalIcons: listPets,
                showIconPicker: $showIconPicker
            )
        }
    }
}

struct IconPicker: View {
    @Binding var selectedIcon: String
    @Binding var selectedAnimalName: String
    let animalIcons: [ListPets]
    @Binding var showIconPicker: Bool

    var body: some View {
        VStack {
            Text("Escolha um ícone")
                .font(.title)
                .padding()

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                ForEach(listPets, id: \.icon) { animal in
                    Button(action: {
                        selectedIcon = animal.icon
                        selectedAnimalName = animal.name
                        showIconPicker = false
                    }) {
                        VStack {
                            Image(animal.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            Text(animal.name)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                        .padding(10)
                        .background(selectedIcon == animal.icon ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()

            Button("Fechar") {
                showIconPicker = false
            }
            .padding()
        }
        .padding()
    }
}
