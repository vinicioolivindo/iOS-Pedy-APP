//
//  NavigationBar.swift
//  iOS-Pedy-APP
//
//  Created by iredefbmac_23 on 26/01/25.
//

import SwiftUI

struct NavigationBar: View {
@Binding var selectedIcon: Int// Binding para controlar a tela ativa

var body: some View {
    ZStack(alignment: .bottom) {
        HStack {
            Spacer()
            
            Button(action: {
                selectedIcon = 1
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                        .padding()
                        .foregroundColor(selectedIcon == 1 ? Color("primaryColor") : Color("GrayDark"))
                    Text("Início")
                        .font(.caption)
                        .foregroundColor(selectedIcon == 1 ? Color("primaryColor") : Color("GrayDark"))
                }
            }
            Spacer()
            
            Button(action: {
                selectedIcon = 2
            }) {
                VStack {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 24))
                        .padding()
                        .foregroundColor(selectedIcon == 2 ? Color("primaryColor") : Color("GrayDark"))
                    Text("Lembretes")
                        .font(.caption)
                        .foregroundColor(selectedIcon == 2 ? Color("primaryColor") : Color("GrayDark"))
                }
            }
                
            Spacer()
            
            Button(action: {
                selectedIcon = 3
            }) {
                VStack {
                    Image(systemName: "person")
                        .font(.system(size: 24))
                        .padding()
                        .foregroundColor(selectedIcon == 3 ? Color("primaryColor") : Color("GrayDark"))
                    Text("Perfil")
                        .font(.caption)
                        .foregroundColor(selectedIcon == 3 ? Color("primaryColor") : Color("GrayDark"))                }
                
            }
            Spacer()
        }
        .frame(height: 90)
        .background(
            Color.white
                .cornerRadius(30, corners: [.topLeft, .topRight]) // Borda arredondada preservada
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -8) // Sombra aplicada no topo
        )        }
    .edgesIgnoringSafeArea(.bottom)
}
}

extension View {
func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
}
}

struct RoundedCorner: Shape {
var radius: CGFloat
var corners: UIRectCorner

func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
        roundedRect: rect,
        byRoundingCorners: corners,
        cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
}
}

#Preview {
    NavigationBar(selectedIcon: .constant(1))
}
