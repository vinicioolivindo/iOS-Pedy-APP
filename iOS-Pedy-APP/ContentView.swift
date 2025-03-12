//
//  ContentView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 07/01/25.
//
import SwiftUI


struct ContentView: View {
    @State private var selectedIcon: AppScreen = .homeview
    @StateObject private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                screenView(for: selectedIcon)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                NavigationBar(selectedIcon: $selectedIcon)
                    .offset(y: 10)
            }
            .navigationDestination(for: AppScreen.self) { screen in
                screenView(for: screen)
            }
        }
    }
    
    @ViewBuilder
    private func screenView(for screen: AppScreen) -> some View {
        switch screen {
        case .onboarding:
            StartView()
        case .homeview:
            HomeView()
        case .lembretes:
            TasksView()
        case .perfil:
            ProfileView()
        case .registerview:
            RegisterView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppRouter())
}
