//
//  InputView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 13/01/25.
//

import SwiftUI


struct InputView: View {
    
    @State private var namePet: String = ""
    @State private var typePet: String = ""
    @FocusState private var isFocused: Bool
    let textInterno: String
    
    var body: some View {
        TextField((textInterno), text: $namePet)
        
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? Color.orange : Color("GrayDark"), lineWidth: 1.7)
            )
            .focused($isFocused)
            .accentColor(isFocused ? Color("primaryColor") : Color("GrayDark"))
    
        Spacer()
    }
}
