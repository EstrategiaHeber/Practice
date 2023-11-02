//
//  ContentView.swift
//  ButtonCustomSsiftui
//
//  Created by ALAN CARO on 30/10/23.
//

import SwiftUI

struct BotonPersonalizado: View {
    
    let imagen: String?
    let texto: String
    let accion: () -> Void

    var body: some View {
        Button(action: accion) {
            
            if let imagen = imagen {
                Image(systemName: imagen)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
                    .background(.yellow)
            }
            else {
                Text(texto)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
//                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 0) {
            
            BotonPersonalizado(imagen: nil, texto: "Iniciar sesion") {
                print("Botón 1 presionado")
                // Realiza la acción que desees aquí
            }
           
//            BotonPersonalizado(imagen: "person", texto: "Hola") {
//                print("Boton 2 presionado")
//            }
        }
    }
}

#Preview {
    ContentView()
}
