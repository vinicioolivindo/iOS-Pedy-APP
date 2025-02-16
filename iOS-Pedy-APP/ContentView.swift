//
//  ContentView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 07/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIcon: Int = 1

    var body: some View {
        VStack {
            Group {
                switch selectedIcon {
                case 1:
                    AnyView(HomeView())
                case 2:
                    AnyView(TasksView())
                case 3:
                    AnyView(ProfileView())
                default:
                    AnyView(Text("Tela não encontrada!"))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            NavigationBar(selectedIcon: $selectedIcon)
        }
    }
}

#Preview {
    ContentView()
}
