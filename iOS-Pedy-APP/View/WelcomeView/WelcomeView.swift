//
//  WelcomeView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 15/01/25.
//
import SwiftUI

struct WelcomeView: View {
    
    @State private var isActive = false
    
    var body: some View {
        ZStack{
            if isActive{
                ContentView()
                    .transition(.opacity)
            } else {
                ZStack {
                    Image("WelcomeImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500, height:5000)
                }
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        isActive = true
                    }
                }
            }
        }.animation(.easeInOut(duration: 1), value: isActive)
    }
}

#Preview {
    WelcomeView()// Necessário para o Preview funcionar
}
