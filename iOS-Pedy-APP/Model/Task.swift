//
//  Task.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 12/03/25.
//

import Foundation
import SwiftData

enum Frequency: String, CaseIterable, Identifiable, Codable {
    case diario = "Diário"
    case semanal = "Semanal"
    case mensal = "Mensal"
    
    var id: String { rawValue }
}

@Model
class TaskModel: Identifiable {
    var id = UUID()
    var title: String
    var frequency: Frequency
    var date: Date?
    var isCompleted: Bool
    
    init(title: String, frequency: Frequency, date: Date? = nil, isCompleted: Bool){
        self.title = title
        self.frequency = frequency
        self.date = date
        self.isCompleted = isCompleted
    }
}

