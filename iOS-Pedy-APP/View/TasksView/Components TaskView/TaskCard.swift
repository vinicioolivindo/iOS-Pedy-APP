//
//  TaskCard.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/03/25.
//

// TaskCard.swift

import SwiftUI

// Formatação de data
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium // ou .short dependendo de como você quer formatar a data
    return formatter
}()

struct TaskCard: View {
    let task: TaskModel
    let toggleCompletion: (TaskModel) -> Void
    let deleteTask: (TaskModel) -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted, color: .gray)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
                
                HStack {
                    Image(systemName: "calendar")
                    Text(task.frequency.rawValue)
                    
                    if let date = task.date {
                        Text("|\(date, formatter: dateFormatter)")
                    }
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                Button(action: { toggleCompletion(task) }) {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(task.isCompleted ? .green : .red)
                        .font(.title)
                }
                
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .contextMenu {
            Button(role: .destructive) {
                deleteTask(task)
            } label: {
                Label("Excluir", systemImage: "trash")
            }
        }
    }
}
