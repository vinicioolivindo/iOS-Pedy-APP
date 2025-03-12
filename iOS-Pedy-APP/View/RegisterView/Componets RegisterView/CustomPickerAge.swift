//
//  CustomPickerAge.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 12/03/25.
//
import SwiftUI

struct CustomPickerAge: View {
    @Binding var selectedAge: Int
    @State private var isPickerVisible: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                isPickerVisible.toggle() // Abre o picker ao clicar
            }) {
                HStack {
                    Text(selectedAge == 0 ? "Selecione a idade" : "\(selectedAge) anos")
                        .foregroundColor(selectedAge == 0 ? .gray : .black)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity) // Ocupa toda a largura
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("GrayDark"), lineWidth: 1.7)
                )
            }
            .sheet(isPresented: $isPickerVisible) { // Abre o picker em um modal
                Picker("Selecione a idade", selection: $selectedAge) {
                    ForEach(1...20, id: \.self) { age in
                        Text("\(age) anos").tag(age)
                    }
                }
                .pickerStyle(WheelPickerStyle()) // Picker no estilo rolagem
                .presentationDetents([.fraction(0.3)]) // Ajusta o tamanho do modal
            }
        }
        Spacer()
    }
}
