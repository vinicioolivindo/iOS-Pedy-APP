//
//  BackButton.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 26/01/25.
//

import SwiftUI

import SwiftUI

struct BackButton: View {
    var action: () -> Void  
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .padding(15)
                .background(Rectangle().fill(Color(.white)).cornerRadius(16).shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5))
        }
        .frame(maxWidth: .infinity, alignment: .leading) 
    }
}
#Preview {
    BackButton(){
        
    }
}
