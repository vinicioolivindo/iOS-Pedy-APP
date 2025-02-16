//
//  ProfileView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var countPets: Int = 1
    @State private var selectedIcon: Int = 3
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Perfis ativos de Pets")
                        .underline()
                    Text("\(countPets)")
                        .fontWeight(.bold)
                }
                .font(.title2)
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        // Nome do Pet
                        Text("Maxi")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .underline()
                        
                        
                        Text("Cachorro | Border Collie")
                            .font(.subheadline)
                            .underline()
                            .foregroundColor(.white)
                    }
                    
                    VStack{
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("primaryColor"))
                .cornerRadius(14)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                VStack{
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            CardView(title: "Adicionar perfil", subtitle: "Adicione o perfil de um novo pet.", iconName: "arrow.right")
                            CardView(title: "Histórico", subtitle: "", imageName: "imgHistorico")
                            CardView(title: "Mais informações", subtitle: "", imageName: "info")
                            CardView(title: "Atividades", subtitle: "", imageName: "activity")
                        }
                    }
                }
            }.padding()
        }
    }
}

#Preview{
    ProfileView()
}
