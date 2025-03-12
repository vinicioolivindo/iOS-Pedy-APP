//
//  CustomPickerView.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 14/01/25.
//

import SwiftUI

struct CustomPickerPet: View {
    var options: [String] = []
    @Binding var selectedOption: String
    @State private var isFocused: Bool = false
    
    var body: some View {
           VStack {
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
                       Text(selectedOption)
                           .foregroundColor(.black)
                           .font(.body)
                       
                       Spacer()
                       
                       Image(systemName: "chevron.right")
                           .foregroundColor(.gray)
                   }
                   .padding(.vertical, 20)
                   .padding(.horizontal, 24)
                   .background(
                       RoundedRectangle(cornerRadius: 16)
                           .stroke(isFocused ? Color.orange : Color("GrayDark"), lineWidth: 1.7)
                   )            }
               
           }
           Spacer()
       }
   }


