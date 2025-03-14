//
//  EditTaskView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/03/25.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State var task: TaskModel
    
    var onSave: (TaskModel) -> Void
    var onDelete: (TaskModel) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Editar Tarefa")) {
                    TextField("Título", text: $task.title)
                    
                    Picker("Frequência", selection: $task.frequency) {
                        ForEach(Frequency.allCases) { freq in
                            Text(freq.rawValue).tag(freq)
                        }
                    }
                    
                    DatePicker("Data", selection: Binding(
                        get: { task.date ?? Date() },
                        set: { task.date = $0 }
                    ), displayedComponents: [.date])
                }
                
                Section {
                    Button(action: {
                        onDelete(task)
                        dismiss()
                    }) {
                        HStack {
                            Spacer()
                            Text("Excluir Tarefa")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Editar Tarefa")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        onSave(task)
                        dismiss()
                    }
                }
            }
        }
    }
}
