//
//  CustomPickerGender.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 15/01/25.
//
import SwiftUI

struct CustomPickerGender: View {
    let options = [ "Macho", "Fêmea"] // Opções do picker
    @Binding var selectedOption: String?// Opção selecionada (Binding para permitir reutilização)
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                }) {
                    Text(option)
                }
            }
        } label: {
            HStack {
                Text(selectedOption ?? "Gênero")
                    .foregroundColor(selectedOption == nil ? .gray : .black)
                    .font(.body)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("GrayDark"), lineWidth: 1.7)
            )
        }
        Spacer()
    }
}
