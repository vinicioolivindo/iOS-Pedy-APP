
//
//  PetManager.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 03/03/25.

import SwiftUI
import SwiftData

struct CardPetView: View {
    let pet: Pet
    @Environment(\.modelContext) private var modelContext
    @State private var showingDeleteAlert = false

    var body: some View {
        HStack {
            Header(pet: pet)
        }
        .frame(maxWidth: .infinity)
        .background(Color("primaryColor"))
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .onTapGesture {
            showingDeleteAlert = true
        }
        .alert(isPresented: $showingDeleteAlert) {
            Alert(
                title: Text("Excluir Pet"),
                message: Text("Tem certeza que deseja excluir \(pet.name)?"),
                primaryButton: .destructive(Text("Excluir")) {
                    deletePet()
                },
                secondaryButton: .cancel()
            )
        }
    }

    private func deletePet() {
        modelContext.delete(pet)
    }
}
