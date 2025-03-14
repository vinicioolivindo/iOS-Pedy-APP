//
//  FilterButtons.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/03/25.
//

// FilterButtons.swift

import SwiftUI

struct FilterButtons: View {
    @Binding var selectedFilter: String
    
    var body: some View {
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
    }
}
