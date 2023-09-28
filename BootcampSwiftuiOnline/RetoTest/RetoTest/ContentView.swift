//
//  ContentView.swift
//  RetoTest
//
//  Created by ALAN CARO on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var limiteInferior: String = "0"
    @State private var limiteSuperior: String = "0"
    
    let numeroNataly = "5579242901"
    let numeroHeber = "5528603054"
    let message = "¡Ayuda! No pude hacer uso de la aplicacion"
    
//    @State private var numerosDisponibles: Set<Int> = []
    
//    var numerosReto: [Int] = []
    
//    @State private var numeroAleatorio: Int?
    
    var body: some View {
        VStack {
            
            if let numero = viewModel.numeroAleatorio {
                Text("El numero de hoy es: \(numero)")
            } 
            
            HStack {
                Text("Minimo")
                
                TextField("Inferior", text: $limiteInferior)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
            }
            .onChange(of: limiteInferior) { nuevoValor in
                viewModel.actualizarNumerosDisponibles(limiteInferior: limiteInferior, limiteSuperior: limiteSuperior)
            }
            
            HStack {
                Text("Máximo")
                
                TextField("Superior", text: $limiteSuperior)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
            }
            .onChange(of: limiteSuperior) { nuevoValor in
                viewModel.actualizarNumerosDisponibles(limiteInferior: limiteInferior, limiteSuperior: limiteSuperior)
                //print("Se modifico")
            }
            
            Button("Obtener número") {
                // Actualizar el conjunto cuando se presiona el botón
                //numerosDisponibles = Set((Int(limiteInferior) ?? 0)...(Int(limiteSuperior) ?? 0))
                
//                print(viewModel.numerosDisponibles)
                viewModel.generarNumeroAleatorioUnico()
            }
            
            Button {
                openWhatsApp()
//                contactoView = false
                
            } label: {
                Text("Enviar Nataly")
                    .padding()
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .background(.blue)
                    .padding(.bottom)
            }
        }
        .padding()
        .onAppear{
            print(viewModel.numerosDisponibles)
            //viewModel.eliminarElementos()
            viewModel.recuperarElementos()
        }
    }
    
    private func openWhatsApp() {
        let whatsappURL = URL(string: "https://wa.me/\(numeroNataly)?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")

        if let url = whatsappURL, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("No hay whatsap")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
