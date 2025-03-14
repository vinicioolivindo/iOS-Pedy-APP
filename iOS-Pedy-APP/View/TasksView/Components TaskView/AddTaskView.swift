//
//  AddTaskView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/03/25.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var frequency: Frequency = .diario
    @State private var date: Date = Date()
    
    var onSave: (TaskModel) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalhes da Tarefa")) {
                    TextField("Título", text: $title)
                    
                    Picker("Frequência", selection: $frequency) {
                        ForEach(Frequency.allCases) { freq in
                            Text(freq.rawValue).tag(freq)
                        }
                    }
                    
                    DatePicker("Data", selection: $date, displayedComponents: [.date])
                }
            }
            .navigationTitle("Nova Tarefa")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let newTask = TaskModel(
                            title: title,
                            frequency: frequency,
                            date: date,
                            isCompleted: false
                        )
                        onSave(newTask)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
