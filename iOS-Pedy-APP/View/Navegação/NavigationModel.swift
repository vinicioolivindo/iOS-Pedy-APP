//
//  NavigationModel.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 03/03/25.
//

import Foundation

class AppRouter: ObservableObject {
    @Published var path: [AppScreen] = []
    
    func navigate(to screen: AppScreen) {
        path.append(screen)
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
