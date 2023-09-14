//
//  ContentView.swift
//  ImagenReflejo
//
//  Created by ALAN CARO on 07/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        List {
//            ForEach(0..<5) { index in
//                VStack {
//                    Image("TestFoto") // Reemplaza "tu_imagen" con el nombre de tu imagen
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200)
//                        .opacity(1.0 - Double(index) * 0.2) // Opacidad decreciente
//                        .rotationEffect(.degrees(180)) // Voltea la imagen verticalmente
//                        .clipShape(Rectangle()) // Asegura que la imagen sea rectangular
//                        .padding(.bottom, 10) // Espacio entre las imágenes
//                    Text("TestFoto \(index + 1)")
//                }
//            }
//        }
        ZStack {
            Image("TestFoto") // Reemplaza "tu_imagen" con el nombre de tu imagen
                .resizable()
                .scaledToFit()
            
            Image("TestFoto") // Duplica la imagen
                .resizable()
                .scaledToFit()
            //                        .frame(width: 200, height: 200)
                .opacity(0.4) // Opacidad del reflejo
                .rotationEffect(.degrees(180)) // Voltea la imagen verticalmente
                .offset(y: 150) // Ajusta la posición vertical del reflejo
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



