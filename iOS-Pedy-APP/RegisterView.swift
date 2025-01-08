//
//  RegisterView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 08/01/25.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // Cabeçalho
            ZStack {
                HStack {	
                    Button(action: {
                        print("Voltar clicado!")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(15)
                            .background(Rectangle().fill(Color(.white)).cornerRadius(16).shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5))
                    }
                    Spacer()
                }
                
                // Título no centro
                Text("Tela de Cadastro")
                    .bold()
                    .font(.title2)
            }
            .padding(.horizontal, 24)
            
           
            Text("Cadastre seu primeiro pet: ")
                .bold()
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 24)
            
            
            ZStack {
                    Image("IconCat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 115, height: 115)

                    // Botão no canto inferior direito
                    Button(action: {
                        print("Editar clicado!")
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Circle().fill(Color("primaryColor")))
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .offset(x: 40, y: 40)
            }
            .padding(.vertical, 24)
            
            Spacer()
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }}

#Preview {
    RegisterView()
}
