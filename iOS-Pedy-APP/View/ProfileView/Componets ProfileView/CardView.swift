//
//  CardView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 15/02/25.
//

import SwiftUI

struct CardView<Destination: View>: View {
    var title: String
    var subtitle: String
    var iconName: String? = nil
    var imageName: String? = nil
    var destination: Destination? // Tela de destino genérica

    var body: some View {
        // Verifica se há um destino válido
        if let destination = destination {
            NavigationLink(destination: destination) {
                cardContent
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            cardContent
        }
    }

    // Conteúdo do card (reutilizável)
    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 122)
            }
            
            Text(title)
                .font(.headline)
                .bold()
                .underline()

            if !subtitle.isEmpty {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            if let iconName = iconName {
                HStack {
                    Spacer()
                    Image(systemName: iconName)
                        .foregroundColor(.orange)
                }
            }
        }
        .frame(maxHeight: 168)
        .frame(maxWidth: 155)
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 10, x: -3, y: -3)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Adicionar perfil", subtitle: "Adicione o perfil de um novo pet.", iconName: "arrow.right", destination: TasksView())    }
}	
