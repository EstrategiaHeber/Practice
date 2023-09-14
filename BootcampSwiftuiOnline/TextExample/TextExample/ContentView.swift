//
//  ContentView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /// MAYUSCULAS
        //Text("Hello World".uppercased())
        
        /// MINUSCULAS
        //Text("Hello World".lowercased())
        
        /// MAYUSCULA PRIMER LETRA DE UNA PALABRA
        //Text("hello world".capitalized)
        Text("hello world")
            //.font(.body)
            //.fontWeight(.regular)
            //.bold()
            
            /// SUBRAYAR TEXTO, CON COLOR DE LINEA
            //.underline()
            .underline(true, color: Color.blue)
            //.italic()
            
            /// RAYAR TEXTO, CON COLOR DE LINEA
            //.strikethrough(true, color: Color.green)
            
            /// TAMAÑO, Y FUENTE DE LA LETRA
            //.font(.system(size: 24, weight: .heavy, design: .rounded))
            //.baselineOffset(-50.0)
            /// DISTANCIA ENTRE LETRAS
            //.kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.yellow)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
