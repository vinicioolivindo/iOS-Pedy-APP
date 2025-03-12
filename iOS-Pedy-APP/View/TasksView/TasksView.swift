//
//  TasksView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

import SwiftUI



struct TasksView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedFilter: String = "Todas"
    @State private var tasks: [TaskModel] = [
        TaskModel(title: "Beber água", frequency: .diario, date: Date(), isCompleted: true),
        TaskModel(title: "Passeio", frequency: .semanal, date: Date(), isCompleted: false),
        TaskModel(title: "Consulta veterinária", frequency: .mensal, date: Date(), isCompleted: false)
    ]
    
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
        tasks.append(newTask)
    }
    
    func updateTask(_ updatedTask: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == updatedTask.id }) {
            tasks[index] = updatedTask
        }
    }
    
    func toggleCompletion(for task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func deleteTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    var body: some View {
        VStack {
            // Barra de pesquisa e botão de adicionar
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    TextField("Pesquise por uma tarefa...", text: .constant(""))
                        .padding(10)
                }
                .frame(width: 280)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Button(action: { showingAddTaskSheet = true }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color("primaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 75, height: 30)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            // Botões de filtro
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
            
            // Lista de tarefas
            ScrollView {
                VStack(spacing: 10) {
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
                        Text("| \(date, formatter: dateFormatter)")
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

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

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

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
