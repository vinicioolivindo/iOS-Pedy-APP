//
//  AvatarPetView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/01/25.
//

import SwiftUI

struct AvatarPetView: View {
    var body: some View {
        ZStack {
            Image("IconCat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 115, height: 115)
            
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
        .onTapGesture {
            print("teste")
        }		
    }
}
