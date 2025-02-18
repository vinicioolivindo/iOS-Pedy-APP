//
//  HomeView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Cabeçalho
                HStack {
                    Text("Olá 👋")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        // Ação do botão de notificações
                    }) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                }
                .padding(.horizontal)
                
                // Mensagem de boas-vindas
                Text("Bem-vindo!\nCuide dos seus pets com facilidade")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
                // Seção "Cuidados de hoje"
                VStack(alignment: .leading, spacing: 10) {
                    Text("Cuidados de hoje")
                        .font(.custom("Poppins-Regular", size: 20))                        .bold()
                        .padding(.horizontal)
                    
                    VStack(spacing: 10) {
                        VStack(spacing: 10) {
                            TaskCardView(title: "Beber água", subtitle: "All days | 09:30", color: Color(red: 0.0, green: 0.51, blue: 0.89)) // Cor 0082E2 aplicada
                            TaskCardView(title: "Consulta veterinária", subtitle: "12.06.2023 | 09:30", color: Color(red: 1.0, green: 0.39, blue: 0.40)) // Cor FF6367 aplicada
                        }
                    }
                    .padding(.horizontal)
                    
                    // Botão "Ver todos"
                    HStack {
                        Spacer()
                        Button(action: {
                            // Ação do botão
                        }) {
                            HStack {
                                Text("Ver todos")
                                    .foregroundColor(.black)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Seção de progresso
                VStack(alignment: .leading, spacing: 10) {
                    Text("Progresso")
                        .font(.custom("Poppins-Regular", size: 20))                        .bold()
                        .padding(.horizontal)
                    
                    ProgressCardView()
                        .padding(.horizontal)
                }
            }
        }
    }
}

// Componente de TaskCard
struct TaskCardView: View {
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
                Text(title)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(15)
    }
}

// Componente de Progresso
struct ProgressCardView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Parabéns,")
                    .font(.headline)
                    .foregroundColor(Color("primaryColor"))
                    .bold()
                Text("80% das tarefas para este mês foram concluídas")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Substitua o coração pela imagem "image-home-process"
            Image("image-home-process") // Usando o nome da imagem sem a extensão
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

// Preview
#Preview {
    HomeView()
}
