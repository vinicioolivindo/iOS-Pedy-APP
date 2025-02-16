//
//  TasksView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let frequency: String
    let time: String?
    let isCompleted: Bool
}

struct TasksView: View {
    @State private var selectedFilter: String = "Todas"
    
    let tasks: [Task] = [
        Task(title: "Beber água", frequency: "Diário", time: "12:00", isCompleted: true),
        Task(title: "Passeio", frequency: "seg-qua-sex", time: "15:00", isCompleted: false),
        Task(title: "Consulta veterinária", frequency: "12.06.2023", time: "18:00", isCompleted: false),
        Task(title: "Beber água", frequency: "Diário", time: "12:00", isCompleted: true)
    ]
    
    // Filtrando as tarefas com base na seleção do usuário
    var filteredTasks: [Task] {
        switch selectedFilter {
        case "Concluídas":
            return tasks.filter { $0.isCompleted }
        case "Pendentes":
            return tasks.filter { !$0.isCompleted }
        default:
            return tasks
        }
    }
    
    var body: some View {
        VStack {
            // Barra de Pesquisa e Botão de Adicionar
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass") // Ícone de lupa
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    TextField("Pesquise por uma tarefa..", text: .constant(""))
                        .padding(10)
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Button(action: {}) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color("primaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            // Botões de Filtro
            HStack {
                Button(action: { selectedFilter = "Todas" }) {
                    Text("Todas")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(selectedFilter == "Todas" ? Color("primaryColor") : Color.gray.opacity(0.2))
                        .foregroundColor(selectedFilter == "Todas" ? .white : .black)
                        .cornerRadius(10)
                }
                
                Button(action: { selectedFilter = "Concluídas" }) {
                    Text("Concluídas")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(selectedFilter == "Concluídas" ? Color("primaryColor") : Color.gray.opacity(0.2))
                        .foregroundColor(selectedFilter == "Concluídas" ? .white : .black)
                        .cornerRadius(10)
                }

                Button(action: { selectedFilter = "Pendentes" }) {
                    Text("Pendentes")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(selectedFilter == "Pendentes" ? Color("primaryColor") : Color.gray.opacity(0.2))
                        .foregroundColor(selectedFilter == "Pendentes" ? .white : .black)
                        .cornerRadius(10)
                }
            }
            .padding(.vertical, 5)
            
            // Lista de Tarefas
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(filteredTasks) { task in
                        TaskCard(task: task)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TaskCard: View {
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(task.title)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "calendar")
                    Text(task.frequency)
                    
                    if let time = task.time {
                        Text("| \(time)")
                    }
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Ícones alinhados verticalmente
            VStack(spacing: 5) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(task.isCompleted ? .green : .red)
                    .font(.title)
                
                // Ícone de pata abaixo do check/uncheck
                Image("pata-icone") // Usando um ícone do Assets
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    TasksView()
}
