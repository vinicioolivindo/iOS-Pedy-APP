//
//  RegisterView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 08/01/25.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var path: [String] = []
    @State private var selectedOption = "Cachorro"
    let options = ["Cachorro", "Gato", "Pássaro", "Peixe"]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Tela de Cadastro")
                    .bold()
                    .font(.title2)
                
                
                
                Text("Cadastre seu primeiro pet: ")
                    .bold()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)
                
                
                AvatarPetView()
                
                InputView(textInterno: "Nome do Pet")
                CustomPickerView()
                InputView(textInterno: "Idade")
                InputView(textInterno: "Porte")
                CustomPickerGender()
                
                CustomButton(title: "Salvar"){
                    path.append("ContentView")
                }
                            
            }.navigationDestination(for: String.self) {destination in
                if destination == "ContentView" {
                    ContentView()
                }
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    BackButton{
                        dismiss()
                    }
                }
            }
        }
        
    }
}
#Preview {
    RegisterView()
}




