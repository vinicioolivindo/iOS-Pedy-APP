//
//  CustomButton.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 26/01/25.
//

import SwiftUI

struct CustomButton: View {
    var title: String           // Título do botão
    var action: () -> Void      // Ação a ser executada quando o botão for clicado

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .padding(.horizontal, 150)
                .background(Color(red: 0.8, green: 0.5, blue: 0.2))
                .cornerRadius(20)
        }
    }
}
#Preview {
    CustomButton(title: "teste") {
        
    }
}
