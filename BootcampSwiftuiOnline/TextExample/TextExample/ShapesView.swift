//
//  ShapesView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 12/09/23.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
       
        VStack (spacing: 20) {
            
            Circle()
                /// CAMBIA EL COLOR DE RELLENO DE LA FIGURA
                //.fill(Color.orange)
                //.foregroundColor(.yellow)
            
                /// SE MARCA EL CONTORNO DE LA FIGURA CON
                /// COLOR Y GROSOR DESEADO
                //.stroke()
                //.stroke(Color.yellow)
                .stroke(Color.red, lineWidth: 10)
            
            Circle()
                /// MODIFICA TODO EL CONTORNO DE LA FIGURA
                .stroke(Color.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [10]))
            
            Circle()
                /// MODIFICA LA FIGURA
                .trim(from: 0.2, to: 1.0)
                .stroke(Color.blue, lineWidth: 10)
            
            Ellipse()
                /// MODIFICA LA FIGURA
                .trim(from: 0.2, to: 1.0)
                .frame(width: 200, height: 100)
            
            Capsule(style: .continuous)
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerRadius: 50)
                .trim(from: 0.4, to: 1.0)
                .frame(width: 300, height: 200)
            
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
