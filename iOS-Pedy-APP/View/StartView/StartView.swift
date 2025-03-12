//
//  StartView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 16/01/25.	
//
//
//  StartView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 16/01/25.
//
//
//  StartView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 16/01/25.
//
import SwiftUI

struct StartView: View {
    @EnvironmentObject var router: AppRouter  // Acessa o roteador global

    var body: some View {
        NavigationStack(path: $router.path) { // Usa a pilha de navegação do AppRouter
            VStack {
                Text("Seja \nBem-vindo!!")
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
                
                CustomButton(title: "Iniciar") {
                    router.path = [.homeview]
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 36)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    StartView() // Criando uma instância de AppRouter para o preview
}

