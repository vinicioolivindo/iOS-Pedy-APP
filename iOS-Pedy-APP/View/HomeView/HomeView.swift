//
//  HomeView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 18/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedIcon: Int = 1
    
    var body: some View {
        VStack{
            Text("Tela de Home")
        }
        .navigationBarBackButtonHidden(true)
    }
}
    
#Preview {
    HomeView()
}
    
