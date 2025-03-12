//
//  InputView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/01/25.
//

import SwiftUI

struct InputView: View {
    let textInterno: String // Placeholder do campo
    @Binding var text: String // Texto digitado (Binding para permitir reutilização)
    @FocusState private var isFocused: Bool // Estado de foco

    var body: some View {
        TextField(textInterno, text: $text)
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? Color.orange : Color("GrayDark"), lineWidth: 1.7)
            )
            .focused($isFocused)
            .accentColor(isFocused ? Color("primaryColor") : Color("GrayDark"))
            .keyboardType(.default) // Altere para .numberPad ou outro tipo, se necessário
            .autocapitalization(.words) // Ajuste conforme necessário
            .disableAutocorrection(false) // Ajuste conforme necessário
        Spacer()
    }
}
