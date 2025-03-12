//
//  iOS_Pedy_APPApp.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 07/01/25.
//

import SwiftUI
import SwiftData

@main
struct iOS_Pedy_APPApp: App {
    @StateObject private var router = AppRouter()
    @StateObject private var petManager = PetManager.shared
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(router)
                .environmentObject(petManager)
                .modelContainer(for: [Pet.self, TaskModel.self])
        }
    }
}
