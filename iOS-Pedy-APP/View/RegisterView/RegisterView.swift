//
//  RegisterView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 08/01/25.
//

import SwiftUI
import SwiftData

struct RegisterView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var selectedIcon = "IconCat"
    @State private var selectedAnimalName = "Gato"
    @State private var petName: String = ""
    @State private var petBreed: String = ""
    @State private var petAge: Int = 0
    @State private var petGender: String? = nil

    var body: some View {
        NavigationStack {
            VStack {
                Text("Tela de Cadastro")
                    .bold()
                    .font(.title2)

                Text("Cadastre seu primeiro pet: ")
                    .bold()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)

                AvatarPetView(selectedIcon: $selectedIcon, selectedAnimalName: $selectedAnimalName)

                InputView(textInterno: "Nome do Pet", text: $petName)
                CustomPickerPet(options: listPets.map { $0.name }, selectedOption: $selectedAnimalName)
                InputView(textInterno: "Raça", text: $petBreed)
                CustomPickerAge(selectedAge: $petAge)
                CustomPickerGender(selectedOption: $petGender)

                CustomButton(title: "Salvar") {
                    let newPet = Pet(
                        name: petName,
                        icon: selectedIcon,
                        animalType: selectedAnimalName,
                        breed: petBreed, // Adicione um campo para raça se necessário
                        age: petAge,
                        gender: petGender!
                  )
//                    petManager.addPet(newPet)
                    context.insert(newPet)
                    dismiss()
                }
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton {
                        dismiss()
                    }
                }
            }
        }
    }
}
#Preview {
    RegisterView()
}

    
