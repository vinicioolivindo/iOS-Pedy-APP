//
//  TasksView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

// TasksView.swift
import SwiftUI
import _SwiftData_SwiftUI

struct TasksView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var selectedFilter: String = "Todas"
    
    @Query private var tasks: [TaskModel] = [ ]
    
    @State private var showingAddTaskSheet = false
    @State private var editingTask: TaskModel? = nil
    
    init(initialFilter: String = "Todas") {
        _selectedFilter = State(initialValue: initialFilter)
    }
    
    var filteredTasks: [TaskModel] {
        switch selectedFilter {
        case "Concluídas":
            return tasks.filter { $0.isCompleted }
        case "Pendentes":
            return tasks.filter { !$0.isCompleted }
        default:
            return tasks
        }
    }
    
    func addTask(_ newTask: TaskModel) {
        let task = TaskModel(title: newTask.title, frequency: newTask.frequency, date: newTask.date, isCompleted: newTask.isCompleted)
        modelContext.insert(task)
        try? modelContext.save()
    }
    
    func updateTask(_ updatedTask: TaskModel) {
        if let task = tasks.first(where: { $0.id == updatedTask.id }) {
            task.title = updatedTask.title
            task.frequency = updatedTask.frequency
            task.date = updatedTask.date
            task.isCompleted = updatedTask.isCompleted
            try? modelContext.save()
        }
    }
    
    func toggleCompletion(for task: TaskModel) {
        if let taskToToggle = tasks.first(where: { $0.id == task.id }) {
            taskToToggle.isCompleted.toggle()
        }
    }
    
    func deleteTask(_ task: TaskModel) {
        modelContext.delete(task)
    }
    
    var body: some View {
        VStack {
            Text("Tela de lembretes")
                .bold()
                .font(.title2)
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    TextField("Pesquise por uma tarefa...", text: .constant(""))
                        .padding(10)
                }
                .frame(height: 54)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Button(action: { showingAddTaskSheet = true }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color("primaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 54)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            FilterButtons(selectedFilter: $selectedFilter)
            
            ScrollView {
                VStack(spacing: 10) {
                    if filteredTasks.isEmpty {
                        Text("Sem lembretes")
                            .foregroundColor(.gray)
                            .padding(.top, 20)
                    } else {
                        ForEach(filteredTasks) { task in
                            TaskCard(task: task,
                                     toggleCompletion: toggleCompletion,
                                     deleteTask: deleteTask)
                            .onTapGesture {
                                editingTask = task
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $showingAddTaskSheet) {
            AddTaskView { newTask in
                addTask(newTask)
            }
        }
        .sheet(item: $editingTask) { task in
            EditTaskView(task: task,
                         onSave: { updatedTask in updateTask(updatedTask) },
                         onDelete: { task in deleteTask(task) })
        }
    }
}

#Preview {
    TasksView()
}
