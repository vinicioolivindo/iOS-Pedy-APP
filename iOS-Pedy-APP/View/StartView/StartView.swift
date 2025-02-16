//
//  StartView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 16/01/25.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Seja \nBem vindo!!")
                    .bold()
                    .font(.system(size: 45))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)
                
                Image("IllustrationWelcomeImage")
                    .padding(.top, 45)
                    .padding(.bottom, 36)
                
                Text("O app perfeito para acompanhar e cuidar do seu pet diariamente.  🐾❤️")
                    .foregroundColor(Color("GrayDark"))
                
                Spacer()
                
                // Usando o NavigationLink com um CustomButton dentro
                NavigationLink("Iniciar", destination: RegisterView())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 36)
            .padding(.horizontal, 24)
        }
    }
}


#Preview {
    StartView()
}
